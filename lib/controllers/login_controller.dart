import 'package:flutter_web/components/message.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

class LoginController extends GetxController {
  final unameController = TextEditingController();
  final pwdController = TextEditingController();
  final userName = 'root';
  final userPwd = '12345678';

  // 是否显示明文密码
  var displayPwd = false.obs;

  //设置globalKey，用于后面获取FormState对密码和账号进行校验
  final formKey = GlobalKey<FormState>();

  // 校验用户名
  String? validatorUserName(String? txt) {
    return txt!.trim().isNotEmpty ? null : "用户名不能为空";
  }

  // 校验密码
  String? validatorPwd(String? txt) {
    return txt!.trim().length > 5 ? null : "密码不能少于6位";
  }

  // 登陆过按钮
  void btnLogin() {
    if ((formKey.currentState as FormState).validate()) {
      // 通过验证
      var _name = unameController.text.trim();
      var _pwd = pwdController.text.trim();
      if (_name == userName && _pwd == userPwd) {
        Get.offNamed('/home');
      } else {
        Message.error('账号或密码错误');
      }
    }
  }

  void btnReset() {
    formKey.currentState?.reset();
  }
}
