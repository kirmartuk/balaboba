import 'package:balaboba/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:balaboba/utils/Utils.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: IntroPage(),
      );
    });
  }
}

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: Card(
            color: AllColors.mainColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 50.w,
                    child: Text(
                      "Нейросеть не знает, что говорит, и может сказать всякое — если что, не обижайтесь. Распространяя получившиеся тексты, помните об ответственности.",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(2.w),
                      alignment: Alignment.center,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchPage()));
                        },
                        color: Colors.black,
                        child: Text("Договорились"),
                        textColor: Colors.white,
                      ))
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Container(height: 15.h, child: Image.asset('assets/balaboba.png')),
          Container(
            height: 15.h,
            width: 75.w,
            child: TextFormField(
              maxLines: null,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: AllColors.mainColor)),
                  fillColor: AllColors.mainColor,
                  border: OutlineInputBorder(),
                  hintText:
                      "Напишите что-нибудь и получите продолжение от Балабобы"),
            ),
          ),
        ],
      ),
    ));
  }
}
