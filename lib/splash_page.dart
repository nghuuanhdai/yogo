import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/splash.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Image(
                        image: AssetImage("assets/images/logo.png"),
                        width: 55,
                        height: 55,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(fontSize: 35, color: Colors.white),
                          children: [
                        TextSpan(
                            text: 'YO',
                            style: TextStyle(fontWeight: FontWeight.w300)),
                        TextSpan(
                            text: 'GO',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ])),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
