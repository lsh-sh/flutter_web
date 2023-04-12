library app_pages;

import 'package:flutter_web/bindings/login_binding.dart';
import 'package:flutter_web/pages/home_page.dart';
import 'package:flutter_web/pages/login_page.dart';
import 'package:get/route_manager.dart';

part './app_routes.dart';

class AppPages {
  // 初始路由
  static const inital = Routes.login;

  // 路由跳转列表
  static final routes = <GetPage>[
    GetPage(
        name: Routes.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(name: Routes.home, page: () => const HomePage())
  ];
}
