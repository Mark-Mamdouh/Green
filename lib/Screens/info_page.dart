import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Utilities/constants.dart';
import '../Utilities/details.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InfoPage extends StatelessWidget {
  Details details;
  List<String> plantDetails;

  String plantName;
  Color color;

  InfoPage(String plantName, Color color) {
    this.plantName = plantName;
    this.color = color;
    details = new Details();
    plantDetails = details.getDetails(plantName);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Icon(
                      FontAwesomeIcons.longArrowAltLeft,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  GestureDetector(
                    child: Icon(
                      FontAwesomeIcons.shoppingCart,
                    ),
                    onTap: () {
                      Fluttertoast.showToast(
                        msg: "Coming Soon...",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            )),
                        child: Image(
                          image: AssetImage("images/$plantName.png"),
                        ),
                        height: double.infinity,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Temperature",
                                style: kDataTitleTextStyle,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    plantDetails[0],
                                    style: kDataTextStyle,
                                  ),
                                  Text(
                                    "C",
                                    style: kDataUnitTextStyle,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Watering",
                                style: kDataTitleTextStyle,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    plantDetails[1],
                                    style: kDataTextStyle,
                                  ),
                                  Text(
                                    "/week",
                                    style: kDataUnitTextStyle,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Height",
                                style: kDataTitleTextStyle,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    plantDetails[2],
                                    style: kDataTextStyle,
                                  ),
                                  Text(
                                    "cm",
                                    style: kDataUnitTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${plantName[3].toUpperCase()}${plantName.substring(4)}',
                        style: kInfoTitleTextStyle,
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          plantDetails[3],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              plantDetails[4],
                              style: kDataTextStyle,
                            ),
                            GestureDetector(
                              onTap: () {
                                Fluttertoast.showToast(
                                  msg: "Coming Soon...",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                );
                              },
                              child: Container(
                                width: 180,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                ),
                                child: Center(
                                  child: Text(
                                    "Buy",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
