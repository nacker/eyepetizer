import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:eyepetizer/http/Url.dart';
import 'package:eyepetizer/utils/cache_manager.dart';

class AppInit {
  AppInit._();

  static Future<void> init() async {
    await CacheManager.preInit();
    Url.baseUrl = 'http://baobab.kaiyanapp.com/api/';
    Future.delayed(Duration(milliseconds: 2000), () {
      FlutterSplashScreen.hide();
    });
  }
}
