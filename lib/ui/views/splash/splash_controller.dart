import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/model/user_model.dart';
import '../../../services/api_base_service.dart';
import '../../../services/request_method.dart';
import '../dashboard/dashboard_screen.dart';
import '../terms/terms_screen.dart';

class SplashController extends GetxController {
  var userModel = <UserModel>[].obs;
  var isLoading = true.obs;

  // Form controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();
  final fruitController = TextEditingController();
  final emailController = TextEditingController();

  // Form key & focus nodes
  final formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  final focusNodePhone = FocusNode();
  final focusNodeEmail = FocusNode();
  final focusNodePassword = FocusNode();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  /// Initial method called on splash screen load
  Future<void> init() async {
    print("INSIDE INIT SPLASH CONTROLLER");
    // Simulate a short loading time (splash delay)
    await Future.delayed(const Duration(seconds: 2));

    // Optionally fetch data or check login state
    // await fetchUserData();

    // Navigate to dashboard (or login depending on logic)
    Get.off(() => TermsScreen());
    // OR Get.offNamed('/dashboard');
  }

}


