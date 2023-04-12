import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../views/screens/chat screen.dart';
import '../views/screens/favourites screen.dart';
import '../views/screens/home screen.dart';
import '../views/screens/notification screen.dart';


class BottomNavBarController extends GetxController {
  RxList navBarPages = [
    const Home(),
    const ChatsPage(),
    const NotificationPage(),
    const FavouritesPage(),
  ].obs;

  RxInt initialNavBarIndex = 0.obs;

  navBarIndex({required int index}) {
    initialNavBarIndex.value = index;
  }
}
