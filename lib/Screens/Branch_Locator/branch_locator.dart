import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../constants.dart';

class BranchLocator extends StatefulWidget {
  const BranchLocator({Key? key}) : super(key: key);

  @override
  State<BranchLocator> createState() => _BranchLocatorState();
}

class _BranchLocatorState extends State<BranchLocator> {
  late GoogleMapController mapController;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  final LatLng _center = const LatLng(24.860966, 66.990501);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    addCustomIcon();
    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(
              size: Size(32, 32),
            ),
            "assets/icons/Location_marker.png")
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Bank Branchies Near You'),
        elevation: 2,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("marker1"),
            position: const LatLng(24.860966, 66.990501),
            draggable: true,
            onDragEnd: (value) {
              // value is the new position
            },
            icon: markerIcon,
          ),
          Marker(
            markerId: const MarkerId("marker2"),
            position: const LatLng(24.876543, 66.977890),
            icon: markerIcon,
          ),
          Marker(
            markerId: const MarkerId("marker3"),
            position: const LatLng(24.870123, 66.998765),
            icon: markerIcon,
          ),
          Marker(
            markerId: const MarkerId("marker4"),
            position: const LatLng(24.855432, 66.988012),
            icon: markerIcon,
          ),
          Marker(
            markerId: const MarkerId("marker5"),
            position: const LatLng(24.863210, 67.001234),
            icon: markerIcon,
          ),
          Marker(
            markerId: const MarkerId("marker6"),
            position: const LatLng(24.872345, 66.987654),
            icon: markerIcon,
          ),
          Marker(
            markerId: const MarkerId("marker7"),
            position: const LatLng(24.867890, 66.980123),
            icon: markerIcon,
          ),
          Marker(
            markerId: const MarkerId("marker8"),
            position: const LatLng(24.879012, 66.993210),
            icon: markerIcon,
          ),
          Marker(
            markerId: const MarkerId("marker9"),
            position: const LatLng(24.855432, 66.988012),
            icon: markerIcon,
          ),
          Marker(
            markerId: const MarkerId("marker10"),
            position: const LatLng(24.858765, 67.000123),
            icon: markerIcon,
          ),
          Marker(
            markerId: const MarkerId("marker11"),
            position: const LatLng(24.868901, 66.995678),
            icon: markerIcon,
          ),
        },
      ),
    );
  }
}
