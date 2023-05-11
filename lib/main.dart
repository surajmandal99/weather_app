import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/consts/colors.dart';
import 'package:weather_app/consts/images.dart';
import 'package:weather_app/controller/main_controller.dart';

import 'consts/strings.dart';
import 'custom_themes/custom_themes.dart';

//date tiime format

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomThemes.lightTheme,
      darkTheme: CustomThemes.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var controller = Get.put(MainController());
    var date = DateFormat.yMMMd().format(DateTime.now());
    return Scaffold(
        appBar: AppBar(
            title: date.text.color(theme.primaryColor).make(),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Obx(
                () => IconButton(
                    onPressed: () {
                      controller.changeTheme();
                    },
                    icon: Icon(
                      controller.isDark.value
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      color: theme.iconTheme.color,
                    )),
              ),
              IconButton(
                onPressed: (() {}),
                icon: const Icon(Icons.more_vert),
                color: Get.theme.iconTheme.color,
              )
            ]),
        body: Container(
            padding: const EdgeInsets.all(12),
            child: Container(
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "BIRATNAGAR"
                              .text
                              .uppercase
                              .fontFamily("poppins_bold")
                              .size(30)
                              .letterSpacing(3)
                              .color(theme.primaryColor)
                              .make(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/weather/01d.png",
                                    width: 80,
                                    height: 80,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "38$degree",
                                        style: TextStyle(
                                            fontSize: 70,
                                            color: theme.primaryColor,
                                            fontFamily: "poppins")),
                                    TextSpan(
                                        text: "Sunny",
                                        style: TextStyle(
                                            color: theme.primaryColor,
                                            letterSpacing: 2,
                                            fontFamily: "poppins_light",
                                            fontSize: 14))
                                  ]))
                                ]),
                          ),

                          //row for highr and lower tempr

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton.icon(
                                onPressed: null,
                                icon: Icon(
                                  Icons.expand_less_rounded,
                                  color: theme.iconTheme.color,
                                ),
                                label: "46$degree"
                                    .text
                                    .color(theme.iconTheme.color)
                                    .make(),
                              ),
                              TextButton.icon(
                                onPressed: null,
                                icon: Icon(
                                  Icons.expand_more_rounded,
                                  color: theme.iconTheme.color,
                                ),
                                label: "24$degree"
                                    .text
                                    .color(theme.iconTheme.color)
                                    .make(),
                              )
                            ],
                          ),
                          10.heightBox,

                          //Row for tempr  humidity and windspeed

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(3, (index) {
                              var iconsList = [clouds, humidity, windspeed];
                              var values = ["72%", "41%", "3.6 km/h"];
                              return Column(
                                children: [
                                  Image.asset(
                                    iconsList[index],
                                    width: 60,
                                    height: 60,
                                  )
                                      .box
                                      .gray300
                                      .padding(const EdgeInsets.all(9))
                                      .roundedSM
                                      .make(),
                                  10.heightBox,
                                  values[index]
                                      .text
                                      .color(theme.primaryColor)
                                      .make()
                                ],
                              );
                            }),
                          ),
                          10.heightBox,
                          const Divider(),
                          10.heightBox,

                          SizedBox(
                              height: 150,
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: 6,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      padding: const EdgeInsets.all(8),
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: BoxDecoration(
                                        color: cardColor,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(children: [
                                        "${index + 1} AM".text.gray100.make(),
                                        Image.asset("assets/weather/09n.png"),
                                        "39$degree".text.gray100.make(),
                                      ]),
                                    );
                                  })),
                          10.heightBox,
                          const Divider(),
                          10.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              "Next 7 days"
                                  .text
                                  .semiBold
                                  .color(theme.primaryColor)
                                  .size(16)
                                  .make(),
                              TextButton(
                                  onPressed: () {},
                                  child: "View All".text.make())
                            ],
                          ),

                          ListView.builder(
                              itemCount: 7,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                var day = DateFormat("EEEE").format(
                                    DateTime.now()
                                        .add(Duration(days: index + 1)));
                                return Card(
                                  color: theme.cardColor,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 12),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          day.text.semiBold
                                              .color(theme.primaryColor)
                                              .make(),
                                          TextButton.icon(
                                            onPressed: null,
                                            icon: Image.asset(
                                              'assets/weather/09d.png',
                                              width: 40,
                                            ),
                                            label: "28$degree"
                                                .text
                                                .color(theme.primaryColor)
                                                .make(),
                                          ),
                                          RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                                text: "37$degree /",
                                                style: TextStyle(
                                                    color: theme.primaryColor,
                                                    fontFamily: "poppins",
                                                    fontSize: 16)),
                                            TextSpan(
                                                text: "  28$degree ",
                                                style: TextStyle(
                                                    color: theme.primaryColor,
                                                    fontFamily: "poppins",
                                                    fontSize: 16))
                                          ]))
                                        ]),
                                  ),
                                );
                              })
                        ])))));
  }
}
