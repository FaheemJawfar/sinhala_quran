import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_config/app_config.dart';
import '../app_config/color_config.dart';

import '../app_texts/home_texts.dart';
import 'quran_hadith_about_quran.dart';
import '../common_widgets/loading_indicator.dart';
import '../providers/quran_provider.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;
  late final quranProvider = Provider.of<QuranProvider>(context, listen: false);
  int selectedQuoteNumber = 0;

  @override
  void initState() {
    getRandomQuoteNumber();
    loadQuranData();
    super.initState();
  }

  void loadQuranData() async {
    setState(() {
      isLoading = true;
    });
    await quranProvider.loadQuranArabic();
    await quranProvider.loadTranslation();
    await Future.delayed(const Duration(seconds: 5));

    setState(() {
      isLoading = false;
    });
  }

  getRandomQuoteNumber() {
    selectedQuoteNumber =
        Random().nextInt(AboutQuranReferences.listOfVersesAndHadhiths.length);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading ? _buildSplash() : const HomeScreen(),
      ),
    );
  }

  Widget _buildSplash() {
    return Container(
      decoration: BoxDecoration(
        color: quranProvider.isDarkMode
            ? Colors.black
            : ColorConfig.backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
        child: Column(
          children: [
            Image.asset(
              AppConfig.appLogoPath,
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            Text(
              HomeTexts.theHolyQuran,
              style: TextStyle(
                fontSize: 32,
                color: quranProvider.isDarkMode
                    ? Colors.white
                    : ColorConfig.primaryColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              HomeTexts.arabicAndTranslation,
              style: TextStyle(
                fontSize: 18,
                color:
                    quranProvider.isDarkMode ? Colors.white70 : Colors.black54,
                letterSpacing: 1.2,
              ),
            ),
            Divider(
              color: quranProvider.isDarkMode ? Colors.white24 : Colors.black12,
              thickness: 0.5,
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: quranProvider.isDarkMode
                    ? Colors.white.withValues(alpha: 0.1)
                    : ColorConfig.primaryColor.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    AboutQuranReferences
                        .listOfVersesAndHadhiths[selectedQuoteNumber].quote,
                    style: TextStyle(
                      color: quranProvider.isDarkMode
                          ? Colors.white
                          : Colors.black87,
                      fontSize: 18,
                      height: 1.5,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    AboutQuranReferences
                        .listOfVersesAndHadhiths[selectedQuoteNumber].reference,
                    style: TextStyle(
                      color: quranProvider.isDarkMode
                          ? Colors.white70
                          : ColorConfig.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Spacer(),
            LoadingIndicator(
              size: 25,
              color: quranProvider.isDarkMode
                  ? Colors.white
                  : ColorConfig.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
