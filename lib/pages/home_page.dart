import 'package:audioplayers/audioplayers.dart';
import 'package:chat_app/model/radio.dart';
import 'package:chat_app/utilities/ai.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<myRadio> radios;
  late myRadio selectedRadio;
  late Color selectedColor;
  bool isPlaying = false;

  final AudioPlayer audioplayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    fetch();
    audioplayer.onPlayerStateChanged.listen((event) {
      if (event == AudioPlayerState.PLAYING) {
        isPlaying = true;
      } else {
        isPlaying = false;
        setState(() {});
      }
    });
  }

  fetch() async {
    final radioJson = await rootBundle.loadString("assets/radio.json");
    radios = MyRadiosList.fromJson(radioJson).radios;
    print(radios);
    setState(() {});
  }

  playmusic(String url) {
    audioplayer.play(url);
    selectedRadio = radios.firstWhere((element) => element.url == url);
    print(selectedRadio.name);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.antiAlias,
        children: [
          VxAnimatedBox()
              .size(context.screenWidth, context.screenHeight)
              .withGradient(LinearGradient(colors: [
                AIColors.clr1,
                AIColors.clr2,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight))
              .make(),
          AppBar(
            title: "Smart Radio".text.xl4.bold.white.make().shimmer(
                primaryColor: Color.fromARGB(255, 24, 160, 219),
                secondaryColor: Color.fromARGB(255, 255, 255, 255)),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
          ).h(100.0).p16(),
          VxSwiper.builder(
            //there might be error because of radios
            itemCount: radios.length,
            aspectRatio: 1.0,
            enlargeCenterPage: true,
            itemBuilder: (context, index) {
              final rad = radios[index];
              return VxBox(
                      child: ZStack(
                [
                  Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: VxBox(
                              child: rad.category.text.uppercase.white
                                  .make()
                                  .p16())
                          .height(40)
                          .black
                          .alignCenter
                          .withRounded(value: 10.0)
                          .make()),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: VStack(
                      [
                        rad.name.text.xl3.white.bold.make(),
                        5.heightBox,
                        rad.tagline.text.sm.white.semiBold.make(),
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: [
                        const Icon(
                          CupertinoIcons.play_circle,
                          color: Colors.white,
                        ),
                        10.heightBox,
                        "Double tap to play".text.gray300.make()
                      ].vStack())
                ],
              ))
                  .clip(Clip.antiAlias)
                  .bgImage(
                    DecorationImage(
                        image: NetworkImage(rad.image),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.darken)),
                  )
                  .border(color: Colors.black, width: 5.0)
                  .withRounded(value: 60.0)
                  .make()
                  .onInkDoubleTap(() {
                playmusic(rad.url);
              }).p16();
            },
          ).centered(),
          Align(
            alignment: Alignment.bottomCenter,
            child: [
              if (isPlaying)
                "Playing now - ${selectedRadio.name} FM".text.makeCentered(),
              Icon(
                      isPlaying
                          ? CupertinoIcons.stop_circle
                          : CupertinoIcons.play_circle,
                      color: Colors.white,
                      size: 50.0)
                  .onInkTap(() {
                if (isPlaying) {
                  audioplayer.stop();
                } else {
                  playmusic(selectedRadio.url);
                }
              })
            ].vStack(),
          ).pOnly(bottom: context.percentHeight * 12)
        ],
      ),
    );
  }
}
