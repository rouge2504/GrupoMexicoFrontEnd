import 'dart:math';

class AppConstants {
  static const double DIST_BETWEEN_PIN = 1;
  static const double DIST_FOR_TOOLBOTH = 10;

  static double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;

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
