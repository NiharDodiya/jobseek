import 'package:flutter/material.dart';
import 'package:jobseek/screen/dashboard/home/home_controller.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';

Widget searchArea() {
  final HomeController controller = HomeController();
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18),
    child: Row(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: ColorRes.white2,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: const Icon(Icons.search, color: ColorRes.grey),
                  hintText: "Search",
                  hintStyle: appTextStyle(
                      fontSize: 14,
                      color: ColorRes.grey,
                      fontWeight: FontWeight.w500),
                  contentPadding: const EdgeInsets.only(left: 20, top: 13)),
            ),
          ),
        ),
        // const SizedBox(width: 20),
        // Container(
        //   height: 40,
        //   width: 40,
        //   alignment: Alignment.center,
        //   decoration: const BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(10)),
        //     color: ColorRes.logoColor,
        //   ),
        //   child: Image.asset(
        //     AssetRes.menuIcon,
        //     color: ColorRes.containerColor,
        //     height: 15,
        //   ),
        // ),
      ],
    ),
  );
}
