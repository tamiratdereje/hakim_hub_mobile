import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:latlong2/latlong.dart';

class MapBoxWidget extends StatelessWidget {
  const MapBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: MapController(),
      options: MapOptions(
        minZoom: 5,
        maxZoom: 18,
        zoom: 13,
        center: LatLng(51.5090214, -0.1982948),
      ),
      layers: [
        TileLayerOptions(
          urlTemplate:
              "https://api.mapbox.com/styles/v1/fenetshewarega/cljcic07o00fy01p9etoj6t6p/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZmVuZXRzaGV3YXJlZ2EiLCJhIjoiY2xqY2k2ajhpMDFjajNlbW9lbTJvdmozeiJ9.6xeUCiBbQYWVIEzFBT9kPA",
          additionalOptions: {
            'accessToken':
                "pk.eyJ1IjoiZmVuZXRzaGV3YXJlZ2EiLCJhIjoiY2xqY2k2ajhpMDFjajNlbW9lbTJvdmozeiJ9.6xeUCiBbQYWVIEzFBT9kPA",
            'mapStyleId':
                "mapbox://styles/fenetshewarega/cljciby4900fd01qzedo15ti9",
          },
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              point: LatLng(51, -0.1982948),
              builder: (ctx) => Container(
                child: location,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
