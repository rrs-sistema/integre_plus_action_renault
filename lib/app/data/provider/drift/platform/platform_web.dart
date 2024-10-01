// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: deprecated_member_use

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:drift/drift.dart';
import 'package:drift/remote.dart';
// ignore: duplicate_ignore
// ignore: deprecated_member_use
import 'package:drift/web.dart';
import 'package:flutter/foundation.dart';

class PlatformInterface {
  static QueryExecutor createDatabaseConnection(String databaseName) {
    return LazyDatabase(() async {
      return _connectToWorker(databaseName).executor;
    });
  }

  static DatabaseConnection _connectToWorker(String databaseName) {
    final worker =
        SharedWorker(kReleaseMode ? 'worker.dart.min.js' : 'worker.dart.js', databaseName);
    return DatabaseConnection.delayed(
      connectToRemoteAndInitialize(worker.port!.channel(), debugLog: false),
    );
  }
}
