import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gm_frontend/src/assets/assets.dart';
import 'package:gm_frontend/src/pages/home/routes/tollboths/home_routes_tollboths_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeRoutesTollboths extends StatelessWidget {
  HomeRoutesTollbothsController con = Get.put(HomeRoutesTollbothsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            leading: Container(
                child: IconButton(
              icon: ImageIcon(
                AssetImage(Assets.BACK_ARROW),
                color: Theme.of(context).colorScheme.surface,
              ),
              onPressed: () {
                Navigator.pop(context);
                // con.pageController.jumpToPage(0);
              },
            )),
            actions: [
              Container(
                  child: IconButton(
                icon: ImageIcon(
                  AssetImage(Assets.CLOSE_OUTLINE),
                  color: Theme.of(context).colorScheme.surface,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
            ],
            backgroundColor: Colors.white,
            title: Text(
              'Casetas de cobro',
              style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontFamily: 'Raleway',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Column(mainAxisSize: MainAxisSize.max, children: [
            SizedBox(
              width: MediaQuery.of(context)
                  .size
                  .width, // or use fixed size like 200
              height: MediaQuery.of(context).size.height * 0.33,
              child: Container(
                height: 1000,
                child: GoogleMap(
                  initialCameraPosition: con.initialPosition,
                  mapType: MapType.normal,
                  onMapCreated: con.onMapCreate,
                  myLocationButtonEnabled: false,
                  myLocationEnabled: false,
                  markers: Set<Marker>.of(con.markers.values),
                  /*onCameraMove: (position) {
                    con.initialPosition = position;
                  },
                  onCameraIdle: () async {
                    await con.setLocationDraggableInfo();
                  },*/
                ),
              ),
            ),
            Expanded(
              child: ListView(shrinkWrap: true, children: [
                CardItem(context),
                CardItem(context),
                CardItem(context),
                CardItem(context),
                CardItem(context),
                CardItem(context),
                CardItem(context),
                CardItem(context),
                CardItem(context),
                CardItem(context),
              ]),
            ),
          ]),
        ));
  }

  Widget CardItem(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        onPressed: () {},
        child: Container(
            width: double.infinity,
            height: 100,
            child: Card(
                elevation: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ImageIcon(
                        AssetImage(Assets.TOOLTOOTH_ICON),
                        size: 30,
                        color: Color.fromRGBO(115, 119, 121, 1),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '{Nombre de caseta}',
                            style: TextStyle(
                              color: const Color.fromRGBO(84, 88, 89, 1),
                              fontFamily: 'Raleway',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '{Dirección de caseta}',
                            style: TextStyle(
                              color: const Color.fromRGBO(84, 88, 89, 1),
                              fontFamily: 'Raleway',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'MXN \$ {X.XX} - MXN \$ {X.XX}',
                            style: TextStyle(
                              color: const Color.fromRGBO(84, 88, 89, 1),
                              fontFamily: 'Raleway',
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '{XXX}',
                            style: TextStyle(
                              color: const Color.fromRGBO(84, 88, 89, 1),
                              fontFamily: 'Raleway',
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '{km}',
                            style: TextStyle(
                              color: const Color.fromRGBO(84, 88, 89, 1),
                              fontFamily: 'Raleway',
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))),
      ),
    );
  }

  Widget iconLocator() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Center(
        child: Image.asset(Assets.MY_PIN, width: 65, height: 65),
      ),
    );
  }
}
