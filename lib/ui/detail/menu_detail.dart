import 'package:flutter/material.dart';
import 'package:flutter_app_menu/model/image_result_model.dart';
import 'package:flutter_app_menu/provider/menu_provider.dart';
import 'package:flutter_app_menu/resource/api_service.dart';
import 'package:flutter_app_menu/utils/constant.dart';
import 'package:provider/provider.dart';

class MenuDetail extends StatefulWidget {
  final String? imageAsset;
  final String? name;
  final String? price;
  final provider;

  const MenuDetail(
      {Key? key,
      this.imageAsset,
      this.name,
      this.price,
      required this.provider})
      : super(key: key);

  @override
  _MenuDetailState createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetail> {
  List<String> categoryTitle = ['OVERVIEW', 'REVIEW', 'OTHER'];
  String imageAsset = '';
  List<ResultSubItemModel> _resultModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageAsset = widget.imageAsset ?? '';
    _searchOverView();
  }

  void _searchOverView() async {
    final api = context.read<ApiService>();
    api.getDictResult(widget.name ?? '').then((result) {
      print(result);
    }).catchError((onError) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: menuColor3,
            title: Text('오류'),
            titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
            content: Text('네트워크 오류입니다.\n${onError.toString()}'),
            contentTextStyle: TextStyle(fontSize: 15),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: categoryColor5,
                  textStyle: TextStyle(color: black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child:
                    Text('확인', style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MenuProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: menuColor4,
        elevation: 0,
        leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: white),
                child: Icon(
                  Icons.arrow_back,
                  color: mainColor,
                ),
              ),
            )),
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _imageWidget(),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                    height: 60,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                                width: 120,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary:
                                          provider.detailCategoryIndex == index
                                              ? mainColor
                                              : menuColor4,
                                      onPrimary:
                                          provider.detailCategoryIndex == index
                                              ? mainColor
                                              : menuColor4,
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(20),
                                      )),
                                  onPressed: () {
                                    provider.setDetailCategoryIndex(index);
                                  },
                                  child: Text(
                                    categoryTitle[index],
                                    style: TextStyle(
                                        color: provider.detailCategoryIndex ==
                                                index
                                            ? white
                                            : menuColor1),
                                  ),
                                )),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 6);
                        },
                        itemCount: 3))),
            IndexedStack(
              index: provider.detailCategoryIndex,
              children: [
                _overviewWidget(), /*_reviewWidget(), _otherWidget()*/
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _overviewWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Text('overview'),
    );
  }

  Widget _imageWidget() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: menuColor4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: Hero(
                tag: imageAsset,
                child: Image.asset(imageAsset),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: mainColor,
                          ),
                          onPressed: () {
                            print('click');
                          })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    '￦${widget.price}',
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
