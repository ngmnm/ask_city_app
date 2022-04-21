// ignore_for_file: prefer_const_literals_to_create_immutables

library home_view;

import 'package:ask_city_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

part '../components/search_bar.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color(0xFF864ADB),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'الاسئلة الشائعة',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shield_outlined),
                label: 'الاشعارات',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'المفضلة',
              ),
            ],
            currentIndex: controller.tabIndex,
            selectedItemColor: Color(0xFFFEB500),
            unselectedItemColor: Colors.deepPurple,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            iconSize: 21,
            onTap: controller.onItemTapped,
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      width: Get.width * 0.3,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFF864ADB)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(FontAwesomeIcons.mapMarkerAlt,
                              color: Colors.white70),
                          Text(
                            "KHOBAR",
                            style: TextStyle(color: Colors.white70),
                          )
                        ],
                      )),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      FontAwesomeIcons.solidUserCircle,
                      color: Colors.black54,
                      size: 30,
                    ),
                    Container(
                      width: Get.width * 0.7,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFFE7ECF0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                          textDirection: TextDirection.rtl,
                          textCapitalization: TextCapitalization.words,
                          style: TextStyle(
                            color: Color(0xFF000000),
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.only(right: 14.0, bottom: 5),
                              hintText: "Search...",
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0xCCCCCCCC),
                                fontWeight: FontWeight.normal,
                              ),
                              hintTextDirection: TextDirection.rtl),
                          textInputAction: TextInputAction.search),
                    ),
                    Icon(
                      FontAwesomeIcons.cog,
                      color: Colors.black54,
                      size: 30,
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                ),
                DefaultTabController(
                  length: 5, // length of tabs
                  initialIndex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      Container(
                        child: TabBar(
                          isScrollable: true,
                          labelColor: Color(0xFF474F59),
                          labelStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                          unselectedLabelColor: Color(0xFF837D7D),
                          unselectedLabelStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.normal),
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                                width: 2.0, color: Color(0xFF474F59)),
                          ),
                          tabs: [
                            Tab(text: 'main'),
                            Tab(text: 'coffee shops'),
                            Tab(text: 'restaurants'),
                            Tab(text: 'shops'),
                            Tab(text: 'other'),
                          ],
                        ),
                      ),
                      Container(
                        height: 400, //height of TabBarView
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Color(0xFF474F59), width: 0.5))),
                        child: TabBarView(
                          children: <Widget>[
                            Container(
                              child: Container(
                                height: 500,
                                padding:
                                    const EdgeInsets.fromLTRB(11, 20, 11, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          11, 8, 11, 0),
                                      width: Get.width * 0.8,
                                      // color: Colors.white,
                                      height: Get.height * 0.25,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.black12),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "#Other",
                                                style: TextStyle(fontSize: 25),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Icon(
                                                    FontAwesomeIcons
                                                        .exclamationCircle,
                                                    color: Colors.black54,
                                                    size: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Icon(
                                                    FontAwesomeIcons.shareAlt,
                                                    color: Colors.black54,
                                                    size: 20,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '4 weeks ago',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  'Where do I find the best thobe tailor in Khobar?')
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.solidBookmark,
                                                color: Colors.black54,
                                                size: 20,
                                              ),
                                              Icon(
                                                FontAwesomeIcons
                                                    .solidCommentAlt,
                                                color: Colors.black54,
                                                size: 20,
                                              ),
                                              Icon(
                                                FontAwesomeIcons.retweet,
                                                color: Colors.black54,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: Center(child: Text("test")),
                            ),
                            Container(
                              child: Center(child: Text("test")),
                            ),
                            Container(
                              child: Center(child: Text("test")),
                            ),
                            Container(
                              child: Center(child: Text("test")),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )));
    });
  }
}
