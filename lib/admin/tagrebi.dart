// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:project/Shared/companents.dart';
// import 'package:project/admin/profile.dart';
// import 'package:project/cubit/home/homecubit.dart';
// import 'package:project/cubit/home/homestates.dart';
// import 'package:project/models/direction/directionmodel.dart';
// import 'package:project/models/direction/directionrep.dart';
// import 'package:project/models/direction/location.dart';
// import 'package:project/models/drivermodel.dart';
// import 'package:project/models/schoolmodel.dart';

// List<Marker> mark = [];
// List<Marker> mark2 = [];
// List<Marker> mark3 = [];
// List<Marker> mark4 = [];
// List<Marker> sourcemark = [];
// List<Marker> desmark = [];
// List<Marker> Allmark = [];
// LatLng? Selected;
// Marker? origin;
// Marker? destination;
// Directions? info;
// late Marker place;
// String? dropdownValue;
// String? dropdownValue2;

// var destController = TextEditingController();
// var sourController = TextEditingController();
// var s = TextEditingController();

// class mapshow extends StatelessWidget {
//   var scafKey = GlobalKey<ScaffoldState>();

//   static const _initialCameraPosition = CameraPosition(
//     target: LatLng(30.550679254525768, 31.011754704585183),
//     zoom: 15,
//   );
//   // GoogleMapController? _googleMapController;

//   @override
//   Widget build(BuildContext context) {
//     Completer<GoogleMapController> contr = Completer();

//     homeCubit.get(context).getschool(contr);
//     //  if( homeCubit.get(context).drivers.isEmpty) homeCubit.get(context).getdrivers();
//     // homeCubit.get(context). getUserData();

//     return BlocConsumer<homeCubit, HomeStates>(
//       builder: (BuildContext context, state) {
//         return Scaffold(
//           key: scafKey,
//           appBar: AppBar(
//             title: Container(
//                 width: double.infinity,
//                 height: 40,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(5)),
//                 child: Center(
//                   child: TextField(
//                     controller: s,
//                     decoration: InputDecoration(
//                         prefixIcon: IconButton(
//                           icon: Icon(
//                             Icons.search,
//                             color: Theme.of(context).backgroundColor,
//                           ),
//                           onPressed: () async {
//                             var place = await locationserves().getplace(s.text);
//                             getToPlace(place, contr);
//                           },
//                         ),
//                         suffixIcon: IconButton(
//                           icon: Icon(Icons.clear),
//                           onPressed: () {
//                             s.text = '';
//                           },
//                         ),
//                         hintText: 'Search...',
//                         border: InputBorder.none),
//                   ),
//                 )),
//             // actions: [

//             //   // TextButton(
//             //   //     onPressed: () async {
//             //   //       siu();
//             //   //       print("siu is done");
//             //   //     },
//             //   //     child: Icon(Icons.dangerous)),

//             // ],
//           ),
//           body: Column(
//             children: [
//               Container(
//                 color: Colors.grey.withOpacity(.1),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 50,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: DropdownButton(
//                                 isExpanded: true,
//                                 items:
//                                     mark.map<DropdownMenuItem<String>>((value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value.infoWindow.title.toString(),
//                                     child:
//                                         Text(value.infoWindow.title.toString()),
//                                   );
//                                 }).toList(),
//                                 // value: dropdownValue,
//                                 hint: const Align(
//                                   alignment: Alignment.centerLeft,
//                                   child: Text(
//                                     "Select Your School",
//                                     style: TextStyle(color: Colors.grey),
//                                   ),
//                                 ),
//                                 isDense: true,

//                                 icon: const Icon(
//                                   Icons.arrow_drop_down,
//                                   color: Colors.teal,
//                                 ),
//                                 elevation: 16,
//                                 underline: Container(
//                                   height: 2,
//                                   // color: Colors.deepPurpleAccent,
//                                 ),
//                                 onChanged: (String? newValue) {
//                                   dropdownValue = newValue;
//                                   destController.text = newValue!;
//                                   homeCubit.get(context).DropdownButtonfunction(
//                                       select: newValue, cont: contr);
//                                 },
//                               ),
//                             ),
//                             SizedBox(
//                               width: 15,
//                             ),
//                             Container(
//                               width: 150,
//                               height: 200,
//                               child: SingleChildScrollView(
//                                 child: TextFormField(
//                                   controller: destController,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                   enabled: false,
//                                   decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: 50,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: DropdownButton(
//                                 isExpanded: true,
//                                 items: mark2
//                                     .map<DropdownMenuItem<String>>((value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value.infoWindow.title.toString(),
//                                     child:
//                                         Text(value.infoWindow.title.toString()),
//                                   );
//                                 }).toList(),
//                                 // value: dropdownValue,
//                                 hint: const Align(
//                                   alignment: Alignment.centerLeft,
//                                   child: Text(
//                                     "Select Your area",
//                                     style: TextStyle(color: Colors.grey),
//                                   ),
//                                 ),
//                                 isDense: true,

