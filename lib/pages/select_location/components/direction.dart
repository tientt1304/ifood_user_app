import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ifood_user_app/constants.dart';

class Direction extends StatefulWidget {
  Direction({Key? key}) : super(key: key);

  @override
  _DirectionState createState() => _DirectionState();
}

class _DirectionState extends State<Direction> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(14.112966, 108.783658), zoom: 15);

  GoogleMapController? _googleMapController;
  Marker? _origin;
  Marker? _destination;
  Direction? _info;
  @override
  void dispose() {
    _googleMapController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              iconSize: 21,
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              'Set Location',
              style: TextStyle(
                  color: kTitleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'FSSemiBold'),
            ),
            centerTitle: true,
            actions: [
              if (_origin != null)
                TextButton(
                  onPressed: () => _googleMapController!.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: _origin!.position, zoom: 17, tilt: 50.0),
                    ),
                  ),
                  style: TextButton.styleFrom(primary: mainColor),
                  child: Text('ORIGIN',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              if (_destination != null)
                TextButton(
                  onPressed: () => _googleMapController!.animateCamera(
                      CameraUpdate.newCameraPosition(CameraPosition(
                          target: _destination!.position,
                          zoom: 17,
                          tilt: 50.0))),
                  style: TextButton.styleFrom(primary: mainColor),
                  child: Text('DEST',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                )
            ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: mainColor,
          foregroundColor: Colors.white,
          onPressed: () => _googleMapController!.animateCamera(
            // _info != null
            //     ? CameraUpdate.newLatLngBounds(_info!.bounds, 100.0)
            //     :
            CameraUpdate.newCameraPosition(_initialCameraPosition),
          ),
          child: const Icon(Icons.center_focus_strong),
        ),
        body: GoogleMap(
          initialCameraPosition: _initialCameraPosition,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          onMapCreated: (controller) => _googleMapController = controller,
          markers: {
            if (_origin != null) _origin!,
            if (_destination != null) _destination!
          },
          onLongPress: _addMarker,
        ));
  }

  void _addMarker(LatLng pos) {
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('orgin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueRed,
          ),
          position: pos,
        );
        _destination = null;
        _info = null;
      });
    } else {
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
          position: pos,
        );
      });
      //get direction
      // final directions = await DirectionRepository().getDirections(origin: _origin!.position, destination: pos);
      // setState(() {
      //   _info = directions;
      // });
    }
  }
}
