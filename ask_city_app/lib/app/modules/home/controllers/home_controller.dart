import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:get/get.dart';
import 'package:hawary/app/config/routes/app_pages.dart';
import 'package:hawary/app/features/dashboard/controllers/dashboard_controller.dart';
import 'package:hawary/app/utils/models/player_model.dart';
import 'package:hawary/app/utils/providers/player_provider.dart';
import 'package:hawary/app/utils/providers/users_provider.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  var isPlayer = false;
  DashboardController currentMembership = Get.put(DashboardController());
  var membership = "";
  void setMembership() {
    // membership = currentMembership as String;
  }

  RxBool player = true.obs;

  Color teamTheme = Color(0xFF1F519A);
  Color playerTheme = Color(0xFF474F59);

  var isDataLoading = false.obs;
  late final List? playersList;
  var userID = '';

  var test = ''.obs;

  void goToProfileScreen() async {
    print("userid $userID");
    await Get.toNamed(Routes.friend_profile, arguments: [userID, membership],);
  }

  getAllPlayer() async {
    try {
      isDataLoading(true);
      await PlayerProvider().getAllPlayers();
    } catch (e) {
      print('error while geting the data $e');
    } finally {
      isDataLoading(false);
    }
  }

  @override
  void onInit() {
    setMembership();
    super.onInit();
    PlayerProvider().getAllPlayers().then((value) {
      print(value);
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
