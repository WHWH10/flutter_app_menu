import 'package:flutter/material.dart';
import 'package:flutter_app_menu/provider/menu_provider.dart';
import 'package:flutter_app_menu/ui/detail/menu_detail.dart';
import 'package:provider/provider.dart';

import 'constant.dart';

class MenuPopularCard extends StatefulWidget {
  final int? index;
  final String? popularName;
  final Color? color;

  const MenuPopularCard({Key? key, this.index, this.popularName, this.color})
      : super(key: key);

  @override
  _MenuPopularCardState createState() => _MenuPopularCardState();
}

class _MenuPopularCardState extends State<MenuPopularCard> {
  int _index = 0;
  String popularName = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _index = widget.index ?? 0;
    popularName = widget.popularName ?? '';
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MenuProvider>();
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MenuDetail(
                  provider: provider,
                  imageAsset: popularImageAssets[_index],
                  name: popularName,
                  price: popularPrice[_index])),
        );
      },
      child: Container(
        width: 310,
        child: Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              color: widget.color,
              child: Container(
                height: 300,
                child: Center(
                  child: Hero(
                    tag: popularImageAssets[_index],
                    child: Image.asset(popularImageAssets[_index],
                        width: 230, height: 230, fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 250,
              left: 30,
              child: Container(
                height: 160,
                width: 250,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: white,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            popularName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: black,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            '￦${popularPrice[_index]}',
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: mainColor,
                              ),
                              Icon(
                                Icons.star,
                                color: mainColor,
                              ),
                              Icon(
                                Icons.star,
                                color: mainColor,
                              ),
                              Icon(Icons.star, color: mainColor),
                              Icon(Icons.star_border, color: mainColor)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 5),
                          child: Container(
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: categoryColor4),
                            child: Center(
                              child: Text(
                                '분식',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
