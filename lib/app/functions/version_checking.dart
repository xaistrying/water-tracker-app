// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:upgrader/upgrader.dart';

Future<bool> checkIfUpdateAvailable() async {
  final upgrader = Upgrader(debugLogging: kDebugMode);

  await upgrader.initialize();

  return upgrader.isUpdateAvailable();
}
