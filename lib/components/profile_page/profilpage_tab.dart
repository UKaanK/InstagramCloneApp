import 'package:flutter/material.dart';
import 'package:instagramclone/components/profile_page/profile_page_highlights.dart';
import 'package:instagramclone/components/recorded_screen.dart';
import 'package:instagramclone/view/home_page/home_page.dart';
import 'package:instagramclone/view/home_page/home_page_profile.dart';
import '../../widgets/profileHeaderWidget.dart';
import '../timeline_post.dart';

class ProfilPageTab extends StatefulWidget {
  const ProfilPageTab({super.key});

  @override
  State<ProfilPageTab> createState() => _ProfilPageTabState();
}

class _ProfilPageTabState extends State<ProfilPageTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width:MediaQuery.of(context).size.width,
      height: 350,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.black,
          // headerSliverBuilder: (context, _) {
          //   return [
          //     SliverList(
          //         delegate: SliverChildListDelegate([
          //       profileHeaderWidget(context),
          //     ]))
          //   ];
          // },
          body: Column(
            children: const [
              Material(
                color: Colors.black,
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  indicatorWeight: 1,
                  indicatorColor: Colors.grey,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.grid_on_sharp,
                        color: Colors.white,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.person_pin_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: [HomePageProfile(),HomePageProfile()],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
