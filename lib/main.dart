import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:portfolio_client/app/portfolio_client_app.dart';
import 'package:portfolio_client/core/di/di_container.dart';
import 'package:portfolio_client/firebase_options.dart';
import 'package:portfolio_localization/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kReleaseMode) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  await Hive.initFlutter();
  await initDi();
  runApp(TranslationProvider(
    child: const PortfolioClientApp(),
  ));
}
