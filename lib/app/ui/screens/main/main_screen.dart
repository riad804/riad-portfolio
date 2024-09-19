import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_client/app/ui/screens/main/about/about_view.dart';
import 'package:portfolio_client/app/ui/screens/main/buy_coffee/buy_coffee_view_model.dart';
import 'package:portfolio_client/app/ui/screens/main/contact/contact_view.dart';
import 'package:portfolio_client/app/ui/screens/main/home/home_view.dart';
import 'package:portfolio_client/app/ui/screens/main/portfolio/portfolio_view.dart';
import 'package:portfolio_client/app/ui/screens/main/resume/resume_view.dart';
import 'package:portfolio_client/app/ui/screens/main/services/services_view.dart';
import 'package:portfolio_client/core/di/inject.dart';
import 'package:portfolio_client/domain/bloc/buy_coffee_bloc.dart';
import 'package:portfolio_client/library/resource/app_typography.dart';
import 'package:portfolio_client/library/resource/app_typography_ext.dart';
import 'package:portfolio_client/library/resource/assets.dart';
import 'package:portfolio_localization/strings.g.dart';
import 'dart:js' as js;

import 'buy_coffee/buy_coffee_view.dart';
import 'main_screen_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    required this.viewModel,
    super.key,
  });

  final MainScreenViewModel viewModel;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final navigationViewKey = GlobalKey();
  var _selectedItem = 0;

  List<NavigationPaneItem> _navigationItems(BuildContext context) =>
      <NavigationPaneItem>[
        PaneItem(
          mouseCursor: SystemMouseCursors.click,
          icon: const Icon(FluentIcons.home),
          title: Text(context.t.main.nav.home),
          body: HomeView(),
        ),
        PaneItem(
          mouseCursor: SystemMouseCursors.click,
          icon: const Icon(FluentIcons.contact),
          title: Text(context.t.main.nav.about),
          body: AboutView(),
        ),
        PaneItem(
          mouseCursor: SystemMouseCursors.click,
          icon: const Icon(FluentIcons.text_document),
          title: Text(context.t.main.nav.resume),
          body: ResumeView(),
        ),
        PaneItem(
          mouseCursor: SystemMouseCursors.click,
          icon: const Icon(FluentIcons.photo_collection),
          title: Text(context.t.main.nav.portfolio),
          body: PortfolioView(),
        ),
        PaneItem(
          mouseCursor: SystemMouseCursors.click,
          icon: const Icon(FluentIcons.waffle),
          title: Text(context.t.main.nav.services),
          body: ServicesView(),
        ),
        PaneItem(
          mouseCursor: SystemMouseCursors.click,
          icon: const Icon(FluentIcons.mail),
          title: Text(context.t.main.nav.contact),
          body: ContactView(),
        ),
      ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      key: navigationViewKey,
      pane: NavigationPane(
        selected: _selectedItem,
        onChanged: (value) {
          setState(() {
            _selectedItem = value;
          });
        },
        header: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                height: 170,
                width: 170,
                child: ClipOval(
                  child: Image.asset(AppIcons.profilePic, fit: BoxFit.fitWidth),
                ),
              ),
            ),
            Text(
              context.t.main.ownerName,
              style: AppText.h3b!.s(18),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _getIconButton(
                      icon: FontAwesomeIcons.linkedin,
                      link: "https://www.linkedin.com/in/riadulislam/",
                    ),
                    _getIconButton(
                      icon: FontAwesomeIcons.squareGithub,
                      link: "https://github.com/riadul-arisaftech",
                    ),
                    _getIconButton(
                      icon: FontAwesomeIcons.squareFacebook,
                      link: "https://web.facebook.com/riadul.islam.1401933",
                    ),
                    _getIconButton(
                      icon: FontAwesomeIcons.squareWhatsapp,
                      link: "https://wa.me/qr/BEBMB4TWCUZ4D1",
                    ),
                    _getIconButton(
                      icon: FontAwesomeIcons.upwork,
                      link: "https://www.upwork.com/freelancers/mollariad",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        displayMode: PaneDisplayMode.open,
        items: _navigationItems(context),
        footerItems: <NavigationPaneItem>[
          PaneItem(
            mouseCursor: SystemMouseCursors.click,
            icon: const Icon(FluentIcons.coffee_script),
            title: Text(
              'Buy me Coffee',
              style: GoogleFonts.dancingScript(),
            ),
            body: BlocProvider(
              create: (_) => BuyCoffeeBloc(inject()),
              child: BuyCoffeeView(
                viewModel: BuyCoffeeViewModel(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getIconButton({icon, link}) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: IconButton(
          icon: Icon(
            icon,
            size: 20,
          ),
          onPressed: () {
            if (kIsWeb) {
              js.context.callMethod("open", [link]);
            }
          },
        ),
      );
}
