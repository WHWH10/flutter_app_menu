import 'package:flutter/material.dart';
import 'package:flutter_app_menu/utils/constant.dart';
import 'package:flutter_app_menu/utils/menu_popular_card.dart';

class MenuHome extends StatefulWidget {
  @override
  _MenuHomeState createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  TextEditingController _searchController = TextEditingController();
  FocusNode _searchNode = FocusNode();

  Map<String, dynamic> categoryMap = {};
  List<Color> categoryColor = [];
  List<Color> menuColor = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < categoryNameList.length; i++) {
      categoryMap.addAll({categoryNameList[i]: categoryIconList[i]});
    }
    categoryColor = [
      categoryColor1,
      categoryColor2,
      categoryColor3,
      categoryColor4,
      categoryColor5
    ];
    menuColor = [menuColor1, menuColor2, menuColor3, menuColor4, menuColor5];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    _searchNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _top(),
          _search(),
          _category(),
          _popularTitle(),
          _popular(),
          _offerTitle(),
          _offer(),
        ],
      ),
    );
  }

  Widget _top() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: Container(
        child: Text(
          'Welcome!',
          style: TextStyle(
              color: deepBlueColor, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  Widget _search() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 30),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Icon(
                Icons.search,
                color: black,
              ),
            ),
            Expanded(
                child: TextFormField(
              controller: _searchController,
              focusNode: _searchNode,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Search Food"),
              cursorColor: deepBlueColor,
              onFieldSubmitted: (value) {
                // _searchNode.dispose();
                // _searchMenu(value);
              },
            ))
          ],
        ),
      ),
    );
  }

  Widget _category() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Container(
        height: 130,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryMap.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Card(
                    color: categoryColor[index],
                    child: Container(
                      width: 80,
                      child: Center(
                        child: Image.asset(
                          categoryMap.values.elementAt(index),
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(categoryMap.keys.elementAt(index),
                        style: TextStyle(
                            color: black, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _popularTitle() {
    return Padding(
        padding: const EdgeInsets.only(top: 20, left: 10),
        child: Row(
          children: [
            Text(
              'Most Popular',
              style: TextStyle(
                  color: deepBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Image.asset(
                'assets/icon/category/sparkles.png',
                width: 30,
                height: 30,
              ),
            )
          ],
        ));
  }

  Widget _popular() {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Container(
        height: 440,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: popularName.length,
          itemBuilder: (context, index) {
            return MenuPopularCard(
                // key: Key(index.toString()),
                index: index,
                popularName: popularName[index],
                color: menuColor[index]);
          },
        ),
      ),
    );
  }

  //https://apps.timwhitlock.info/emoji/tables/unicode
  Widget _offerTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: Text(
        'Our Special Offer \u{1f60e}',
        style: TextStyle(
            color: deepBlueColor, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Widget _offer() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 120,
      width: MediaQuery.of(context).size.width,
      // color: Constant.deepBlueColor,
      child: Image.network(
        'https://www.jeffbullas.com/wp-content/uploads/2020/10/Banner-Designs-Inspiration-Starbucks-Draft.jpg',
        fit: BoxFit.contain,
      ),
    );
  }
}
