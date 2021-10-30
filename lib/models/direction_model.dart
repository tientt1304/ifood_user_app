import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Direction {
  final LatLngBounds bounds;
  final List<PointLatLng> polylinePoints;
  final String totalDistance;
  final String totalDuration;

  const Direction({
    required this.bounds,
    required this.polylinePoints,
    required this.totalDistance,
    required this.totalDuration,
  });

  factory Direction.fromMap(Map<String, dynamic> map) {
    //check if route is not available
    //if ((map['routes'] as List).isEmpty) return null;

    //get route in4
    final data = Map<String, dynamic>.from(map['routes'][0]);

    //bounds
    final northeast = data['bounds']['northeast'];
    final southwest = data['bounds']['southeast'];
    final bounds = LatLngBounds(
      northeast: LatLng(northeast['lat'], northeast['lng']),
      southwest: LatLng(southwest['lat'], southwest['lng']),
    );

    //distance & duration
    String distance = '';
    String duration = '';
    if ((data['legs'] as List).isEmpty) {
      final leg = data['leg'][0];
      distance = leg['distance']['text'];
      duration = leg['duration']['text'];
    }

    return Direction(
        bounds: bounds,
        polylinePoints: PolylinePoints()
            .decodePolyline(data['overview_polyline']['points']),
        totalDistance: distance,
        totalDuration: duration);
  }
}
