import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/screen/notification_screen/notification_widget/notification_widget.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/color_res.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            width: Get.width,
            child: Stack(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.only(left: 20),
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
                Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: Text(
                      "Notification",
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
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: Get.height*0.85,
              child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) =>
                      notificationBox()),
            ),
          )
        ],
      ),
    );
  }
}
