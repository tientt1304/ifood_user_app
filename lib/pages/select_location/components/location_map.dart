import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ifood_user_app/pages/update_location/components/button_location_card.dart';
import 'package:provider/provider.dart';
import 'location_provider.dart';

class LocationMap extends StatefulWidget {
  @override
  _LocationMapState createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  @override
  void initState() {
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).initialization();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: googleMapUI(),
    );
  }

  Widget googleMapUI() {
    return Consumer<LocationProvider>(builder: (consumerContext, model, child) {
      return Column(
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: model.locationPosition,
                zoom: 18,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: Set<Marker>.of(model.markers.values),
              onMapCreated: (GoogleMapController controller) async {
                Provider.of<LocationProvider>(context, listen: false)
                    .setMapController(controller);
              },
            ),
          ),
          ButtonLocationCard(
            location: 'Vinh Thanh, Binh Dinh',
            onPress: () async {
              Navigator.pop(context);
            },
          )
        ],
      );
    });
  }
}
