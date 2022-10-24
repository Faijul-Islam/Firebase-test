import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late GoogleMapController controller;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.807098698704227, 90.3686700499929),
    zoom: 14,
  );

  Set<Marker> markas = {};
  var currentPost;
  var currentAddres;
  var currentLat = 23.807098698704227;
  var currentLong = 90.3686700499929;

  getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position pos) async {
      setState(() {
        currentPost = pos;
        currentLat = pos.latitude;
        currentLong = pos.longitude;
        getAddress(currentPost);
      });
    });
  }

  getAddress(currentPost) async {
    List<Placemark> p = await placemarkFromCoordinates(
        currentPost.latitude, currentPost.longitude);
    Placemark placemark = p[0];
    currentAddres =
        '${placemark.name}${placemark.locality}${placemark.postalCode}'
        '${placemark.country}';
  }

  @override
  void initState() {
    // getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            markers: markas,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              controller = controller;
            },
          ),
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                color: Colors.white,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: '',
                      prefixIcon: const Icon(Icons.location_on),
                      suffixIcon: const Icon(Icons.keyboard_voice_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              IconButton(
                  onPressed: () {
                    _kGooglePlex;
                  },
                  icon: const Icon(Icons.location_searching)),
              FloatingActionButton(
                onPressed: () async {
                  Position position = await _currentposition();
                  controller.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: LatLng(position.latitude, position.longitude),
                          zoom: 14)));
                  markas.clear();
                  markas.add(Marker(
                      markerId: const MarkerId("CurentLocation"),
                      position: LatLng(position.latitude, position.longitude)));
                  setState(() {

                  });
                },
                child: const Icon(Icons.location_searching),
              ),
              Text('$currentAddres')
            ],
          )
        ],
      ),
    );
  }

  Future<Position> _currentposition() async {
    bool serviseEnabeld;
    LocationPermission permission;
    serviseEnabeld = await Geolocator.isLocationServiceEnabled();
    if (!serviseEnabeld) {
      return Future.error('bgmkjfgdkmtygrdgcdsfyjhgbxdcvfzgmuktrvaasZ');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permission permanently denied');
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
