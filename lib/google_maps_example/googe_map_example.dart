import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapExample extends StatefulWidget {
  @override
  _GoogleMapExampleState createState() => _GoogleMapExampleState();
}

class _GoogleMapExampleState extends State<GoogleMapExample> {
  double zoomVal=5.0;
  Completer<GoogleMapController> _controller=Completer();
  List<Map> listOfMarkersDetails=[
    {
    'markerId':'Paradise',
    'latitude':17.4417,
    'longitude':78.4873,
    'title':'Paradise Restaurant',
    'imageUrl':'https://maps.mapmyindia.com/place/P0015246243.jpg'
    },
    {
    'markerId':'Cafe Bahar',
    'latitude':17.3997,
    'longitude':78.4786,
    'title':'Cafe Bahar Restaurant',
    'imageUrl':'https://maps.mapmyindia.com/place/P0015246243.jpg'
    },
    {
    'markerId':'Chutneys',
    'latitude':17.4296,
    'longitude':78.4096,
    'title':'Chutneys Restaurant',
    'imageUrl':'https://maps.mapmyindia.com/place/P0015246243.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: Stack(
        children: <Widget>[
          _googleMaps(context),
          _zoomInFunction(),
          _zoomOutFunction(),
          _buildContainer()
        ],
      ),
    );
  }

  Widget _zoomInFunction(){
    return Align(
      alignment: Alignment.topRight,
      
      child: IconButton(
        icon: Icon(FontAwesomeIcons.searchMinus,), 
        onPressed: (){
            zoomVal--;
            _onMinus(zoomVal);
        }),
    );

  }
  Widget _zoomOutFunction(){
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Icon(FontAwesomeIcons.searchPlus), 
        onPressed: (){
          zoomVal++;
          _onPlus(zoomVal);
        }),
    );
  }
  Future _onMinus(double zoomVal)async{
    final GoogleMapController controller=await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target:LatLng(17.3850, 78.4867),zoom: zoomVal )));
  }
  Future _onPlus(double zoomVal)async{
    final GoogleMapController controller=await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target:LatLng(17.3850, 78.4867),zoom: zoomVal )));
  }

  Widget _googleMaps(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: LatLng(17.3850, 78.4867),zoom: 12),
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
        markers: getMarkers()
      ),
    );
  }
    Set<Marker> getMarkers(){
      Set<Marker> markerSet=Set<Marker>();
      
      for (var marker in listOfMarkersDetails) {
            
            markerSet.add(
                    Marker(
                  markerId: MarkerId(marker['markerId']),
                  position: LatLng(marker['latitude'], marker['longitude']),
                  infoWindow: InfoWindow(title: marker['title']),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueViolet,
                  ),
                )
          ); 
        
      }
      return markerSet;

    }

   Widget _buildContainer(){
     return Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 150,
              child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder:(ctx,index)=> InkWell(
            onTap: ()async{
              final GoogleMapController controller=await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(target:LatLng(listOfMarkersDetails[index]['latitude'], listOfMarkersDetails[index]['longitude']),zoom: 15,tilt: 50.0,bearing: 45.0)));
            },
                      child: Padding(
              padding: const EdgeInsets.all(8.0),
             child: Material(
             elevation: 5,
             color: Colors.white,
             borderRadius: BorderRadius.circular(20),
             child: 
               
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Material(
                     
                     elevation: 5,
                     borderRadius: BorderRadius.circular(24.0),
                      // color: Colors.white,
                      child:ClipRRect(
                        
                        borderRadius: BorderRadius.circular(24.0),
                        child: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(listOfMarkersDetails[index]['imageUrl']))
                        ),
                   ),
                   Text(listOfMarkersDetails[index]['title'],textAlign: TextAlign.center,)
                 ],
               ),
             
         ),
       ),
          ),
       ),
     ),
     );
   }
  
  
}