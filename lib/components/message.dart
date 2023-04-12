import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 显示页面顶部的message信息
class Message {
  Message(
      {required this.text,
      required this.textColor,
      required this.backgroundColor,
      required this.iconColor,
      required this.prefixIcon,
      this.seconds = 2}) {
    Flushbar(
      margin: const EdgeInsets.only(top: 20),
      backgroundColor: backgroundColor,
      borderRadius: 8,
      maxWidth: 600,
      icon: Icon(
        prefixIcon,
        size: 20.0,
        color: iconColor,
      ),
      flushbarPosition: FlushbarPosition.TOP,
      shouldIconPulse: false,
      messageText: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      duration: Duration(seconds: seconds),
    ).show(Get.context!);
  }

  final String text;
  final Color textColor;
  final Color backgroundColor;
  final IconData prefixIcon;
  final Color iconColor;
  final int seconds;

  // 错误信息
  Message.error(String message)
      : this(
            text: message,
            textColor: const Color(0xfff56c6c),
            prefixIcon: Icons.error,
            iconColor: const Color(0xfff56c6c),
            backgroundColor: const Color(0xfffef0f0));

  //警告信息
  Message.warning(String message)
      : this(
            text: message,
            textColor: const Color(0xffe6a23c),
            prefixIcon: Icons.warning,
            iconColor: const Color(0xffe6a23c),
            backgroundColor: const Color(0xfffdf6ec));

  // 成功信息
  Message.success(String message)
      : this(
            text: message,
            textColor: const Color(0xff67c23a),
            prefixIcon: Icons.check_circle,
            iconColor: const Color(0xff67c23a),
            backgroundColor: const Color(0xfff0f9eb));
}
