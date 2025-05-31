
import 'dart:convert';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tjw_ue/router.dart';
import 'package:tjw_ue/services/appconfig_service.dart';




import 'core/res/colors.dart';
import 'core/res/styles.dart';
import 'locator.dart';

// import 'firebase_options_dev.dart' as dev;
// import 'firebase_options_qa.dart' as qa;
import 'firebase_options_prod.dart' as prod;

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   setupLocator();
//   // runApp(const MyApp());
//   runApp( DevicePreview(
//     enabled: !kReleaseMode,
//     builder: (context) => MyApp(), // Wrap your app
//   ),);
// }

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Setup DI
//   setupLocator();
//
//   // Select Firebase options based on flavor
//   FirebaseOptions options;
//   const flavor = String.fromEnvironment('FLAVOR');
//   switch (flavor) {
//     case 'prod':
//       options = prod.DefaultFirebaseOptions.currentPlatform;
//       break;
//     default:
//       throw Exception('Unknown flavor: $flavor');
//   }
//
//   // Initialize Firebase
//   await Firebase.initializeApp(options: options);
//
//   // Then run your app with device preview
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => MyApp(),
//     ),
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const flavor = String.fromEnvironment('FLAVOR');

  FirebaseOptions options;
  switch (flavor) {
    case 'prod':
      options = prod.DefaultFirebaseOptions.currentPlatform;
      break;
    default:
      throw Exception('Unknown flavor: $flavor');
  }

  await Firebase.initializeApp(options: options);

  // Setup locator
  setupLocator();

  // Fetch and decode config
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(seconds: 0),
  ));
  await remoteConfig.fetchAndActivate();

  final rawJson = remoteConfig.getString('config');
  final configMap = jsonDecode(rawJson);

  // Set config
  locator<AppConfigService>().setConfig(configMap);

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        // statusBarColor: AppColor.primary,
        // statusBarIconBrightness: Brightness.light,
        // statusBarBrightness: Brightness.dark,

        statusBarColor: Colors.transparent,
    //    statusBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return GetMaterialApp(
      title: 'TJW',
      initialRoute: '/dashboard',  // login
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      theme: AppStyle.appTheme,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
