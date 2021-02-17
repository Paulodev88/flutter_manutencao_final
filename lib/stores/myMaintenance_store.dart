import 'package:get_it/get_it.dart';

import 'package:manutencao_parse/repositories/manutencao_repository.dart';
import 'package:manutencao_parse/stores/user_menager_store.dart';
import 'package:mobx/mobx.dart';

part 'myMaintenance_store.g.dart';

class MyMaintenanceStore = _MyMaintenanceStore with _$MyMaintenanceStore;

abstract class _MyMaintenanceStore with Store {
  _MyMaintenanceStore() {
    _getMyMaintenance();
  }

  Future<void> _getMyMaintenance() async {
    final user = GetIt.I<UserMenagerStore>().user;
    ManutencaoRepository().getMyMaintenance(user);

    final manutencao = await ManutencaoRepository().getMyMaintenance(user);
    print(manutencao);
  }
}
