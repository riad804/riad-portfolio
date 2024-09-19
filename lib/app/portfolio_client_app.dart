import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_client/app/navigation/app_router_config.dart';
import 'package:portfolio_client/library/resource/app_typography.dart';
import 'package:portfolio_localization/strings.g.dart';

class PortfolioClientApp extends StatefulWidget {
  const PortfolioClientApp({super.key});

  @override
  State<PortfolioClientApp> createState() => _PortfolioClientAppState();
}

class _PortfolioClientAppState extends State<PortfolioClientApp> {
  final _appRouterConfig = AppRouterConfig();

  @override
  void initState() {
    AppText.init();
    super.initState();
  }

  @override
  void dispose() {
    _appRouterConfig.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FluentApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouterConfig.router,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: FluentThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.sourceCodePro().fontFamily,
      ),
    );
  }
}
