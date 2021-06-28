import 'dart:convert';

import 'package:balaboba/api_repository.dart';
import 'package:balaboba/utils/app_colors.dart';
import 'package:balaboba/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'models.dart';

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
            color: AppColors.mainColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 50.w,
                    child: Text(
                      AppStrings.disclaimer,
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
                        child: Text(AppStrings.agreed),
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
  String response = "test";
  var inputController = TextEditingController();

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
              controller: inputController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: AppColors.mainColor)),
                  fillColor: AppColors.mainColor,
                  border: OutlineInputBorder(),
                  hintText: AppStrings.inputHint),
            ),
          ),
          Container(
            child: MaterialButton(
              color: AppColors.mainColor,
              child: Text(AppStrings.makeBalabol),
              textColor: Colors.black,
              onPressed: () async {
                var response =
                    await ApiRepository().makeRequest(inputController.text);
                setState(() {
                  this.response =
                      BalabobaResponse.fromJson(jsonDecode(response.body)).text;
                });
                print(response.body.toString());
              },
            ),
          ),
          Container(
            child: Text(response),
          )
        ],
      ),
    ));
  }
}
