import 'package:balaboba/api/api_repository.dart';
import 'package:balaboba/utils/app_colors.dart';
import 'package:balaboba/utils/app_strings.dart';
import 'package:balaboba/utils/utils.dart';
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
                    width: 75.w,
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
  String response = "";
  var inputController = TextEditingController();
  bool loading = false;
  List<Intro> intros = [];

  @override
  void initState() {
    super.initState();
    loadIntros();
  }

  void loadIntros() async {
    var receivedIntros = await ApiRepository().getIntros();
    setState(() {
      intros = receivedIntros.intros;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                height: 60,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        AppStrings.balabobaStyle + ":",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: intros.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  intros[index].isSelected =
                                      !intros[index].isSelected;
                                });
                                print('fuck');
                              },
                              child: Card(
                                  color: intros[index].isSelected
                                      ? Colors.black
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${intros[index].name}',
                                        style: TextStyle(
                                            color: intros[index].isSelected
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ),
                                  )),
                            );
                          }),
                    ],
                  ),
                ),
              ),
              Container(
                  height: 15.h, child: Image.asset('assets/balaboba.png')),
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
                  padding: const EdgeInsets.all(20.0),
                  color: AppColors.mainColor,
                  child: Text(AppStrings.makeBalabol),
                  textColor: Colors.black,
                  onPressed: () async {
                    setState(() {
                      this.loading = true;
                    });

                    var response = await ApiRepository()
                        .getTextGeneratedBalaboba(1, 0, inputController.text);

                    print(intros);

                    setState(() {
                      this.response = response.text;
                      this.loading = false;
                    });
                  },
                ),
              ),
              loading
                  ? Container(child: CircularProgressIndicator())
                  : Container(),
              Container(
                width: 75.w,
                margin: EdgeInsets.all(5.w),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Utils.hexToColor("#e2e2e2"))),
                child: Text(response),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
