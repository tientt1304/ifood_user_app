import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ifood_user_app/.env.dart';
import 'package:ifood_user_app/models/direction_model.dart';

class DirectionRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;

  DirectionRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Direction?> getDirections({
    @required LatLng? origin,
    @required LatLng? destination,
  }) async {
    final response = await _dio.get(_baseUrl, queryParameters: {
      'origin': '${origin!.latitude}, ${origin.longitude}',
      'destination': '${destination!.latitude}, ${destination.longitude}',
      'key': googleAPIKey,
    });

    //check if response is successful
    if (response.statusCode == 200) {
      return Direction.fromMap(response.data);
    }
    return null;
  }
}
