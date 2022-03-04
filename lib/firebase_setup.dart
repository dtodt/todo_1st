import 'package:firebase_analytics/firebase_analytics.dart' deferred as fba;
import 'package:firebase_core/firebase_core.dart' deferred as fbc;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' deferred as fbl;
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:flutter/material.dart' show FlutterError;

import 'firebase_options.dart';

Future<void> firebaseSetup() async {
  await fbc.loadLibrary();
  await fbc.Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await fba.loadLibrary();
  await fba.FirebaseAnalytics.instance
      .setAnalyticsCollectionEnabled(!kDebugMode);

  if (!kIsWeb) {
    await fbl.loadLibrary();
    await fbl.FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(!kDebugMode);
    FlutterError.onError = fbl.FirebaseCrashlytics.instance.recordFlutterError;
  }
}

Future<void> logOnFirebase(Object error, StackTrace stackTrace) async {
  if (!kIsWeb) {
    await fbl.loadLibrary();
    fbl.FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }
}
