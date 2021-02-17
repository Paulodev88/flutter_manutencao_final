import 'package:manutencao_parse/models/user.dart';
import 'package:manutencao_parse/repositories/parse_errors.dart';
import 'package:manutencao_parse/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserRepository {
  Future<User> signUp(User user) async {
    final parseUser = ParseUser(user.email, user.password, user.email);

    parseUser.set<String>(KeyUserName, user.name);
    parseUser.set<String>(KeyUserPhone, user.phone);
    parseUser.set(KeyUserType, user.type.index);
    

    final response = await parseUser.signUp();

    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  Future<User> loginWithEmail(String email, String password) async {
    final parseUser = ParseUser(email, password, null);

    final response = await parseUser.login();

    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  Future<User> currentUser() async {
    final parseUser = await ParseUser.currentUser();
    if (ParseUser != null) {
      final response =
          await ParseUser.getCurrentUserFromServer(parseUser.sessionToken);
      if (response.success) {
        return mapParseToUser(response.result);
      } else {
        await parseUser.logout();
      }
    }
    return null;
  }

  Future<void> save(User user) async {
    final ParseUser parseUser = await ParseUser.currentUser();

    if (parseUser != null) {
      parseUser.set<String>(KeyUserName, user.name);
      parseUser.set<String>(KeyUserPhone, user.phone);
      parseUser.set<int>(KeyUserType, user.type.index);
      

      if (user.password != null) {
        parseUser.password = user.password;
      }

      final response = await parseUser.save();

      if (!response.success)
        return Future.error(ParseErrors.getDescription(response.error.code));

      if (user.password != null) {
        await parseUser.logout();

        final loginResponse =
            await ParseUser(user.email, user.password, user.email).login();

        if (!loginResponse.success)
          return Future.error(ParseErrors.getDescription(response.error.code));
      }
    }
  }

  User mapParseToUser(ParseUser parseUser) {
    return User(
        id: parseUser.objectId,
        name: parseUser.get(KeyUserName),
        email: parseUser.get(KeyUserEmail),
        phone: parseUser.get(KeyUserPhone),
        type: UserType.values[parseUser.get(KeyUserType)],
        createdAt: parseUser.get(KeyUserCreatedAt));
  }
}