//                                 icon: const Icon(
//                                   Icons.arrow_drop_down,
//                                   color: Colors.teal,
//                                 ),
//                                 elevation: 16,
//                                 underline: Container(
//                                   height: 2,
//                                   // color: Colors.deepPurpleAccent,
//                                 ),
//                                 onChanged: (String? newValue) {
//                                   homeCubit
//                                       .get(context)
//                                       .DropdownButtonfunction2(
//                                           cont: contr, select: newValue!);
//                                   dropdownValue2 = newValue;
//                                   sourController.text = newValue;
//                                 },
//                               ),
//                             ),
//                             SizedBox(
//                               width: 15,
//                             ),
//                             Container(
//                               width: 150,
//                               height: 30,
//                               child: SingleChildScrollView(
//                                 child: TextFormField(
//                                   controller: sourController,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                   enabled: false,
//                                   decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     if (origin != null && destination != null)
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 height: 30,
//                                 width: 90,
//                                 color: Colors.teal,
//                                 child: TextButton(
//                                     onPressed: () async {
//                                       Allmark.clear();
//                                       Allmark.addAll(mark3);
//                                       Allmark.addAll(mark4);

//                                       homeCubit
//                                           .get(context)
//                                           .getRoad(cont: contr);
//                                       print("getRoad is done");
//                                     },
//                                     child: Text(
//                                       "Get Direction",
//                                       style: TextStyle(color: Colors.white),
//                                     )),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 height: 30,
//                                 width: 90,
//                                 color: Colors.teal,
//                                 child: TextButton(
//                                     onPressed: () {
//                                       homeCubit.get(context).getDriverOfPlace(
//                                           from: destController.text,
//                                           to: sourController.text);
//                                       scafKey.currentState
//                                           ?.showBottomSheet((context) {
//                                         // print(homeCubit.get(context).u_model!.email);
//                                         return Container(
//                                           height: 400,
//                                           child: ConditionalBuilder(
//                                             builder: (BuildContext context) {
//                                               return ConditionalBuilder(
//                                                 builder:
//                                                     (BuildContext context) {
//                                                   return ListView.separated(
//                                                     itemBuilder:
//                                                         (BuildContext context,
//                                                             int index) {
//                                                       return buttomS(
//                                                           context,
//                                                           homeCubit
//                                                                   .get(context)
//                                                                   .driverOfPlace[
//                                                               index]);
//                                                     },
//                                                     itemCount: homeCubit
//                                                         .get(context)
//                                                         .driverOfPlace
//                                                         .length,
//                                                     separatorBuilder:
//                                                         (BuildContext context,
//                                                             int index) {
//                                                       return Container(
//                                                         height: 2,
//                                                         width: double.infinity,
//                                                         color: Colors.grey[500],
//                                                       );
//                                                     },
//                                                   );
//                                                 },
//                                                 condition: homeCubit
//                                                     .get(context)
//                                                     .driverOfPlace
//                                                     .isNotEmpty,
//                                                 fallback:
//                                                     (BuildContext context) {
//                                                   return Center(
//                                                       child: Text(
//                                                     "No Driver Is Avaliable",
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .bodyText2,
//                                                   ));
//                                                 },
//                                               );
//                                             },
//                                             condition: state
//                                                 is! getDriverOfPlaceloading,
//                                             fallback: (BuildContext context) {
//                                               return Center(
//                                                   child:
//                                                       CircularProgressIndicator());
//                                             },
//                                           ),
//                                         );
//                                       });
//                                     },
//                                     child: Text(
//                                       "Get A Driver",
//                                       style: TextStyle(color: Colors.white),
//                                     )),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                         ],
//                       ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: GoogleMap(
//                   myLocationButtonEnabled: false,
//                   zoomControlsEnabled: false,
//                   compassEnabled: false,
//                   buildingsEnabled: false,
//                   indoorViewEnabled: false,
//                   liteModeEnabled: false,
//                   mapToolbarEnabled: false,
//                   rotateGesturesEnabled: false,
//                   // scrollGesturesEnabled: false,
//                   tiltGesturesEnabled: false,
//                   // zoomGesturesEnabled: false,
//                   trafficEnabled: false,

//                   initialCameraPosition: _initialCameraPosition,
//                   onMapCreated: (controller) => contr.complete(controller),
//                   markers: Set<Marker>.of(Allmark),
//                   mapType: MapType.normal,
//                   polylines: {
//                     if (info != null)
//                       Polyline(
//                         polylineId: const PolylineId('overview_polyline'),
//                         color: Colors.lightBlue,
//                         width: 3,
//                         points: info!.polylinePoints
//                             .map((e) => LatLng(e.latitude, e.longitude))
//                             .toList(),
//                       ),
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//       listener: (BuildContext context, Object? state) {},
//     );
//   }

//   Future<void> getToPlace(Map<String, dynamic> place, contr) async {
//     final double lat = place['geometry']['location']['lat'];
//     final double lng = place['geometry']['location']['lng'];
//     final GoogleMapController controller = await contr.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(
//         CameraPosition(target: LatLng(lat, lng), zoom: 15)));
//   }

//   buttomS(context, drivermodel model) {
//     // driverOfPlace
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(20),
//           child: CircleAvatar(
//             radius: 30,
//             backgroundImage: NetworkImage("${model.profile}"),
//           ),
//         ),
//         SizedBox(
//           width: 20,
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               "${model.name}",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 6,
//             ),
//             Text(
//               "${model.bio}",
//               style: TextStyle(fontSize: 14, color: Colors.grey[650]),
//             ),
//           ],
//         ),
//         Spacer(),
//         IconButton(
//             onPressed: () {
//               // Allmark.clear();
//               // Allmark.addAll(mark3);
//               // Allmark.addAll(mark4);
//               NavegatorPush(
//                   context,
//                   profile(
//                     model: model,
//                   ));
//             },
//             icon: Icon(Icons.add)),
//       ],
//     );
//   }
// }
