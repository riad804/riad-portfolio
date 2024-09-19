import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:portfolio_client/app/ui/commons/bullet_list.dart';
import 'package:portfolio_client/app/ui/commons/title_widget.dart';
import 'package:portfolio_client/library/resource/app_typography.dart';
import 'package:portfolio_client/library/resource/app_typography_ext.dart';
import 'package:portfolio_client/library/resource/assets.dart';
import 'package:portfolio_client/library/resource/colors.dart';

class PortfolioView extends StatefulWidget {
  const PortfolioView({super.key});

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const TitleWidget(title: "Portfolio"),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: MediaQuery.of(context).size.height - 140,
                  child: SingleChildScrollView(
                    child: _portfolioDetails(),
                  ),
                ),
              ),
              const SizedBox(width: 50),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey,
                  height: MediaQuery.of(context).size.height - 140,
                  child: ListView(
                    children: List.generate(
                      20,
                      (index) => _portfolioListItemWidget(index == 2),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _portfolioListItemWidget(bool) => ListTile(
        cursor: SystemMouseCursors.click,
        contentAlignment: CrossAxisAlignment.center,
        leading: bool
            ? Icon(FluentIcons.caret_left_solid8, color: Colors.blue)
            : const Icon(FluentIcons.caret_left_solid8),
        title: Text(
          "E-Onigiri",
          style: AppText.b2b!.cl(bool ? Colors.blue : AppColors.primary),
        ),
        subtitle: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Technology: ",
              style: AppText.l1b!.cl(AppColors.secondary)),
          TextSpan(
              text:
                  "Flutter, Provider, SharedPreference, Firebase store, Firebase Push Notification, InAppPurchasing, IOS build",
              style: AppText.l1!.cl(AppColors.secondary)),
        ])),
        onPressed: () {},
      );

  _portfolioDetails() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: List.generate(
              5,
              (index) => MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async {
                    final result = await showDialog(
                        context: context,
                        builder: (context) => Stack(
                              children: [
                                Image.asset(AppIcons.ssOfProjectPic,
                                    fit: BoxFit.fitWidth),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                        ),
                                        child: IconButton(
                                            icon: const Icon(
                                              FluentIcons.chrome_close,
                                              color: AppColors.primary,
                                              size: 30,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            }),
                                      ),
                                    )),
                              ],
                            ));
                  },
                  child: Image.asset(AppIcons.ssOfProjectPic,
                      fit: BoxFit.fitWidth),
                ),
              ),
            ),
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              _linkButtonWidget(image: AppIcons.playStoreBtn),
              _linkButtonWidget(image: AppIcons.appStoreBtn),
              _linkButtonWidget(image: AppIcons.githubBtn),
              _linkButtonWidget(image: AppIcons.viewDemoBtn),
            ],
          ),
          const SizedBox(height: 20),
          Text("Contributions", style: AppText.b1b),
          const SizedBox(height: 20),
          Text(
              "Experienced Flutter app developer with a strong background in mobile app development and a passion for creating high-quality, user-friendly apps. Skilled in Flutter, Dart, and Firebase, with experience in both iOS and Android development. Strong problem-solver with the ability to quickly learn new technologies and programming languages.",
              style: AppText.b2!.cl(AppColors.secondary)),
        ],
      );

  _linkButtonWidget({required String image}) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: SizedBox(
            width: 150,
            child: Image.asset(image, fit: BoxFit.fitWidth),
          ),
        ),
      );
}
