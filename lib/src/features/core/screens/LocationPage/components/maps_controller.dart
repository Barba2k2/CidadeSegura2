import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../constants/colors_constants.dart';

class MapsController extends ChangeNotifier {
  final latitude = 0.0.obs;
  final longitude = 0.0.obs;
  String erro = '';
  late StreamSubscription<Position> positionStream;
  final LatLng _position =
      const LatLng(-22.375766068655487, -47.37005026555724);
  late GoogleMapController _mapsController;
  // Completer<GoogleMapController> _controller = Completer();
  // final CameraPosition _cameraPosition = const CameraPosition(
  //     target: LatLng(-22.375766068655487, -47.37005026555724),
  //     zoom: 16,
  //     tilt: 45);

  static MapsController get to => Get.find<MapsController>();
  get mapsController => _mapsController;
  get position => _position;

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    getPosition();
    var style = await rootBundle.loadString('assets/maps/dark_map.json');
    _mapsController.setMapStyle(style);
  }

  watchPosicao() async {
    positionStream = Geolocator.getPositionStream().listen(
      (Position position) {
        if (position != null) {
          latitude.value = position.latitude;
          longitude.value = position.longitude;
        }
      },
    );
  }

  @override
  void onClose() {
    positionStream.cancel();
    // super.onClose();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;

    bool ativado = await Geolocator.isLocationServiceEnabled();
    if (!ativado) {
      return Future.error('Por favor, habilite a localização no smartphone');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Você precisa autorizar o acesso à localização');
    }

    return await Geolocator.getCurrentPosition();
  }

  getPosition() async {
    try {
      final posicao = await _posicaoAtual();
      latitude.value = posicao.latitude;
      longitude.value = posicao.longitude;
      _mapsController.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(latitude.value, longitude.value),
        ),
      );
    } catch (e) {
      Get.snackbar(
        'Erro',
        e.toString(),
        backgroundColor: Colors.grey[900],
        colorText: white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    notifyListeners();
  }
}
