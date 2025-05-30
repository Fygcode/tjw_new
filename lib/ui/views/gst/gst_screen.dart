import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/common_button.dart';
import '../../../common_widget/common_text_field.dart';
import '../../../common_widget/tap_outside_unfocus.dart';
import '../../../core/res/colors.dart';
import '../phone/phone_screen.dart';
import 'gst_controller.dart';

class GstScreen extends StatefulWidget {
  const GstScreen({super.key});

  @override
  State<GstScreen> createState() => _GstScreenState();
}

class _GstScreenState extends State<GstScreen> {
  final GstController controller = Get.put(GstController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.background,
      resizeToAvoidBottomInset: true,
      body: TapOutsideUnFocus(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
             //   height: size.height * 0.7,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/splash_background.png'),
                    // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox( height: size.height * 0.5,),
                      Text(
                        "Enter Your GST Number.",
                        style: TextStyle(fontSize: 32, color: AppColor.white),
                      ),
                      SizedBox(height: 10),
                      CommonTextField(
                        controller: controller.gstController,
                        focusNode: controller.gstFocusNode,
                        hintText: 'Enter GST Number *',
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter gst number';
                          }
                          // ✅ GSTIN Format: 15 characters - 2 digit state code + 10 digit PAN + 1 entity + 1 checksum
                          RegExp gstRegExp = RegExp(
                            r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$',
                          );
                          if (!gstRegExp.hasMatch(val.toUpperCase())) {
                            return 'Please enter a valid GST number';
                          }
                          return null;
                        },
                      ),
                     // SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: CommonButton(
          text: "Continue",
          onPressed: () {
            Get.to(() => PhoneScreen());
          },
        ),
      ),
    );
  }
}
