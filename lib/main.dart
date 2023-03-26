import 'package:flutter/material.dart';
import 'package:instagramclone/app_init.dart';
import 'package:instagramclone/view/discovery_page/discovery_page.dart';
import 'package:instagramclone/view/home_page/home_page.dart';
import 'package:instagramclone/view/profile_page/profile_page.dart';
import 'package:instagramclone/view/reels_page/reels_page.dart';
import 'package:instagramclone/view_models/navigator_view_model.dart';
import 'package:instagramclone/view_models/reels_page_view_model.dart';
import 'package:instagramclone/view_models/search_bar_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SearchBarViewModel()),
    ChangeNotifierProvider(create: (_) => ReelsPageViewModel()),
    ChangeNotifierProvider(create: (_) => NavigatorViewModel())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: AppInit(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //NavigatorViewModel get vm => Provider.of<NavigatorViewModel>(context);

  List<Widget> pages = [
    HomePage(),
    DiscoveryPage(),
    Container(),
    ReelsPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      //body: pages[vm.getCurrentIndex],
      body: pages[context.watch<NavigatorViewModel>().getCurrentIndex],
      //bottomNavigationBar: myBottomNavBar(),
    );
  }
}
