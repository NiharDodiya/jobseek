import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';
import 'package:jobseek/utils/color_res.dart';
import 'chat_box_controller.dart';
import 'chat_box_live-Screen.dart';

class ChatBoxScreen extends StatelessWidget {
  ChatBoxScreen({Key? key}) : super(key: key);
  final controller = Get.put(ChatBoxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.backgroungColor,
      body: Column(children: [
        const SizedBox(height: 60),
        Row(children: [
          Container(
            margin: const EdgeInsets.all(15),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: ColorRes.logoColor,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(top: 11),
              child: Text(
                textAlign: TextAlign.center,
                "Logo",
                style: appTextStyle(
                    color: ColorRes.containerColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 10),
              ),
            ),
          ),
          const SizedBox(width: 60),
          Text(
            'Chat Box',
            style: appTextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height: 1,
                color: ColorRes.black),
          ),
        ]),
        const SizedBox(height: 20),
        Container(
          width: 339,
          decoration: const BoxDecoration(
            color: ColorRes.white2,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
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
              contentPadding: const EdgeInsets.only(left: 20, top: 13),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.only(right: 20),
          height: 32,
          child: ListView.builder(
              itemCount: controller.jobs.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => controller.onTapJobs(index),
                  child: Obx(() => Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 32,
                        width: 70,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorRes.containerColor, width: 2),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: controller.selectedJobs.value == index
                                ? ColorRes.containerColor
                                : ColorRes.white),
                        child: Text(
                          controller.jobs[index],
                          style: appTextStyle(
                              color: controller.selectedJobs.value == index
                                  ? ColorRes.white
                                  : ColorRes.containerColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                );
              }),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: controller.jobs2.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                child: Dismissible(
                  confirmDismiss: (DismissDirection direction) async {
                    return await showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return Container(
                          height: 290,
                          decoration: const BoxDecoration(
                            color: ColorRes.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 92,
                                width: Get.width,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 4),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    border: Border.all(
                                      color: const Color(0xffF3ECFF),
                                    ),
                                    color: ColorRes.white),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      AssetRes.chatbox_Men_Image,
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "UI/UX Designer",
                                          style: appTextStyle(
                                              color: ColorRes.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          "Hi Adam Smith,",
                                          style: appTextStyle(
                                              color: ColorRes.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const Spacer(),
                                        Text(
                                          "20.00",
                                          style: appTextStyle(
                                              fontSize: 12,
                                              color: ColorRes.black
                                                  .withOpacity(0.8),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Archive this chat?",
                                style: appTextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: ColorRes.black.withOpacity(0.8)),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 160,
                                      decoration: BoxDecoration(
                                          color: ColorRes.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.all(
                                              color: ColorRes.containerColor)),
                                      child: Center(
                                        child: Text(
                                          "Cancel",
                                          style: appTextStyle(
                                            color: ColorRes.containerColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop(true);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 160,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          ColorRes.gradientColor,
                                          ColorRes.containerColor,
                                        ]),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Yes, Remove",
                                          style: appTextStyle(
                                            color: ColorRes.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  key: Key("INDEX$index"),
                  background: Container(
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      color: ColorRes.deletColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.archive,
                      size: 40,
                      color: ColorRes.starColor,
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (con) => const ChatBoxLiveScreenM()));
                    },
                    child: Container(
                      height: 92,
                      width: Get.width,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(
                            color: const Color(0xffF3ECFF),
                          ),
                          color: ColorRes.white),
                      child: Row(
                        children: [
                          Image.asset(
                            AssetRes.chatImage,
                          ),
                          const SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.jobs2[index],
                                style: appTextStyle(
                                    color: ColorRes.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "Hi Adam Smith,",
                                style: appTextStyle(
                                    color: ColorRes.black,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 22,
                                width: 22,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      ColorRes.gradientColor,
                                      ColorRes.containerColor
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    '1',
                                    style: appTextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: ColorRes.white),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "20.00",
                                style: appTextStyle(
                                    fontSize: 12,
                                    color: ColorRes.black.withOpacity(0.8),
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
