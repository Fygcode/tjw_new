import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppConfigService {
  AppConfig _appConfig = AppConfig(
      appName: "Heavenly", baseApiUrl: "", firebaseNotificationApiKey: "");
 // AppEnvironment? _appEnvironment;
  String? _packageName;

//  AppEnvironment? get appEnvironment => _appEnvironment;

  String get envString {
    if (_packageName?.endsWith(".dev") == true) {
      return "DEVELOP";
    } else if (_packageName?.endsWith(".uat") == true) {
      return "UAT";
    } else {
      return "PROD";
    }
  }

  Color get color {
    if (_packageName?.endsWith(".dev") == true) {
      return Colors.red;
    } else if (_packageName?.endsWith(".uat") == true) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  AppConfig get config {
    return _appConfig;
  }

  // setConfig(String value, AppEnvironment appEnvironment, String packageName) {
  //   _packageName = packageName;
  //   _appConfig = AppConfig.fromJson(jsonDecode(value));
  //   _appEnvironment = appEnvironment;
  // }
}

class AppConfig {
  String appName = '';
  String baseApiUrl = '';
  String? baseAuthApiUrl;
  String? baseFileUrl;
  String? appStoreVersion;
  String? oneSignalId;
  String? razorpayId;
  String? playStoreVersion;
  bool? forceUpdate;
  String? updateTitle;
  String? updateSubtitle;
  String? phone;
  String? mail;
  bool? otpMobile;
  String? firebaseNotificationApiKey = '';
  String? googleApiKey;
  String? messageApiKey;
  String? about;
  String? insta;
  String? twitter;
  bool? isDeactivate;
  String? church_about_url;
  String? successUrl;
  bool? isHeavenlyDonation;
  String? hideContent;
  Android? android;
  AppUrl? appUrl;
  IOS? iOS;

  AppConfig(
      {required this.appName,
        required this.baseApiUrl,
        this.baseAuthApiUrl,
        this.baseFileUrl,
        this.appStoreVersion,
        this.oneSignalId,
        this.playStoreVersion,
        this.forceUpdate,
        this.updateTitle,
        this.updateSubtitle,
        this.phone,
        this.mail,
        required this.firebaseNotificationApiKey,
        this.googleApiKey,
        this.messageApiKey,
        this.android,
        this.appUrl,
        this.iOS,
        this.about,
        this.insta,
        this.twitter,
        this.isDeactivate,
        this.church_about_url,
        this.successUrl,
        this.isHeavenlyDonation,this.hideContent,this.otpMobile,this.razorpayId});

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig(
      appName: json['AppName'],
      baseApiUrl: json['BaseApiUrl'],
      baseAuthApiUrl: json['BaseAuthApiUrl'],
      baseFileUrl: json['BaseFileUrl'],
      appStoreVersion: json['AppStore_Version'],
      oneSignalId: json['One_Signal_Id'],
      razorpayId: json['razorpayId'],
      playStoreVersion: json['PlayStore_Version'],
      forceUpdate: json['force_Update'],
      updateTitle: json['update_title'],
      updateSubtitle: json['update_subtitle'],
      phone: json['phone'],
      mail: json['mail'],
      otpMobile: json['otpMobile'],
      firebaseNotificationApiKey: json['FirebaseNotificationApiKey'],
      googleApiKey: json['googleApiKey'],
      messageApiKey: json['messageApiKey'],
      about: json['about'],
      insta: json['insta'],
      twitter: json['twitter'],
      isDeactivate: json['isDeactivate'],
      church_about_url: json['church_about_url'],
      successUrl: json['successUrl'],
      isHeavenlyDonation: json['isHeavenlyDonation'],
      hideContent: json['hideContent'],
      android: Android.fromJson(json['Android']),
      appUrl: json['AppUrl'] != null ? AppUrl.fromJson(json['AppUrl']) : null,
      iOS: json['IOS'] != null ? IOS.fromJson(json['IOS']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AppName'] = this.appName;
    data['BaseApiUrl'] = this.baseApiUrl;
    data['BaseAuthApiUrl'] = this.baseAuthApiUrl;
    data['BaseFileUrl'] = this.baseFileUrl;
    data['AppStore_Version'] = this.appStoreVersion;
    data['One_Signal_Id'] = this.oneSignalId;
    data['razorpayId'] = this.razorpayId;
    data['PlayStore_Version'] = this.playStoreVersion;
    data['force_Update'] = this.forceUpdate;
    data['update_title'] = this.updateTitle;
    data['update_subtitle'] = this.updateSubtitle;
    data['phone'] = this.phone;
    data['mail'] = this.mail;
    data['otpMobile'] = this.otpMobile;
    data['FirebaseNotificationApiKey'] = this.firebaseNotificationApiKey;
    data['googleApiKey'] = this.googleApiKey;
    data['messageApiKey'] = this.messageApiKey;
    data['about'] = this.about;
    data['insta'] = this.insta;
    data['twitter'] = this.twitter;
    data['isDeactivate'] = this.isDeactivate;
    data['church_about_url'] = church_about_url;
    data['successUrl'] = successUrl;
    data['isHeavenlyDonation'] = isHeavenlyDonation;
    data['hideContent'] = hideContent;
    if (this.android != null) {
      data['Android'] = android!.toJson();
    }
    if (this.appUrl != null) {
      data['AppUrl'] = appUrl!.toJson();
    }
    if (this.iOS != null) {
      data['IOS'] = this.iOS!.toJson();
    }
    return data;
  }
}

class Android {
  String? url;
  String? version;
  String? appID;
  bool? hideGiving;

  Android({this.url, this.version, this.appID, this.hideGiving});

  factory Android.fromJson(Map<String, dynamic> json) {
    print("json $json");
    return Android(
      url: json['Url'],
      version: json['Version'],
      appID: json['AppID'],
      hideGiving: json['hideGiving'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Url'] = this.url;
    data['Version'] = this.version;
    data['AppID'] = this.appID;
    data['hideGiving'] = this.hideGiving;
    return data;
  }
}

class AppUrl {
  String? terms;
  String? privacy;
  String? refundPolicy;
  String? contactEmail;
  String? contactPhone;

  AppUrl(
      {this.terms,
        this.privacy,
        this.refundPolicy,
        this.contactEmail,
        this.contactPhone});

  AppUrl.fromJson(Map<String, dynamic> json) {
    terms = json['terms'];
    privacy = json['privacy'];
    refundPolicy = json['refund_policy'];
    contactEmail = json['contact_email'];
    contactPhone = json['contact_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['terms'] = this.terms;
    data['privacy'] = this.privacy;
    data['refund_policy'] = this.refundPolicy;
    data['contact_email'] = this.contactEmail;
    data['contact_phone'] = this.contactPhone;
    return data;
  }
}

class IOS {
  String? url;
  String? version;
  String? appId;
  bool? hideGiving;

  IOS({this.url, this.version, this.appId,this.hideGiving});

  IOS.fromJson(Map<String, dynamic> json) {
    url = json['Url'];
    version = json['Version'];
    appId = json['AppId'];
    hideGiving = json['hideGiving'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Url'] = this.url;
    data['Version'] = this.version;
    data['AppId'] = this.appId;
    data['hideGiving'] = this.hideGiving;
    return data;
  }
}

