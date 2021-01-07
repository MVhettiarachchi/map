import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class Group{
  String id;
  String groupName;
  LatLng position;

  Group(this.id,this.groupName,this.position);
}

class _MapViewState extends State<MapView> {

  Completer<GoogleMapController> _controller = Completer();
  static List<Marker> markers = [];

  List<Group> _groups = [
    Group('1','Group 01', LatLng(20.9200, 79.8600)),
    Group('2','Group 02', LatLng(20.7890, 79.6985)),
    Group('3','Group 03', LatLng(20.1250, 79.0123)),
    Group('4','Group 04', LatLng(20.9900, 79.0600)),
  ];

  static final CameraPosition _initialPoint = CameraPosition(
    target: LatLng(20.9200, 79.8600),
    zoom: 14.4746,
  );

  void addMarker(String _markerID,String _infoWindow,LatLng _latLng) {
    markers.add(Marker(
      markerId: MarkerId(_markerID),
      draggable: false,
      infoWindow: InfoWindow(title: _infoWindow),
      position: _latLng,
      onTap: () {},
    ));
  }

  void setMakers(int num){
    switch(num){
      case 1:
        _groups.forEach((element) {
          if(element.groupName == 'Group 01'){
            setState(() {
              addMarker(element.id, element.groupName, element.position);
            });
          }
        });
        break;
      case 2:
        _groups.forEach((element) {
            if(element.groupName == 'Group 02'){
              setState(() {
                addMarker(element.id, element.groupName, element.position);
              });
            }
          });
        break;
      case 3:
        _groups.forEach((element) {
          if(element.groupName == 'Group 03'){
            setState(() {
              addMarker(element.id, element.groupName, element.position);
            });
          }
        });
        break;
      case 4:
        _groups.forEach((element) {
          if(element.groupName == 'Group 04'){
            setState(() {
              addMarker(element.id, element.groupName, element.position);
            });
          }
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            compassEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialPoint,
            markers: Set.from(markers),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: (_){},
          ),
          Positioned(
              top: 10,
              
              child:
              ListView(
             //  scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                InkWell(
                  onTap: (){
                    setMakers(1);
                  },
                  child: Chip(
                      label: Text("Group 01"),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setMakers(2);
                  },
                  child: Chip(
                      label: Text("Group 02"),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setMakers(3);
                  },
                  child: Chip(
                      label: Text("Group 03"),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setMakers(4);
                  },
                  child: Chip(
                      label: Text("Group 04"),
                  ),
                ), 
              ],
            ) ,
          ),
          
         
            
          
        ],
      ),
    );
  }
}