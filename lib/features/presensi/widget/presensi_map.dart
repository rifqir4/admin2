import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:location/location.dart';
import 'package:map/map.dart';

class PresensiMap extends StatefulWidget {
  PresensiMap({Key key}) : super(key: key);

  @override
  _PresensiMapState createState() => _PresensiMapState();
}

class _PresensiMapState extends State<PresensiMap> {
  MapController _mapController =
      new MapController(location: LatLng(0, 0), zoom: 18);
  LatLng titik;

  Future<LatLng> _getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();
    return LatLng(_locationData.latitude, _locationData.longitude);
  }

  Future<LatLng> _future;

  @override
  void initState() {
    super.initState();
    _future = _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LatLng>(
      future: _future,
      builder: (context, snap) => snap.connectionState != ConnectionState.done
          ? Center(
              child: Text("Mengambil Kordinat"),
            )
          : MapLayoutBuilder(
              controller: _mapController,
              builder: (context, transformer) {
                titik = snap.data != null
                    ? snap.data
                    : LatLng(-6.9172416, 107.6149198);
                transformer.controller.center = titik;
                final homeLocation = transformer.fromLatLngToXYCoords(titik);
                final homeMarkerWidget =
                    _buildMarkerWidget(homeLocation, Colors.blue);
                return Stack(
                  children: [
                    Map(
                      controller: _mapController,
                      builder: (context, x, y, z) {
                        final mapUrl =
                            "https://a.tile.openstreetmap.org/$z/$x/$y.png";
                        return CachedNetworkImage(
                          imageUrl: mapUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, text) => Text("Loading"),
                        );
                      },
                    ),
                    homeMarkerWidget,
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Material(
                        type: MaterialType.transparency,
                        child: IconButton(
                          icon: Icon(Icons.refresh, color: Colors.black87),
                          splashRadius: 20,
                          onPressed: () {
                            setState(() {
                              _future = _getLocation();
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }

  Widget _buildMarkerWidget(Offset pos, Color color) {
    return Positioned(
      left: pos.dx - 16,
      top: pos.dy - 16,
      width: 30,
      height: 30,
      child: Icon(Icons.location_on, color: color),
    );
  }
}
