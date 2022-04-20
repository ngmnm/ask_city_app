library home_view;

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:hawary/app/constants/assets_constant.dart';
import 'package:hawary/app/features/dashboard/controllers/dashboard_controller.dart';
import 'package:hawary/app/features/dashboard/controllers/teams_provider_controller.dart';
import 'package:hawary/app/features/home/controllers/home_controller.dart';
import 'package:hawary/app/features/membership_selection/controllers/membership_selection_controller.dart';
import 'package:hawary/app/features/registration/controllers/registration_controller.dart';
import 'package:hawary/app/utils/factory/membership.dart';
import 'package:hawary/app/utils/services/user_membership_get_storage.dart';

part '../components/region_teams.dart';
part '../components/search_bar.dart';
part '../components/region_leagues.dart';
part '../components/ads.dart';
part '../components/region_players.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    String membershipType = box.read("membership");


    String membershipId = Get.find<RegistrationController>().userId;
    Membership membership = Membership.forCode(membershipType, membershipId);
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text("الرئيسية"),
          ),
          backgroundColor: membership.getTheme()),
      backgroundColor: Color(0xFFF7F7F7),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 32, 16, 8),
          child: Column(
            textDirection: TextDirection.rtl,
            children: [
              _SearchBar(),
              SizedBox(height: 20),
              _RegionLeagues(),
              SizedBox(height: 40),
              _Ads(),
              SizedBox(height: 40),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    "فرق المنطقة",
                    style: GoogleFonts.almarai(
                      fontSize: 12,
                      color: Color(0xFF24559C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: SizedBox(height: 100.0, child: _RegionTeams()))
                  ]),
              SizedBox(height: 40),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    "لاعبو المنطقة",
                    style: GoogleFonts.almarai(
                      fontSize: 12,
                      color: Color(0xFF24559C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(children: <Widget>[
                Expanded(
                    child: SizedBox(height: 200.0, child: _RegionPlayers()))
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
