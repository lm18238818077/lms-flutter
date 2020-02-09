/*
 * @Description: 路由管理
 * @Author: luoguoxiong
 * @Date: 2019-08-24 17:29:18
 */

import 'package:flutter/material.dart';
import './noFound.dart';
import 'package:lms_flutter/pages/index.dart';

class Router {
  // 路由声明
  static Map<String, Function> routes = {
    '/home': (context) => Page(),
  };

  // 路由初始化
  static run(RouteSettings settings) {
    final Function pageContentBuilder = Router.routes[settings.name];

    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        // 传参路由
        return MaterialPageRoute(
            builder: (context) =>
                pageContentBuilder(context, arguments: settings.arguments));
      } else {
        // 无参数路由
        return MaterialPageRoute(
            builder: (context) => pageContentBuilder(context));
      }
    } else {
      // 404页
      return MaterialPageRoute(builder: (context) => NoFoundPage());
    }
  }

// 组件跳转
  static link(Widget child, String routeName, BuildContext context,
      [Map parmas, Function callBack]) {
    return GestureDetector(
      onTap: () {
        if (parmas != null) {
          Navigator.pushNamed(context, routeName, arguments: parmas)
              .then((onValue) {
            if (callBack != null) {
              callBack();
            }
          });
        } else {
          Navigator.pushNamed(context, routeName).then((onValue) {
            if (callBack != null) {
              callBack();
            }
          });
        }
      },
      child: child,
    );
  }

// 方法跳转
  static push(String routeName, BuildContext context,
      [Map parmas, Function callBack]) {
    if (parmas != null) {
      Navigator.pushNamed(context, routeName, arguments: parmas)
          .then((onValue) {
        if (callBack != null) {
          callBack();
        }
      });
    } else {
      Navigator.pushNamed(context, routeName).then((onValue) {
        if (callBack != null) {
          callBack();
        }
      });
    }
  }

  static pop(context) {
    Navigator.pop(context);
  }
}
