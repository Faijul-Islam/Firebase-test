import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapLocation extends StatefulWidget {

   const GoogleMapLocation({
    Key? key,
  }) : super(key: key);

  @override
  State<GoogleMapLocation> createState() => _GoogleMapLocationState();
}

class _GoogleMapLocationState extends State<GoogleMapLocation> {
  final Completer<GoogleMapController> _controller = Completer();

  late CameraPosition initialPosition;

  late Polyline polyLine;

  //============= declaring the delivery man position as============
  //============= initial position =================================
  //----------------------------------------------------------------23.807216489637963, 90.36845547326058
  @override
  void initState() {
    initialPosition = const CameraPosition(
      target: LatLng(23.807098698704227, 90.3686700499929),
      zoom: 18.4746,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //========= added a marker with delivery man ============
      //========= current position ============================
      //-------------------------------------------------------

      body: GoogleMap(
        mapType: MapType.normal,
        markers: {
          const Marker(
            markerId: MarkerId('delivery_man'),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: 'Delivery Man'),
            position: LatLng(
                23.807098698704227, 90.3686700499929
            ),
          ),
        },
        initialCameraPosition: initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}