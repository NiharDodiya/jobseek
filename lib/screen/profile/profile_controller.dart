import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUserController extends GetxController implements GetxService {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  RxBool isNameValidate = false.obs;
  RxBool isEmailValidate = false.obs;
  RxBool isAddressValidate = false.obs;
  RxBool isoccupationValidate = false.obs;
  RxBool isbirthValidate = false.obs;
  DateTime? startTime;
  ImagePicker picker = ImagePicker();
  File? image;

  Future<void> onDatePickerTap(context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.blue,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      if (kDebugMode) {
        startTime = picked;
      }
      print("START TIME : $startTime");
      dateOfBirthController.text =
          "${picked.toLocal().month}/${picked.toLocal().day}/${picked.toLocal().year}";
      update();
    }
  }

  onLoginBtnTap1() {
    validate();
    if (isNameValidate.value == false &&
        isEmailValidate.value == false &&
        isAddressValidate.value == false &&
        isoccupationValidate.value == false &&
        isbirthValidate.value == false) {
      print("GO TO HOME PAGE");
      // Get.to(ManagerDashBoardScreen());
    }
  }
  validate() {
    if (fullNameController.text.isEmpty) {
      isNameValidate.value = true;
    } else {
      isNameValidate.value = false;
    }
    if (emailController.text.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text)) {
      isEmailValidate.value = true;
    } else {
      isEmailValidate.value = false;
    }
    if (addressController.text.isEmpty) {
      isAddressValidate.value = true;
    } else {
      isAddressValidate.value = false;
    }
    if (occupationController.text.isEmpty) {
      isoccupationValidate.value = true;
    } else {
      isoccupationValidate.value = false;
    }
    if (dateOfBirthController .text.isEmpty) {
      isbirthValidate.value = true;
    } else {
      isbirthValidate.value = false;
    }
  }
 ontap() async{
  XFile? img = await picker.pickImage(source: ImageSource.camera);
  String path = img!.path;
  image = File(path);
  imagePicker();
}
 ontapGallery()async{
   XFile? gallery = await picker.pickImage(source: ImageSource.gallery);
   String path = gallery!.path;
   gallery = File(path) as XFile? ;
   imagePicker();

 }
  imagePicker(){
    update(['image']);
    update(['gallery']);
    update();
  }
}
