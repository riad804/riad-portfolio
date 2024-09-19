import 'package:fluent_ui/fluent_ui.dart';
import 'package:portfolio_client/app/ui/commons/bullet_list.dart';
import 'package:portfolio_client/app/ui/commons/dot_border.dart';
import 'package:portfolio_client/app/ui/commons/title_widget.dart';
import 'package:portfolio_client/library/resource/app_typography.dart';
import 'package:portfolio_client/library/resource/app_typography_ext.dart';
import 'package:portfolio_client/library/resource/colors.dart';
import 'dart:html' as html;

class ResumeView extends StatefulWidget {
  const ResumeView({super.key});

  @override
  State<ResumeView> createState() => _ResumeViewState();
}

class _ResumeViewState extends State<ResumeView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TitleWidget(title: "Resume"),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: FilledButton(
                    child: Row(
                      children: [
                        const Icon(FluentIcons.cloud_download,
                            color: Colors.white),
                        const SizedBox(width: 10),
                        Text("Download CV",
                            style: AppText.b2!.cl(Colors.white)),
                      ],
                    ),
                    onPressed: () {
                      downloadFile(
                        "https://drive.google.com/file/d/1txDw1WrUejFXbAaWxpY7VzqlwUcHP62P/view?usp=drive_link",
                        "Riadul_Islam_CV.pdf",
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 50),
              child: Text(
                "Dedicated to exceeding Your expectations with highest-quality software, delivered on time and to your precise needs. I specialise in developing Android and Web apps using JAVA, Flutter and Golang.",
                style: AppText.b2!.cl(AppColors.secondary),
              ),
            ),
            // const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Summary", style: AppText.b1b),
                      const SizedBox(height: 20),
                      DotBorder(
                        bp: 0,
                        child: Column(
                          children: [
                            Text(
                                "Experienced Flutter app developer with a strong background in mobile app development and a passion for creating high-quality, user-friendly apps. Skilled in Flutter, Dart, and Firebase, with experience in both iOS and Android development. Strong problem-solver with the ability to quickly learn new technologies and programming languages.",
                                style: AppText.b2!.cl(AppColors.secondary)),
                            const SizedBox(height: 10),
                            const BulletList(
                              items: [
                                "Flutter: GetX, Provider, Dio, Animations, isolates, Method Channel, GetIt (Dependency Injection)",
                                "Dart, Java, Kotlin",
                                "Material UI, Fluent UI",
                                "Firebase, Web Socket, In App purchase",
                                "GetStorage, HiveDB, Moor/Drift DB, Firebase DB\n",
                                "Android: Retrofit, RoomDb, Socket, SDK, Push notification handling, Dynamic links, Crashlytics",
                                "MySQL, SQLite, RoomDb, Firebase",
                                "Git, Jira\n",
                                "Golang: Gin, Echo, Fiber",
                                "Hyperledger/fabric-sdk-go",
                                "Docker"
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text("Education", style: AppText.b1b),
                      const SizedBox(height: 20),
                      DotBorder(
                        bp: 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("BSC in Computer".toUpperCase(),
                                style: AppText.b1!.cl(AppColors.secondary)),
                            const SizedBox(height: 10),
                            Text("2018 - 2021",
                                style: AppText.l1b!.copyWith(
                                    color: AppColors.secondary,
                                    fontStyle: FontStyle.italic)),
                            const SizedBox(height: 10),
                            Text("Prime University, Dhaka",
                                style: AppText.b2!.cl(AppColors.secondary)),
                          ],
                        ),
                      ),
                      DotBorder(
                        bp: 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Diploma in Computer Technology".toUpperCase(),
                                style: AppText.b1!.cl(AppColors.secondary)),
                            const SizedBox(height: 10),
                            Text("2012 - 2017",
                                style: AppText.l1b!.copyWith(
                                    color: AppColors.secondary,
                                    fontStyle: FontStyle.italic)),
                            const SizedBox(height: 10),
                            Text("Dhaka Polytechnic Institute, Dhaka",
                                style: AppText.b2!.cl(AppColors.secondary)),
                          ],
                        ),
                      ),
                      DotBorder(
                        bp: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "ssc (secondary school certificate)"
                                    .toUpperCase(),
                                style: AppText.b1!.cl(AppColors.secondary)),
                            const SizedBox(height: 10),
                            Text("2010 - 2012",
                                style: AppText.l1b!.copyWith(
                                    color: AppColors.secondary,
                                    fontStyle: FontStyle.italic)),
                            const SizedBox(height: 10),
                            Text("Govt. Kalachandpur High School & College",
                                style: AppText.b2!.cl(AppColors.secondary)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Experiences", style: AppText.b1b),
                      const SizedBox(height: 20),
                      _buildExperiences(
                        company: "Arisaf Tech Ltd. (Remote)",
                        designation: "Software Developer",
                        duration: "May 2023 - present",
                        items: [
                          "Developed and maintained mobile apps using Flutter and Dart",
                          "Collaborated with golang developers and develop rest API",
                          "Implemented RESTful API to connect apps to back-end servers",
                        ],
                      ),
                      _buildExperiences(
                        company: "Space Cats (USA)",
                        designation: "Mobile Application Developer",
                        duration: "March 2023 - April 2023",
                        items: [
                          "Developed and maintained mobile apps using Flutter and Dart",
                          "Collaborated with designers to create visually appealing and user-friendly interfaces",
                          "Implemented RESTful API to connect apps to back-end servers",
                          "Fixed bugs and optimized app performance",
                        ],
                      ),
                      _buildExperiences(
                        company: "Yuma Technology Ltd. (UK)",
                        designation: "Mobile Application Developer",
                        duration: "Nov 2021 - March 2023",
                        items: [
                          "Developed and maintained mobile apps using Flutter and Dart",
                          "Implemented Firebase for user authentication, data storage, and push notifications",
                          "Collaborated with designers to create visually appealing and user-friendly interfaces",
                          "Implemented RESTful API to connect apps to back-end servers",
                          "Fixed bugs and optimized app performance",
                        ],
                      ),
                      _buildExperiences(
                        company: "Hyder Technology & IT Solution Ltd.",
                        designation: "Mobile Application Developer",
                        duration: "May 2021 - October 2021",
                        items: [
                          "Developed and maintained mobile apps using Flutter and Dart",
                          "Implemented Firebase for user authentication, data storage, and push notifications",
                          "Collaborated with designers to create visually appealing and user-friendly interfaces",
                          "Implemented RESTful API to connect apps to back-end servers",
                          "Fixed bugs and optimized app performance",
                        ],
                      ),
                      _buildExperiences(
                        company: "Datatrix Soft",
                        designation: "Mobile Application Developer",
                        duration: "November 2017 - April 2021",
                        items: [
                          "Developed and maintained mobile apps using Flutter and Dart",
                          "Implemented Firebase for user authentication, data storage, and push notifications",
                          "Collaborated with designers to create visually appealing and user-friendly interfaces",
                          "Implemented RESTful API to connect apps to back-end servers",
                          "Fixed bugs and optimized app performance",
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void downloadFile(String url, String filename) {
    html.AnchorElement(href: url)
      ..setAttribute("target", "_blank")
      ..setAttribute("download", filename)
      ..click();
  }

  _buildExperiences(
          {required String company,
          required String designation,
          required String duration,
          required List<String> items}) =>
      DotBorder(
        bp: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: company.toUpperCase(),
                  style: AppText.b2b!.cl(AppColors.primary)),
              TextSpan(
                  text: " - $designation",
                  style: AppText.b2!.copyWith(
                      color: AppColors.secondary, fontStyle: FontStyle.italic)),
            ])),
            const SizedBox(height: 10),
            Text(duration,
                style: AppText.l1b!.copyWith(
                    color: AppColors.secondary, fontStyle: FontStyle.italic)),
            const SizedBox(height: 10),
            BulletList(items: items),
          ],
        ),
      );
}
