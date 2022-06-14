import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  static const String id = 'map_screen';

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
        Text('map'),
    );
  }
}
