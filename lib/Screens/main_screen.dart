import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import '../Components/modified_icon.dart';
import '../Components/plant_card.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum place {
  indoor,
  outdoor,
  garden,
  office,
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  // initial plants List
  List<Widget> plants = [
    PlantCard("IN_anthurium"),
    PlantCard("IN_begonia"),
    PlantCard("IN_cactus"),
    PlantCard("IN_calathea"),
    PlantCard("IN_fiddle"),
    PlantCard("IN_kentia"),
    PlantCard("IN_peace_lily"),
    PlantCard("IN_pilea"),
    PlantCard("IN_sweet_heart")
  ];
  place selectedPlace = place.indoor;

  // change List according to clicked place
  void changeList(place p) {
    setState(() {
      if (p == place.indoor) {
        plants = [
          PlantCard("IN_anthurium"),
          PlantCard("IN_begonia"),
          PlantCard("IN_cactus"),
          PlantCard("IN_fiddle"),
          PlantCard("IN_kentia"),
          PlantCard("IN_peace_lily"),
          PlantCard("IN_pilea"),
          PlantCard("IN_sweet_heart")
        ];
        selectedPlace = place.indoor;
      } else if (p == place.outdoor) {
        plants = [
          PlantCard("OU_caladium"),
          PlantCard("OU_catmint"),
          PlantCard("OU_citrus"),
          PlantCard("OU_coleus"),
          PlantCard("OU_daffodils"),
          PlantCard("OU_false_indigo"),
          PlantCard("OU_fuchsia"),
          PlantCard("OU_geraniums")
        ];
        selectedPlace = place.outdoor;
      } else if (p == place.garden) {
        plants = [
          PlantCard("GA_evergreen"),
          PlantCard("GA_herb"),
          PlantCard("GA_hydrangea"),
          PlantCard("GA_rose"),
          PlantCard("GA_shrub")
        ];
        selectedPlace = place.garden;
      } else {
        plants = [
          PlantCard("OF_african_violet"),
          PlantCard("OF_aloe"),
          PlantCard("OF_english_ivy"),
          PlantCard("OF_oxalis"),
          PlantCard("OF_snake")
        ];
        selectedPlace = place.office;
      }
    });
  }

  // to show exit message on back button pressed
  // copied from stackoverflow
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  void initState() {
    // hide notification bar
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop, // to show exit message on back button pressed
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Green",
                      style: kTitleTextStyle,
                    ),
                    // purchase button
                    GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: "Coming Soon...",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                        );
                      },
                      child: Icon(
                        FontAwesomeIcons.shoppingCart,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 35),
              child: Text(
                "all space around you",
                style: kSubTitleTextStyle,
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    // side panel
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ModifiedIcon(
                              Icon(
                                FontAwesomeIcons.seedling,
                                color: Colors.black,
                                size: 20,
                              ),
                              Text(
                                "Indoor",
                              ),
                              () {
                                changeList(place.indoor);
                              },
                              selectedPlace == place.indoor
                                  ? kActiveIcon
                                  : kInActiveIcon,
                            ),
                            ModifiedIcon(
                              Icon(
                                FontAwesomeIcons.leaf,
                                color: Colors.black,
                                size: 20,
                              ),
                              Text(
                                "Outdoor",
                              ),
                              () {
                                changeList(place.outdoor);
                              },
                              selectedPlace == place.outdoor
                                  ? kActiveIcon
                                  : kInActiveIcon,
                            ),
                            ModifiedIcon(
                              Icon(
                                FontAwesomeIcons.tree,
                                color: Colors.black,
                                size: 20,
                              ),
                              Text(
                                "Garden",
                              ),
                              () {
                                changeList(place.garden);
                              },
                              selectedPlace == place.garden
                                  ? kActiveIcon
                                  : kInActiveIcon,
                            ),
                            ModifiedIcon(
                              Icon(
                                FontAwesomeIcons.home,
                                color: Colors.black,
                                size: 20,
                              ),
                              Text(
                                "Office",
                              ),
                              () {
                                changeList(place.office);
                              },
                              selectedPlace == place.office
                                  ? kActiveIcon
                                  : kInActiveIcon,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // main List of plants
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: ListView(
                          children: plants,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
