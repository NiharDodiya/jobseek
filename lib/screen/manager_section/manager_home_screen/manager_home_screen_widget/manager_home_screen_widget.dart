import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/utils/app_res.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

Widget recentPeopleBox({var args}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    decoration: BoxDecoration(
        border: Border.all(color: ColorRes.borderColor),
        borderRadius: BorderRadius.circular(15)),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Image(
                    image: AssetImage(AssetRes.detailsImage),
                    height: 20,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      args["userName"],
                      style: appTextStyle(
                          color: ColorRes.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      args["Occupation"],
                      style: appTextStyle(
                          color: ColorRes.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: ColorRes.logoColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: const GradientIcon(
                      Icons.chat,
                      20,
                      LinearGradient(colors: [
                        Color(0xFFBE9DFF),
                        Color(0xFF8B4EFF),
                      ])),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: ColorRes.logoColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: const GradientIcon(
                      Icons.videocam_sharp,
                      20,
                      LinearGradient(colors: [
                        Color(0xFFBE9DFF),
                        Color(0xFF8B4EFF),
                      ])),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          color: ColorRes.lightGrey,
          height: 2,
          width: Get.width,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Get.toNamed(AppRes.resumeScreen),
              child: Container(
                width: 135,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(colors: [
                      Color(0xFFBF9EFF),
                      Color(0xFF8B4EFF),
                    ])),
                child: Center(
                  child: Text(
                    "See Resume",
                    style: appTextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed(AppRes.seeDetailsScreen, arguments: args),
              child: Container(
                width: 135,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: ColorRes.containerColor, width: 2),
                    color: Colors.white),
                child: Center(
                  child: Text(
                    "See Details",
                    style: appTextStyle(
                        color: ColorRes.containerColor, fontSize: 15),
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

class GradientIcon extends StatelessWidget {
  const GradientIcon(this.icon, this.size, this.gradient, {Key? key})
      : super(key: key);

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}
