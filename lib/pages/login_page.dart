import 'package:flutter/material.dart';
import 'package:flutter_web/controllers/login_controller.dart';
import 'package:get/get.dart';

/// 登录页面
class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            // 配置整个页面的背景色
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.blue.withOpacity(.5)])),
        alignment: Alignment.center,
        // 中间登录框
        child: SizedBox(
          width: 500,
          height: 300,
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
              child: Form(
                  // form表单用于提交账号和密码
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      // 输入账号
                      inputNameBox(),
                      // 输入密码
                      inputPwdBox(),
                      // 登录和重置按钮
                      const SizedBox(height: 20),
                      loginAndResetBtn()
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget inputNameBox() {
    return TextFormField(
      controller: controller.unameController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
        labelText: '账号',
        hintText: '请输入账号',
        hintStyle: TextStyle(fontSize: 12),
        icon: Icon(Icons.person),
      ),
      validator: controller.validatorUserName,
    );
  }

  Widget inputPwdBox() {
    return Obx(() => TextFormField(
          controller: controller.pwdController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          // 否隐藏文本，用“•”替换
          obscureText: !controller.displayPwd.value,
          decoration: InputDecoration(
              labelText: '密码',
              hintText: '请输入密码',
              hintStyle: const TextStyle(fontSize: 12),
              icon: const Icon(
                Icons.lock,
                size: 20,
              ),
              suffix: IconButton(
                  onPressed: () {
                    controller.displayPwd.value = !controller.displayPwd.value;
                  },
                  icon: const Icon(
                    Icons.remove_red_eye,
                    size: 16,
                    color: Colors.grey,
                  ))),
          validator: controller.validatorPwd,
        ));
  }

  Widget loginAndResetBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // 登录按钮组件
        SizedBox(
          width: 70,
          height: 40,
          child: ElevatedButton(
              onPressed: controller.btnLogin, child: const Text('登录')),
        ),

        //重置按钮组件
        SizedBox(
          width: 70,
          height: 40,
          child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.grey)),
              onPressed: controller.btnReset,
              child: const Text('重置')),
        )
      ],
    );
  }
}
