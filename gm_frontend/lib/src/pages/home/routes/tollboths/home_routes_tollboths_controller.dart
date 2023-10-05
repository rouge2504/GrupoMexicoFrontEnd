import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gm_frontend/src/assets/assets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;
import 'package:geocoding/geocoding.dart';

import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'dart:math';

class HomeRoutesTollbothsController extends GetxController {
  CameraPosition initialPosition =
      CameraPosition(target: LatLng(19.3691648, -99.1657984), zoom: 18);

  Completer<GoogleMapController> mapController = Completer();

  Position? position;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}.obs;

  BitmapDescriptor? myMarker;
  BitmapDescriptor? gasMarker;

  List<BitmapDescriptor> gasStations = [];
  StreamSubscription? positionSuscribe;

  List<LatLng> saveMarkers = <LatLng>[
    LatLng(19.4670, -99.1801),
    LatLng(19.4687, -99.1805),
    LatLng(19.4651, -99.1771),
  ].obs;

  HomeRoutesTollbothsController() {
    checkGPS();
    //checkPos();
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(
      String path, int width) async {
    final Uint8List imageData = await getBytesFromAsset(path, width);
    return BitmapDescriptor.fromBytes(imageData);
  }

  Future<BitmapDescriptor> createMarkerFromAssets(String path) async {
    ImageConfiguration configuration = ImageConfiguration();
    BitmapDescriptor descriptor =
        await BitmapDescriptor.fromAssetImage(configuration, path);

    return descriptor;
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  void addMarker(String markerId, double lat, double lon, String title,
      String content, BitmapDescriptor iconMarker) {
    MarkerId id = MarkerId(markerId);
    Marker marker = Marker(
        markerId: id,
        icon: iconMarker,
        position: LatLng(lat, lon),
        infoWindow: InfoWindow(title: title, snippet: content));
    markers[id] = marker;
  }

  Future setLocationDraggableInfo() async {
    double lat = initialPosition.target.latitude;
    double lon = initialPosition.target.longitude;

    List<Placemark> address = await placemarkFromCoordinates(lat, lon);
    print("Lat: ${lat} Lon ${lon}");
  }

  void checkGPS() async {
    myMarker = await createMarkerFromAssets(Assets.MY_PIN);
    gasMarker = await createMarkerFromAssets(Assets.GAS_STATION);

    for (int i = 0; i < 3; i++) {
      BitmapDescriptor temp = await createMarkerFromAssets(Assets.GAS_STATION);
      await Future.delayed(Duration(milliseconds: 1500));
      gasStations.add(temp);
    }

    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (isLocationEnabled) {
      updateLocation();
    } else {
      bool locationGPS = await location.Location().requestService();
      if (locationGPS) {
        updateLocation();
      }
    }
  }

  void updateLocation() async {
    try {
      await getUserCurrentLocation();
      position = await Geolocator.getLastKnownPosition();
      animateCameraPosition(
          position?.latitude ?? 19.3691648, position?.longitude ?? -99.1657984);

      addMarker('My Pin', position!.latitude ?? 19.3691648,
          position!.longitude ?? -99.1657984, 'Tu posicion', '', myMarker!);

      for (int i = 0; i < saveMarkers.length; i++) {
        addMarker('Gas Station ${i}', saveMarkers[i].latitude,
            saveMarkers[i].longitude, 'Gas posicion', '', gasStations[i]);

        print(calculateDistance(position!.latitude, position!.longitude,
            saveMarkers[i].latitude, saveMarkers[i].longitude));
      }

      LocationSettings locationSettings =
          LocationSettings(accuracy: LocationAccuracy.best, distanceFilter: 1);

      positionSuscribe =
          Geolocator.getPositionStream(locationSettings: locationSettings)
              .listen((Position pos) {
        position:
        pos;

        addMarker('My Pin', pos.latitude ?? 19.3691648,
            pos.longitude ?? -99.1657984, 'Tu posicion', '', myMarker!);

        animateCameraPosition(
            pos.latitude ?? 19.3691648, pos.longitude ?? -99.1657984);
      });
    } catch (e) {
      print('Error: ${e}');
    }
  }

  Future animateCameraPosition(double lat, double lon) async {
    GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lon), zoom: 18, bearing: 0)));
  }

  void onMapCreate(GoogleMapController controller) {
    controller.setMapStyle(
        '[ { "elementType": "geometry", "stylers": [ { "color": "#f5f5f5" } ] }, { "elementType": "labels.icon", "stylers": [ { "visibility": "off" } ] }, { "elementType": "labels.text.fill", "stylers": [ { "color": "#616161" } ] }, { "elementType": "labels.text.stroke", "stylers": [ { "color": "#f5f5f5" } ] }, { "featureType": "administrative.land_parcel", "elementType": "labels.text.fill", "stylers": [ { "color": "#bdbdbd" } ] }, { "featureType": "poi", "elementType": "geometry", "stylers": [ { "color": "#eeeeee" } ] }, { "featureType": "poi", "elementType": "labels.text", "stylers": [ { "visibility": "off" } ] }, { "featureType": "poi", "elementType": "labels.text.fill", "stylers": [ { "color": "#757575" } ] }, { "featureType": "poi.business", "stylers": [ { "visibility": "off" } ] }, { "featureType": "poi.park", "elementType": "geometry", "stylers": [ { "color": "#e5e5e5" } ] }, { "featureType": "poi.park", "elementType": "labels.text.fill", "stylers": [ { "color": "#9e9e9e" } ] }, { "featureType": "road", "elementType": "geometry", "stylers": [ { "color": "#ffffff" } ] }, { "featureType": "road", "elementType": "labels.icon", "stylers": [ { "visibility": "off" } ] }, { "featureType": "road.arterial", "elementType": "labels.text.fill", "stylers": [ { "color": "#757575" } ] }, { "featureType": "road.highway", "elementType": "geometry", "stylers": [ { "color": "#dadada" } ] }, { "featureType": "road.highway", "elementType": "labels.text.fill", "stylers": [ { "color": "#616161" } ] }, { "featureType": "road.local", "elementType": "labels.text.fill", "stylers": [ { "color": "#9e9e9e" } ] }, { "featureType": "transit", "stylers": [ { "visibility": "off" } ] }, { "featureType": "transit.line", "elementType": "geometry", "stylers": [ { "color": "#e5e5e5" } ] }, { "featureType": "transit.station", "elementType": "geometry", "stylers": [ { "color": "#eeeeee" } ] }, { "featureType": "water", "elementType": "geometry", "stylers": [ { "color": "#c9c9c9" } ] }, { "featureType": "water", "elementType": "labels.text.fill", "stylers": [ { "color": "#9e9e9e" } ] } ]');
    mapController.complete(controller);
  }

  void checkPos() async {
    Position pos = await getUserCurrentLocation();
    initialPosition =
        CameraPosition(target: LatLng(pos.latitude, pos.longitude), zoom: 14);
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  void onClose() {
    super.onClose();
    positionSuscribe?.cancel();
  }
}
