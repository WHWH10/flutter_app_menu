import 'package:flutter/material.dart';
import 'package:flutter_app_menu/model/like_item_model.dart';
import 'package:flutter_app_menu/provider/menu_provider.dart';
import 'package:flutter_app_menu/ui/search/menu_search.dart';
import 'package:flutter_app_menu/ui/setting/menu_setting.dart';
import 'package:flutter_app_menu/utils/constant.dart';
import 'package:flutter_app_menu/utils/menu_popular_card.dart';
import 'package:hive/hive.dart';

import 'favorite/menu_favorite.dart';
import 'home/menu_home.dart';
import 'package:provider/provider.dart';

class MenuMain extends StatefulWidget {
  @override
  _MenuMainState createState() => _MenuMainState();
}

class _MenuMainState extends State<MenuMain> {
  Box<LikeItemModel>? _likeItemBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _likeItemBox = Hive.box('likeFood');
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MenuProvider>();

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'Pick the Menu',
          style: TextStyle(color: black),
        ),
        elevation: 0,
        backgroundColor: white,
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: mainColor,
            ),
            onPressed: () {
              print('WOW!');
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: provider.currentIndex,
        children: [MenuHome(), MenuSearch(), MenuFavorite(), MenuSetting()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.setCurrentIndex(index);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: lightGrey,
        unselectedItemColor: menuColor2,
        unselectedLabelStyle: TextStyle(color: menuColor2),
        selectedItemColor: mainColor,
        selectedLabelStyle: TextStyle(color: mainColor),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'SEARCH'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'FAVORITE'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'SETTING'
          )
        ],
      ),
    );
  }
}
