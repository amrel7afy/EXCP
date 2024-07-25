import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io' show InternetAddress, Platform, SocketException, exit;
import 'dart:math';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/helper/cache_helper.dart';
import 'package:test1/core/helper/extensions.dart';

import '../components/alert/custom_alert_message.dart';
import '../models/response/response.dart';
import '../utility/app_setting.dart';


class AppService {
  static String apikey = "UGFzc05BU0FQSUBOYXNBUElVc2VyMTIzQFBhc3M6TmFzQVBJVXNlcjEyM0B1c2Vy#";
  static String apiRequestHTML = "RequestTemplate,";
  static String platform = getPlatformName();

  ///[actionType] The type of the action get or post
  ///[apiName] The api url name api/controller/method
  ///[body] The data send with post request

  static Future callService({
    required ActionType actionType,
    required String apiName,

    required body}) async {
    Random random = Random();
    int timeX = (1000 + random.nextInt(1000));
    var apiUrl = Uri.parse("${AppSetting.serviceURL}ar/$apiName");
   // await registerDeviceOneSignal();

    var header = {
      "content-type": 'application/json',
      "TimeX": timeX.toString(),
      "cache-control": "no-cache",
      "SignAuth": "$apikey${getSignature(apiUrl, timeX)}",
      "platform": 'android',
      "version": '3.0.0',
      "source": "1",
      "Accept": 'application/json, text/plain, /',
    };


    if (!checkIfNotLogin(apiUrl.toString())) {
      String? token = await getStoredToken();
      if (token != null) {
        header.update('Authorization', (value) => "bearer $token",
            ifAbsent: () => "bearer $token");
      }
    }
    dev.log(apiUrl.toString(), name: "URL");
    dev.log(json.encode(header).toString(), name: "HEADER");
    dev.log(json.encode(body).toString(), name: "BODY");

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final response = actionType == ActionType.get
            ? await http.get(apiUrl, headers: header)
            : await http.post(apiUrl, headers: header, body: json.encode(body));

        /// Record Firebase Crashlytics
        dev.log(response.statusCode.toString(), name: "STATUS CODE");
        dev.log(response.body.toString(), name: "RESULT");
        if (response.statusCode == 401) {
          await response401();
        } else {
          var result = await responseValue(
              response.body, Get.context, checkIfREQUESTHTML(apiUrl));
          return result;
        }
      } else {
        return null;
      }
    } catch (e) {

    }
  }
     static getStoredToken() async {
    String? storedToken =
    await SharedPrefHelper.getSecuredString(AppConstants.tokenKey);
    if (storedToken != null) {
      return storedToken;
    } else {
      return null;
    }
  }


  static checkIfNotLogin(String apiUrl) {
    if (apiUrl.contains('login') ||
        apiUrl.contains('ResetPassword') ||
        apiUrl.contains('ReGenrateCode') ||
        apiUrl.contains('register') ||
        apiUrl.contains('VerifyCode') ||
        apiUrl.contains('ForgotPassword')) {
      return true;
    } else {
      return false;
    }
  }
  Future getRequestExternalUrl(String url) async {

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.body;
      }
      else {
        return null;
      }
    } on SocketException catch (_) {
      return null;
    }

  }
  static String getSignature(url, int key) {
    int x = url.toString().split('/').length;
    int y = url.toString().split('?').length;
    int portion1 = 2 * key;

    portion1 = portion1 + x;
    portion1 = portion1 + y;
    portion1 = portion1 + 8;

    int portion2 = key + x;
    portion2 = portion2 - y;
    portion2 = portion2 - 2;
    int portion3 = portion1 + portion2;
    portion3 = portion3 + 5;
    var portion4 = x + y;
    int sign = portion3 + portion4;
    return sign.toString();
  }
  static responseValue(String response, context,
      [bool requestHtml = false]) async {
    if (!requestHtml) {
      // ignore: unnecessary_string_escapes
      response = response.replaceAll('/\ ', '"\\\\');
    }

    var getResponse = GetResponse.fromJson(jsonDecode(response));

    if (getResponse.status == 200) {
      var responseResult = jsonDecode(response);
      return jsonEncode(responseResult["data"]);

      /// 306 Code Update version
    } else if (getResponse.status == 306){
     /* String message= getResponse.message.toString().replaceAll('"', '');
      String msg = message.isNotEmpty && message!='null' ? message: AppWords.update_new_version_message.tr;
      String urlLink = Platform.isIOS==true
          ? 'https://apps.apple.com/us/app/enaya/id1491310421'
          : 'https://play.google.com/store/apps/details?id=com.excprotection.EnayaMobile';
      await customAlertOptional(
        title: msg,
        alertType: AlertType.sorry.tr,
        textSecondButton: GlobalWords.close.tr ,
        willPopScope: false,
        onTap: (){
          LaunchUrl.openUrl(url: urlLink);
          // exit(0);
        } ,
        onCancel: (){exit(0);},
      );*/
      /// CODE 300 MEAN AMBIGUOUS RESULT
    }else if (getResponse.status ==300){
      try {
        /// CODE 300.1 MEANS NOTIFY IS SOME THING DONE OR SEND LEAD WITH USER REQUIRE
        if(getResponse.code.toString() == '300.1'){
         /* await customAlertOptional(
            title: getResponse.message,
            textButton: HourlyTR.create_new_order.tr,
            alertType: GlobalWords.sorry.tr,
            onTap: () {
              if (BlocProvider.of<DynamicStepCubit>(Get.context!, listen: false).serviceType ==
                  ServiceType.hourlyServiceType) {
                goToScreenpopAndPushNamed(screenNames: ScreenNames.createLeadHourly);
              }else{
                goToScreenpopAndPushNamed(screenNames: ScreenNames.createLeadIndiv);
              }
            }, onCancel: (){ goBack(); },
          );*/
        }
        // /// CODE 300.3 MEANS USER IS HAVE CONTRACT NOT PAID
        // else  if( getResponse.code.toString()=='300.3'){
        //   await customAlertMessage(alertType: GlobalWords.sorry.tr,
        //       txt: '${getResponse.message}',
        //       onClick: (){
        //         goToWithRemoveRoute(screenNames: ScreenNames.getContract, );
        //       }
        //   );
        // }
        else if(getResponse.code.toString() == '300.4'){
          /*await customAlertContactUs(
            title: getResponse.message,
          );*/
        }
        /// CODE 300.2 MEANS USER IS HAVE CONTRACT NOT PAID - HOURLY CONTRACT
        else if( getResponse.code.toString()=='300.3'){
         /* await customAlertOptional(
              alertType: GlobalWords.sorry.tr,
              title: getResponse.message.toString(),
              onTap: (){
                goToScreenpopAndPushNamed(screenNames: getResponse.location, arguments: getResponse.data );
              }, onCancel: (){
            goBack();
          }
          );*/
        }
        else {
          await customAlertMessage(
            txt: '${getResponse.message}',
            alertType: 'عفواً',
            onClick: () {
              context.pop();
            });
        }
      } catch (_) {}


    }else {
      await customAlertMessage(
          txt: getResponse.message ?? "",
          alertType: 'عفواً',
          onClick: () {
            context.pop();
          });

      return null;
    }
  }
  static response401() async {
    await await customAlertMessage(
        txt: 'برجاء تسجيل الدخول مرة اخرى',
        alertType: 'عفواً',
        onClick: () {
          Get.context?.pop();
        });
    return null;
  }
  static checkIfREQUESTHTML(apiURL) {
    bool contain = false;
    apiRequestHTML.split(',').forEach((element) {
      contain = apiURL.toString().contains(element);
    });
    return contain;
  }
  static String getPlatformName() {
    if (kIsWeb) {
      return "Android";
    } else {
      return Platform.operatingSystem.toString();
    }
  }
}

/*processToLogin() {
  goBack();
  generalData.screenToBack =
      Get.currentRoute ;

  goToScreen(screenNames: ScreenNames.loginScreen);
}}*/
enum ActionType { get, post }