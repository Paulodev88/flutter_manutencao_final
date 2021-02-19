import 'package:get_it/get_it.dart';
import 'package:manutencao_parse/models/manutencao.dart';

import 'package:manutencao_parse/repositories/manutencao_repository.dart';
import 'package:manutencao_parse/stores/user_menager_store.dart';
import 'package:mobx/mobx.dart';

part 'myMaintenance_store.g.dart';

class MyMaintenanceStore = _MyMaintenanceStore with _$MyMaintenanceStore;

abstract class _MyMaintenanceStore with Store {
  _MyMaintenanceStore() {
    _getMyMaintenance();
  }
  @observable
  List<Manutencao> allMaintenance = [];

  @computed
  List<Manutencao> get activeMaintenance => allMaintenance
      .where((manutencao) => manutencao.status == ManutencaoStatus.CONCLUIDA)
      .toList();
  List<Manutencao> get pendenteMaintenance => allMaintenance
      .where((manutencao) => manutencao.status == ManutencaoStatus.PENDENTE)
      .toList();
  List<Manutencao> get deletadoMaintenance => allMaintenance
      .where((manutencao) => manutencao.status == ManutencaoStatus.DELETADA)
      .toList();

  Future<void> _getMyMaintenance() async {
    final user = GetIt.I<UserMenagerStore>().user;

    try {
      loading = true;
      allMaintenance = await ManutencaoRepository().getMyMaintenance(user);
      loading = false;
    } catch (e) {
      print(e);
    }
  }

  @observable
  bool loading = false;

  void refresh() => _getMyMaintenance();
}
