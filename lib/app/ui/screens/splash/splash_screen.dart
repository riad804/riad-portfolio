import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_client/library/resource/assets.dart';

import 'splash_screen_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    required this.viewModel,
    super.key,
  });

  final SplashScreenViewModel viewModel;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  var progressValue = 0.0;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
        setState(() {
          progressValue += 1;

          if (progressValue >= 100) {
            progressValue = 100;
            _timer.cancel();

            if (mounted) {
              widget.viewModel.gotoHomeScreen(context);
            }
          }
        });
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 36, 36, 36),
      ),
      child: Center(
        // child: Lottie.asset(AppIcons.loadingAnimation),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.asset(
            //   AppIcons.signatureImg,
            //   width: 300,
            // ),
            RichText(
              text: TextSpan(
                style: GoogleFonts.dancingScript().copyWith(
                  color: Colors.white,
                ),
                children: const [
                  TextSpan(text: "<", style: TextStyle(fontSize: 60)),
                  TextSpan(text: " Riad /", style: TextStyle(fontSize: 30)),
                  TextSpan(text: ">", style: TextStyle(fontSize: 60)),
                ],
              ),
            ),
            // Text(
            //   '< Riad />',
            //   style: GoogleFonts.dancingScript().copyWith(
            //     fontSize: 30,
            //   ),
            // ),
            const SizedBox(height: 25),
            SizedBox(
              width: 280,
              child: ProgressBar(value: progressValue),
            ),
          ],
        ),
      ),
    );
  }
}
