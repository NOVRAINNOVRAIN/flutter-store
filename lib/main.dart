import 'package:flutter/material.dart';
import 'package:demo1/constant/color.dart';
import 'package:demo1/provider/user_provider.dart';
import 'package:provider/provider.dart';
import './app.dart';
import './provider/providers.dart';
import 'package:fluro/fluro.dart';
import './fluro/Application.dart';
import './fluro/Routes.dart';
// 路由配置-----end

void main() {
  FluroRouter router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<UserProvider>(
        builder: (context, userProvider, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '典典小卖部',
          //自定义主题
          theme: myDefaultTheme,
          // 声明路由
          onGenerateRoute: Application.router.generator,
          home: new App(),
        ),
      ),
    );
  }
}

//自定义主题,绿色小清新风格
final ThemeData myDefaultTheme = new ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Color(0xFFebebeb),
    cardColor: Colors.green
);


