import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'package:jobseek/utils/string.dart';

Widget jobDetailsAppBar() {
  return Column(
    children: [
      const SizedBox(height: 60),
      SizedBox(
        height: 40,
        width: Get.width,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.only(left: 10),
                    // margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: ColorRes.logoColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: ColorRes.containerColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: ColorRes.logoColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      AssetRes.bookMarkBorderIcon,
                      height: 21,
                      width: 15,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  Strings.jobDetails,
                  style: appTextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
