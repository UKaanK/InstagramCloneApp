import 'package:flutter/material.dart';
import 'package:instagramclone/components/bottomNavBarPage.dart';
import 'package:instagramclone/components/home_page/timeline_appbar.dart';
import 'package:instagramclone/view/home/timeline_screen.dart';
import 'package:instagramclone/view_models/home_page_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: screen,
      backgroundColor: Colors.black,
      bottomNavigationBar: const myBottomNavBar(),
    );
  }

  PreferredSizeWidget? get appbar {
    switch (context.watch<HomePageViewModel>().page) {
      case 0:
        return const TimelineAppbar();

      default:
        return null;
    }
  }

  Widget get screen {
    switch (context.watch<HomePageViewModel>().page) {
      case 0:
        return const TimelineScreen();
      default:
        return Container();
    }
  }
}
