import 'dart:io';
import 'dart:math';

import 'package:domino_point/src/helper/spcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/route_manager.dart';

import 'package:intl/intl.dart' as intl;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SPHelper {
  static isThisTablet(context) {
    return MediaQuery.of(context).size.width > 600;
  }

  static showToast(
    String msg, {
    String? title,
    Color? titleColor,
    bool isPrint = false,
    bool isError = false,
    bool isWarning = false,
    bool isInfo = false,
    bool isSuccess = false,
  }) {
    if (isPrint) {
      // print("${title == null ? '' : "$title: "}$msg");
      return;
    }
    Get.showSnackbar(GetSnackBar(
      snackPosition: SnackPosition.TOP,
      backgroundColor: isSuccess
          ? const Color.fromARGB(255, 26, 190, 26)
          : isInfo
              ? const Color.fromARGB(255, 3, 141, 233)
              : isWarning
                  ? const Color.fromARGB(255, 233, 229, 3)
                  : isError
                      ? Colors.red.shade400
                      : SPColors.bg,
      borderRadius: 10,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: title == null ? 20 : 10,
      ),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      message: msg,
      boxShadows: SPColors.boxShadowLarge,
      messageText: Text(
        msg,
        style: TextStyle(
          color: isError ? SPColors.text.shade50 : SPColors.text.shade900,
          fontSize: 14,
        ),
      ),
      titleText: title == null
          ? null
          : Text(
              title,
              style: TextStyle(
                color: isError
                    ? SPColors.text.shade50
                    : (titleColor ?? SPColors.text.shade900),
                fontSize: 16,
              ),
            ),
      duration: const Duration(seconds: 2),
    ));
  }

  static Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      SPHelper.showToast("No internet connection");
      return false;
    }
  }

  static Future<void> launchInBrowser(String? url) async {
    if (url == null || url.trim().isEmpty) {
      return;
    }

    await launchUrl(
      Uri.parse(
        url,
      ),
      mode: LaunchMode.externalApplication,
    );
  }

  static Future<void> launchInBrowserExternal(String? url) async {
    if (url == null || url.trim().isEmpty) {
      SPHelper.showToast("No url found");
      return;
    }

    launchUrl(
      Uri.parse(
        url.trim(),
      ),
      mode: LaunchMode.externalApplication,
    );
  }

  static Future<void> makePhoneCall(String? phoneNumber) async {
    if (phoneNumber == null || phoneNumber.trim().isEmpty) {
      return;
    }
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(
      Uri.parse(launchUri.toString()),
      mode: LaunchMode.externalApplication,
    );
  }

  static String formatPhoneNumber(String? s, {spaces = ' ', with0 = false}) {
    if (s == null) return '';
    //+9647503505440
    // to
    // 0750 350 5440
    if (s.length == 14) {
      return "${s.substring(0, 4)}$spaces${with0 ? '(0)' : ''}${s.substring(4, 7)}$spaces${s.substring(7, 10)}$spaces${s.substring(10)}";
    } else if (!s.startsWith('+') && s.length == 13) {
      return "${s.substring(0, 3)}$spaces${with0 ? '(0)' : ''}${s.substring(3, 6)}$spaces${s.substring(6, 9)}$spaces${s.substring(9)}";
    } else if (s.length == 10) {
      // 7503505440 -> 0750 350 5440
      return "0${s.substring(0, 3)}$spaces${with0 ? '(0)' : ''}${s.substring(3, 6)}$spaces${s.substring(6)}";
    } else if (s.length == 11) {
      // 07503505440 -> 0750 350 5440
      return "${s.substring(0, 4)}$spaces${with0 ? '(0)' : ''}${s.substring(4, 7)}$spaces${s.substring(7)}";
    }
    if (s.length == 13) {
      return "${s.substring(0, 4)}$spaces${with0 ? '(0)' : ''}${s.substring(4, 7)}$spaces${s.substring(7, 10)}$spaces${s.substring(10)}";
    } else if (!s.startsWith('+') && s.length == 13) {
      return "${s.substring(0, 3)}$spaces${with0 ? '(0)' : ''}${s.substring(3, 6)}$spaces${s.substring(6, 9)}$spaces${s.substring(9)}";
    } else if (s.length == 10) {
      // 7503505440 -> 0750 350 5440
      return "0${s.substring(0, 3)}$spaces${with0 ? '(0)' : ''}${s.substring(3, 6)}$spaces${s.substring(6)}";
    } else if (s.length == 11) {
      // 07503505440 -> 0750 350 5440
      return "${s.substring(0, 4)}$spaces${with0 ? '(0)' : ''}${s.substring(4, 7)}$spaces${s.substring(7)}";
    }
    return s;
  }

  static String formatNumber(amount, {String format = '#,###', postFix = ''}) {
    if (amount == null) return '';
    if (amount is int || amount is double) {
      return "${intl.NumberFormat(format).format(amount)}$postFix";
    }
    return '';
  }

  static String formatDate(date, {String format = 'dd/MM/yyyy'}) {
    if (date == null) return '';

    if (date is DateTime) {
      return intl.DateFormat(format).format(date);
    }
    return '';
  }

  static String formatDateTime(date, {String format = 'dd/MM/yyyy hh:mm a'}) {
    if (date == null) return '';

    if (date is DateTime) {
      return intl.DateFormat(format).format(date);
    }
    return '';
  }

  // static methode to extract the domain.tld from a url
  static String getDomainFromUrl(String? url) {
    if (url == null) return '';
    if (url.startsWith('http')) {
      return url.split('/')[2];
    }
    if (url.startsWith('https')) {
      return url.split('/')[2];
    }
    return url.split('/')[0];
  }

  static String keyAccessToken = 'access_token';

  // set String
  static Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  // get String
  static Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // set bool
  static Future<void> setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  // get bool
  static Future<bool?> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  // set int
  static Future<void> setInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  // get int
  static Future<int?> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  // set double
  static Future<void> setDouble(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  // get double
  static Future<double?> getDouble(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  // set StringList
  static Future<void> setStringList(String key, List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
  }

  // get StringList
  static Future<List<String>?> getStringList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  // remove
  static Future<void> remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  // clear
  static Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static String randomStringID([int extraLength = 0]) {
    //first character is letter A-Z
    // second and third characters are numbers 0-9
    // fourth character is a letter A-Z
    // fifth and sixth characters are numbers 0-9
    String randomID = '';
    var random = Random();
    for (var i = 0; i < (6 + extraLength); i++) {
      if (i == 0 || i == 3) {
        randomID += String.fromCharCode(random.nextInt(26) + 65); //A-Z
      } else {
        randomID += random.nextInt(10).toString(); //0-9
      }
    }
    return randomID;
  }
}

enum ImageSize { s, m, l }
