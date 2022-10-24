import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DasbordScreen extends StatelessWidget {
   DasbordScreen({Key? key}) : super(key: key);
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  final Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 220,
                  color: const Color(0xFF2A2E43),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Select an option:",
                          style: TextStyle(color: Colors.white,fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 100,
                              width: 105,
                              color: Colors.white30,
                              child: Column(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.car_rental,
                                        color: Colors.white,
                                      )),
                                  const Text(
                                    "15 min",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),

                            Container(
                              height: 100,
                              width: 105,
                              color: Colors.white30,
                              child: Column(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.directions_walk,
                                        color: Colors.white,
                                      )),
                                  const Text(
                                    "16 - 25 min",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              height: 100,
                              width: 105,
                              color: Colors.white30,
                              child: Column(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.bus_alert,
                                        color: Colors.white,
                                      )),
                                  const Text(
                                    "25-30 min",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ]),
    );
  }
}
