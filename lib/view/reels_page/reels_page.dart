import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:instagramclone/components/bottomNavBarPage.dart';
import 'package:instagramclone/components/reels_page/reels_page_appbar.dart';
import 'package:instagramclone/view_models/reels_page_view_model.dart';
import 'package:provider/provider.dart';

//chewie

class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: ReelsAppBar(),
      backgroundColor: Colors.black,
      bottomNavigationBar: myBottomNavBar(),
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          controller: controller,
          children: [
            ReelsContens(
              likeCount: "1324",
              reelsComment: "Hello world",
            ),
            ReelsContens(
              likeCount: "33.k",
              reelsComment: "Gym reels",
            ),
            ReelsContens(
              likeCount: "128",
              reelsComment: "Football is my passion!",
            ),
            ReelsContens(
              likeCount: "3511",
              reelsComment: "Nice song!",
            )
          ],
        ),
      ),
    );
  }
}

class ReelsContens extends StatefulWidget {
  String likeCount;
  String reelsComment;
  ReelsContens(
      {super.key, required this.likeCount, required this.reelsComment});

  @override
  State<ReelsContens> createState() => _ReelsContensState();
}

class _ReelsContensState extends State<ReelsContens> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.fill,image: NetworkImage('https://picsum.photos/500/500?random=${faker.randomGenerator.integer(10)}'))),
      ),
      Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            width: 50,
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<ReelsPageViewModel>().setIsLiked();
                  },
                  icon: context.watch<ReelsPageViewModel>().getIsLiked
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 32,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 32,
                        ),
                ),
                Text(
                  widget.likeCount.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  CupertinoIcons.chat_bubble,
                  color: Colors.white,
                  size: 30,
                ),
                Text(
                  widget.likeCount.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  CupertinoIcons.paperplane,
                  color: Colors.white,
                  size: 30,
                ),
                Icon(
                  Icons.more_horiz_outlined,
                  color: Colors.white,
                  size: 30,
                )
              ],
            ),
          )),
      Positioned(
          bottom: 10,
          left: 10,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
      Container(
        width: 50,
        height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(fit: BoxFit.fill,image: NetworkImage('https://picsum.photos/500/500?random=${faker.randomGenerator.integer(10)}'))),
      ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      faker.internet.userName(),
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.reelsComment,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          )),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Reels",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                ))
          ],
        ),
      )
    ]);
  }
}
