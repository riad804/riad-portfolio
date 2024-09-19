import 'package:fluent_ui/fluent_ui.dart';
import 'package:portfolio_client/app/ui/commons/title_widget.dart';
import 'package:portfolio_client/library/resource/app_typography.dart';
import 'package:portfolio_client/library/resource/app_typography_ext.dart';
import 'package:portfolio_client/library/resource/assets.dart';
import 'package:portfolio_client/library/resource/colors.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  final aboutData = {
    "title": "Mobile Application & Golang Developer",
    "short_desc":
        "Experienced in building high-performance mobile applications and backend systems using Golang.",
    "long_desc":
        "Experienced Flutter app developer with a strong background in mobile app development and a passion for creating high-quality, user-friendly apps. Skilled in Flutter, Dart, and Firebase, with experience in both iOS and Android development. Strong problem-solver with the ability to quickly learn new technologies and programming languages.",
  };

  final infoList = [
    {
      "key": "Birthday",
      "value": "18 Feb 1997",
    },
    {
      "key": "Age",
      "value": "27",
    },
    {
      "key": "Phone",
      "value": "+880 1764 707 804",
    },
    {
      "key": "Degree",
      "value": "Diploma",
    },
    {
      "key": "Email",
      "value": "dev.riadul@gmail.com",
    },
    {
      "key": "Website",
      "value": "www.example.com",
    },
    {
      "key": "City",
      "value": "Manikganj, Bangladesh",
    },
    {
      "key": "Freelance",
      "value": "Available",
    },
  ];

  final skills = [
    {
      "name": "Java",
      "progress": 65,
    },
    {
      "name": "Kotlin",
      "progress": 45,
    },
    {
      "name": "Dart",
      "progress": 75,
    },
    {
      "name": "Golang",
      "progress": 85,
    },
    {
      "name": "Flutter",
      "progress": 85,
    },
    {
      "name": "Javascript",
      "progress": 45,
    },
    {
      "name": "Native Android",
      "progress": 70,
    },
    {
      "name": "Node JS",
      "progress": 35,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleWidget(title: "About"),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 50),
              child: Text(
                aboutData["long_desc"].toString(),
                style: AppText.b2!.cl(AppColors.secondary),
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey,
                    width: 300,
                    height: 350,
                    child: Image.asset(AppIcons.aboutMePic, fit: BoxFit.cover),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(aboutData["title"].toString(), style: AppText.b1b),
                      const SizedBox(height: 20),
                      Text(
                        aboutData["short_desc"].toString(),
                        style: AppText.b2!.cl(AppColors.secondary),
                      ),
                      const SizedBox(height: 20),
                      GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: infoList.length * 1.0,
                          ),
                          itemCount: infoList.length,
                          itemBuilder: (_, index) {
                            return Row(
                              children: [
                                Icon(FluentIcons.caret_solid_alt,
                                    color: Colors.blue),
                                Text("${infoList[index]["key"].toString()}: ",
                                    style: AppText.b2b),
                                SelectableText(
                                    infoList[index]["value"].toString(),
                                    style: AppText.b2!.cl(AppColors.secondary)),
                              ],
                            );
                          }),
                    ],
                  ))
                ],
              ),
            ),
            const SizedBox(height: 20),
            const TitleWidget(title: "Skills"),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: skills.length * 1.0,
                crossAxisSpacing: 30,
              ),
              itemCount: skills.length,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(skills[index]["name"].toString(),
                            style: AppText.b2),
                        Text("${skills[index]["progress"].toString()}%",
                            style: AppText.b2),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ProgressBar(
                          value: skills[index]["progress"] as double),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
