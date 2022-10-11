import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseek/screen/dashboard/dashboard_controller.dart';
import 'package:jobseek/screen/dashboard/dashboard_screen.dart';
import 'package:jobseek/screen/looking_for_screen/looking_for_screen.dart';
import 'package:jobseek/service/pref_services.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:jobseek/utils/pref_keys.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splash();
  }

  void splash() async {
    String token = PrefService.getString(PrefKeys.accessToken);
    await Future.delayed(const Duration(seconds: 3), () {
      final DashBoardController controller = Get.put(DashBoardController());
      controller.currentTab = 0;
      Get.off(() => token=="" ? const LookingForScreen(): DashBoardScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider backgroundImage = const AssetImage(AssetRes.splashScreen);
    backgroundImage.resolve(createLocalImageConfiguration(context));
    ImageProvider backgroundImageBoy = const AssetImage(AssetRes.splashBoyImg);
    backgroundImageBoy.resolve(createLocalImageConfiguration(context));
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(image: backgroundImage, fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 54, right: 30),
              child: Text(
                textAlign: TextAlign.end,
                'Logo',
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: ColorRes.splashLogoColor),
              ),
            ),
            SizedBox(
              height: 140,
              child: Row(
                children: [
                  Container(
                    height: 110,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Find Your  \n',
                              style: GoogleFonts.poppins(
                                color: ColorRes.black2,
                                fontWeight: FontWeight.w500,
                                fontSize: 40,
                                height: 1,
                              )),
                          TextSpan(
                            text: ' dream job \n',
                            style: GoogleFonts.poppins(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: ColorRes.black2,
                              background: Paint()..color = Colors.white,
                              height: 1,
                            ),
                          ),
                          TextSpan(
                              text: ' here',
                              style: GoogleFonts.poppins(
                                  color: ColorRes.black2,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 40,
                                  height: 1))
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 140,
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 35),
                      alignment: Alignment.center,
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          shape: BoxShape.circle,
                          color: ColorRes.black2),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Image.asset(
              AssetRes.splashBoyImg,
              height: Get.height < 657 ? Get.height / 2 : Get.height / 1.6,
              width: Get.width,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.none,
            )
          ],
        ),
      ),
    );
  }
}
