// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: deprecated_member_use

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:drift/drift.dart';
import 'package:drift/web.dart';
import 'package:drift/remote.dart';

void main() {
  final self = SharedWorkerGlobalScope.instance;
  self.importScripts('sql-wasm.js');

  final db = WebDatabase.withStorage(DriftWebStorage.indexedDb('integre_plus_action_renault',
      migrateFromLocalStorage: false, inWebWorker: true));
  final server = DriftServer(DatabaseConnection(db));

  self.onConnect.listen((event) {
    final msg = event as MessageEvent;
    server.serve(msg.ports.first.channel());
  });
}
