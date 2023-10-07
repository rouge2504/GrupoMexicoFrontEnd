import 'dart:math';

class AppConstants {
  static const double DIST_BETWEEN_PIN = 1;

  static double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;

    double dist = 12742 * asin(sqrt(a));
    //dist /= 10000;
    return dist;
  }

  static double coordToDouble(String coord) {
    String originalCoord = coord;
    double tempCoord_D =
        double.parse(coord.contains('-') ? coord.replaceAll('-', '') : coord);
    tempCoord_D *= originalCoord.contains('-') ? -1 : 1;
    return tempCoord_D;
  }
}
