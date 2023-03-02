import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../constants/text_strings.dart';
import 'components/maps_controller.dart';

final appKey = GlobalKey();

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapsController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          tLocal,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: controller.position,
          zoom: 18,
        ),
        myLocationEnabled: true,
        onMapCreated: controller.onMapCreated,
      ),
    );
  }
}
