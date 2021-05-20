import 'package:flutter/material.dart';
import 'package:flutter_app_menu/provider/menu_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'model/like_item_model.dart';
import 'resource/api_service.dart';
import 'ui/splash/menu_splash.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<LikeItemModel>('likeFood');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(create: (_) => ApiService.create()),
        ChangeNotifierProvider(create: (_) => MenuProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pick the Menu',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MenuSplash(),
      ),
    );
  }
}
