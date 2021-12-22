// ignore_for_file: file_names, sized_box_for_whitespace, prefer_const_constructors, duplicate_ignore, unnecessary_new

part of 'pages.dart';

class SplashScreenMenu extends StatefulWidget {
  const SplashScreenMenu({Key key}) : super(key: key);

  @override
  _SplashScreenMenuState createState() => new _SplashScreenMenuState();
}

class _SplashScreenMenuState extends State<SplashScreenMenu> {
  starttime() async {
    // ignore: prefer_const_constructors, unnecessary_new
    var _duration = new Duration(seconds: 6);
    // ignore: unnecessary_new
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/mainMenu');
  }

  @override
  void initState() {
    // // ignore: deprecated_member_use
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.initState();
    starttime();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: LottieBuilder.asset("assets/splashScreen.json"),
        ),
      ),
    );
  }
}
