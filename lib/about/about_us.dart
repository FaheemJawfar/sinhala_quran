import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_texts/about.dart';
import '../app_config/app_config.dart';
import '../app_config/color_config.dart';
import '../utils/launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../providers/quran_provider.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  String appVersion = '1.0';
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  @override
  void initState() {
    getVersionNumber();
    super.initState();
  }


  void getVersionNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    List<String> versionParts = packageInfo.version.split('.');

    if (versionParts.length > 1) {
      versionParts.removeLast();
    }

    setState(() {
      appVersion = versionParts.join('.');
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: quranProvider.isDarkMode ? null: ColorConfig.backgroundColor,
      appBar: AppBar(
        title: const Text(AboutTexts.aboutUs),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 40,
                backgroundColor: quranProvider.isDarkMode ? Colors.transparent: ColorConfig.backgroundColor,
                backgroundImage: const AssetImage(AppConfig.appLogoPath),
              ),
              const SizedBox(height: 20),
              const Text(
                AboutTexts.appNameWithTranslation,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                'Version $appVersion',
                style: TextStyle(fontSize: 18, color: quranProvider.isDarkMode ? Colors.white70: Colors.grey.shade700),
              ),

              Divider(
                color: quranProvider.isDarkMode ? null: ColorConfig.primaryColor,
              ),


              const Text(
                AboutTexts.developedBy,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const Text(
                AboutTexts.developerName,
                style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Divider(
                color: quranProvider.isDarkMode ? null: ColorConfig.primaryColor,
              ),
              const Text(
                AboutTexts.sendFeedback,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Divider(),
              const Text(
                AboutTexts.toContact,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Launcher.launchEmail('');
                },
                icon: const Icon(Icons.mail),
                label: const Text(AboutTexts.emailUs),

                style: quranProvider.isDarkMode ? ColorConfig.darkModeButtonStyle : null,
              ),

              ElevatedButton.icon(
                onPressed: () {
                  Launcher.launchWhatsApp();
                },
                icon: const ImageIcon(AssetImage('assets/images/whatsapp.png')),
                label: const Text(AboutTexts.whatsAppUs),

                style: quranProvider.isDarkMode ? ColorConfig.darkModeButtonStyle : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
