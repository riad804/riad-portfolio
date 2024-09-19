import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:portfolio_client/app/ui/animations/entrance_fader.dart';
import 'package:portfolio_client/library/resource/app_typography.dart';
import 'package:portfolio_client/library/resource/app_typography_ext.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var imageList = [
    "https://burst.shopifycdn.com/photos/hands-typing-on-laptop.jpg?width=1000&format=pjpg&exif=0&iptc=0",
    "https://images.unsplash.com/photo-1498050108023-c5249f4df085?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2VifGVufDB8fDB8fHww",
    "https://burst.shopifycdn.com/photos/coding-on-laptop.jpg?width=1000&format=pjpg&exif=0&iptc=0"
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: height,
            autoPlay: true,
            viewportFraction: 1.0,
          ),
          items: imageList
              .map((item) => CachedNetworkImage(
                    imageUrl: item,
                    fit: BoxFit.cover,
                    height: height,
                    width: width,
                  ))
              .toList(),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Opacity(
            opacity: 0.75,
            child: Container(
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "I'm",
                  style: AppText.b1!.cl(Colors.white),
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(text: "Md", style: AppText.h1b!.cl(Colors.white)),
                    TextSpan(text: ".", style: AppText.h1b!.cl(Colors.blue)),
                    TextSpan(
                        text: "Riadul Islam",
                        style: AppText.h1b!.cl(Colors.white)),
                  ]),
                ),
                const SizedBox(height: 20),
                EntranceFader(
                  offset: const Offset(-10, 0),
                  delay: const Duration(seconds: 1),
                  duration: const Duration(milliseconds: 800),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        ' Mobile Application Developer',
                        speed: const Duration(milliseconds: 50),
                        textStyle: AppText.b2,
                      ),
                      TyperAnimatedText(
                        ' Software Engineer',
                        speed: const Duration(milliseconds: 50),
                        textStyle: AppText.b2,
                      ),
                      TyperAnimatedText(
                        ' Freelancer at Upwork',
                        speed: const Duration(milliseconds: 50),
                        textStyle: AppText.b2,
                      ),
                      TyperAnimatedText(
                        ' A friend :)',
                        speed: const Duration(milliseconds: 50),
                        textStyle: AppText.b2,
                      ),
                    ],
                    isRepeatingAnimation: true,
                    repeatForever: true,
                  ),
                ),
                const SizedBox(height: 100),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: FilledButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Hire me",
                            style: AppText.l1!.cl(Colors.white)),
                      ),
                      onPressed: () {}),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
