import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../organization/organizationDetail_screen.dart';

class PhoneController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode otpFocusNode = FocusNode();

  var isMobileOptCalled = false.obs;
  var isLoading = false.obs;

  void mobileOpt() {
    print("Tapped MOBILE OTP");
    isMobileOptCalled.value = !isMobileOptCalled.value;
    print("=====${isMobileOptCalled.value}");
    Get.to(() => OrganizationDetailScreen());
  }
}
