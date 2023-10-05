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
          body: Stack(children: [
            GoogleMap(
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
            //iconLocator(),
          ]),
        ));
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
