import 'package:flutter/material.dart';
import 'package:instagramclone/components/bottomNavBarPage.dart';
import 'package:instagramclone/components/profile_page/profile_appbar.dart';

import 'package:instagramclone/components/profile_page/profile_page_highlights.dart';
import 'package:instagramclone/components/profile_page/profilpage_tab.dart';
import 'package:instagramclone/components/profiluser_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      appBar: ProfileAppBar(),
      body: ProfilUserWidget(),
      bottomNavigationBar: myBottomNavBar(),
    );
  }
}
