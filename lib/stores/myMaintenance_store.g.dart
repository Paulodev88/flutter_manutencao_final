// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myMaintenance_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyMaintenanceStore on _MyMaintenanceStore, Store {
  Computed<List<Manutencao>> _$activeMaintenanceComputed;

  @override
  List<Manutencao> get activeMaintenance => (_$activeMaintenanceComputed ??=
          Computed<List<Manutencao>>(() => super.activeMaintenance,
              name: '_MyMaintenanceStore.activeMaintenance'))
      .value;

  final _$allMaintenanceAtom = Atom(name: '_MyMaintenanceStore.allMaintenance');

  @override
  List<Manutencao> get allMaintenance {
    _$allMaintenanceAtom.reportRead();
    return super.allMaintenance;
  }

  @override
  set allMaintenance(List<Manutencao> value) {
    _$allMaintenanceAtom.reportWrite(value, super.allMaintenance, () {
      super.allMaintenance = value;
    });
  }

  final _$loadingAtom = Atom(name: '_MyMaintenanceStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  @override
  String toString() {
    return '''
allMaintenance: ${allMaintenance},
loading: ${loading},
activeMaintenance: ${activeMaintenance}
    ''';
  }
}
