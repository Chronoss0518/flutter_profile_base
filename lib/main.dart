
import 'package:flutter/material.dart';
import 'package:ch_flutter_library/widget/components/image_drawer.dart';
import 'package:ch_flutter_library/widget/components/image_some_drawer.dart';
import 'package:ch_flutter_library/widget/scene_manager.dart';
import 'Component/profile_panel.dart';
import 'Component/text_block.dart';
import 'Component/use_table.dart';

const String NAME = "Chronoss";
const String CAREER = "IT Engineer";
const String CREATER_TYPE = "Game Creater";

const String TWITTER_USER_URL = "@__ChWorld__";
const String BLUESKY_USER_URL = "@chworld.bsky.social";
const String FREEGAME_MUGEN_USER_URL = "https://freegame-mugen.jp/cms/mt-cp.cgi?__mode=view&blog_id=1&id=9366";
const String FREEM_USER_URL = "https://www.freem.ne.jp/brand/14403";

const double URL_FONT_SIZE = 30.0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SceneManager(StartScene()),
    );
  }
}

class StartScene extends BaseScene {
  ImageSomeDrawerController controller = ImageSomeDrawerController();
  
  @override
  void init({SaveData? sendData}) {
    setAppBar(AppBar(
      backgroundColor: Theme.of(context!).colorScheme.inversePrimary,
      title: const Center(child: Text("Profile")),
    ));
    
    repaint(() {});
    
  }

  int testNumber = 0;

  @override
  void update() {
    if(testNumber == 0)
    {
      //controller.drawLeft = (controller.drawLeft - 100) % controller.baseHeight;
      //controller.drawTop = (controller.drawTop - 100) % controller.baseHeight;
    }
    controller.update();
    repaint(() {
      tmpUpdate();
    });
  }

  @override
  void release() {}

  void tmpUpdate() {
    testNumber++;
    testNumber %= 100;
  }

  @override
  Widget build(BuildContext context) {
    
    controller.drawLeft = 170 % controller.baseHeight;
    controller.drawTop = 0 % controller.baseHeight;

    var size = MediaQuery.of(context).size;
    double width = size.width / 4; 
    double height = size.height / 10; 
    return Container(
      color: Colors.black,
      padding: EdgeInsets.fromLTRB(width, height, width, height),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.black,
              child: Row(
                children: [
                  const TextBlock("Profile",textColor: Colors.white,fontSize: 80.0),
                  ImageSomeDrawer("resource/image/test_image.png",
                    controller,
                    width: 150,
                    height:150,
                    imageWidth: 500,
                    imageHeight:500,),
                ],
              ),
            ),
            Container(
              color: Colors.black,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: const ProfilePanelList(
                      [
                        ProfilePanel("Name", NAME,textColor: Colors.white),
                        ProfilePanel("Career", CAREER,textColor: Colors.blue),
                        ProfilePanel("Creater Type", CREATER_TYPE,textColor: Colors.yellow),
                      ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextBlock("Use Program Lungage",textColor: Colors.white,fontSize: 40.0),
                        UseTable([
                          UseTablePanel("C",textColor: Colors.yellow),
                          UseTablePanel("C++",textColor: Colors.yellow),
                          UseTablePanel("Unity C#",textColor: Colors.green),
                          UseTablePanel("Java",textColor: Colors.red),
                          UseTablePanel("Java Script",textColor: Colors.yellow),
                          UseTablePanel("Flutter Dart",textColor: Colors.blue),
                          UseTablePanel("Python",textColor: Colors.red),
                          UseTablePanel("HLSL",textColor: Colors.blue),
                          UseTablePanel("Shader Lab",textColor: Colors.blue),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black,
              child: const ProfilePanelList(
                [
                  ProfilePanel("twitter(x)", TWITTER_USER_URL,textColor: Colors.white),
                  ProfilePanel("bluesky", BLUESKY_USER_URL,textColor: Colors.blue),
                  ProfilePanel("freem", FREEM_USER_URL,textColor: Colors.yellow),
                  ProfilePanel("freegame-mugen", FREEGAME_MUGEN_USER_URL,textColor: Colors.yellow),
                ],
                fontSize: URL_FONT_SIZE,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
