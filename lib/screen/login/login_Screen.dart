import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:manutencao_parse/componets/error_box.dart';
import 'package:manutencao_parse/screen/signup/sign_Up_Screen.dart';
import 'package:manutencao_parse/stores/login_store.dart';

class LoginScreen extends StatelessWidget {
  final LoginStore loginStore = LoginStore();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue[900],
            Colors.blue[200],
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Entrar', style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 8,
                margin: EdgeInsets.symmetric(horizontal: 32),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Acessar com E-mail",
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                        textAlign: TextAlign.center,
                      ),
                      Observer(builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: ErrorBox(message: loginStore.error),
                        );
                      }),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                        child: Text(
                          "E-mail",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Observer(builder: (_) {
                        return TextField(
                          enabled: !loginStore.loading,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              isDense: true,
                              errorText: loginStore.emailError),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: loginStore.setEmail,
                        );
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 3,
                            bottom: 4,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Senha",
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w700),
                              ),
                              GestureDetector(
                                child: Text(
                                  "Esqueceu sua senha?",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue),
                                ),
                                onTap: () {},
                              )
                            ],
                          )),
                      Observer(builder: (_) {
                        return TextField(
                          enabled: !loginStore.loading,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              isDense: true,
                              errorText: loginStore.passwordError),
                          obscureText: true,
                          onChanged: loginStore.setPassword,
                        );
                      }),
                      Observer(builder: (_) {
                        return Container(
                          height: 40,
                          margin: const EdgeInsets.only(top: 20, bottom: 20),
                          child: RaisedButton(
                            color: Colors.purple,
                            disabledColor: Colors.purple[100],
                            onPressed: loginStore.loginPressed,
                            child: loginStore.loading
                                ? CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : Text(
                                    "ENTRAR",
                                    style: TextStyle(color: Colors.white),
                                  ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        );
                      }),
                      Divider(color: Colors.black),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Não tem uma conta? ",
                              style: TextStyle(fontSize: 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => SignUpScreen()));
                              },
                              child: Text(
                                "Cadastra-se",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
