import 'package:flutter/material.dart';
import 'package:restauranttdd0/features/splash/components/body.dart';

import '../../common/app_const_data/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
