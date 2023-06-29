import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:latlong2/latlong.dart';

class MapBoxWidget extends StatelessWidget {
  final double latitude;
  final double longitude;
  final VoidCallback? onTap;

  const MapBoxWidget({
    Key? key,
    required this.latitude,
    required this.longitude,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FlutterMap(
        mapController: MapController(),
        options: MapOptions(
          // minZoom: 5,
          // maxZoom: 18,
          center: LatLng(latitude, longitude),
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/fenetshewarega/cljgsjqhs00cj01pi5bw22hfz/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZmVuZXRzaGV3YXJlZ2EiLCJhIjoiY2xqY2k2ajhpMDFjajNlbW9lbTJvdmozeiJ9.6xeUCiBbQYWVIEzFBT9kPA",
            additionalOptions: {
              'accessToken':
                  "pk.eyJ1IjoiZmVuZXRzaGV3YXJlZ2EiLCJhIjoiY2xqY2k2ajhpMDFjajNlbW9lbTJvdmozeiJ9.6xeUCiBbQYWVIEzFBT9kPA",
              'mapStyleId':
                  "mapbox://styles/fenetshewarega/cljgsjqhs00cj01pi5bw22hfz",
            },
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                point: LatLng(latitude, longitude),
                builder: (ctx) => Container(
                  child: location,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}