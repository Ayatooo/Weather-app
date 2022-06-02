// // ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element

// import 'package:flutter/material.dart';

// import '../main.dart';

// Widget contentFinishedDownload(_data) {
//   return Center(
//     child: ListView.separated(
//       itemCount: _data.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(_data[index].toString()),
//         );
//       },
//       separatorBuilder: (context, index) {
//         return const Divider();
//       },
//     ),
//   );
// }

// Widget contentDownloading() {
//   return Container(
//     margin: const EdgeInsets.all(25),
//     child: Column(children: [
//       const Text(
//         'Fetching Weather...',
//         style: TextStyle(fontSize: 20),
//       ),
//       Container(
//           margin: const EdgeInsets.only(top: 50),
//           child:
//               const Center(child: CircularProgressIndicator(strokeWidth: 10)))
//     ]),
//   );
// }

// Widget contentNotDownloaded() {
//   return Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: const <Widget>[
//         Text(
//           'Press the button to download the Weather forecast',
//         ),
//       ],
//     ),
//   );
// }

// Widget _resultView(_state, _data) => _state == AppState.FINISHED_DOWNLOADING
//     ? contentFinishedDownload(_data)
//     : _state == AppState.DOWNLOADING
//         ? contentDownloading()
//         : contentNotDownloaded();

// void _saveLat(String input, lat) {
//   lat = double.tryParse(input);
//   print(lat);
// }

// void _saveLon(String input, lon) {
//   lon = double.tryParse(input);
//   print(lon);
// }

// Widget _coordinateInputs(_saveLat, _saveLon) {
//   return Row(
//     children: <Widget>[
//       Expanded(
//         child: Container(
//             margin: const EdgeInsets.all(5),
//             child: TextField(
//                 decoration: const InputDecoration(
//                     border: OutlineInputBorder(), hintText: 'Enter latitude'),
//                 keyboardType: TextInputType.number,
//                 onChanged: _saveLat,
//                 onSubmitted: _saveLat)),
//       ),
//       Expanded(
//           child: Container(
//               margin: const EdgeInsets.all(5),
//               child: TextField(
//                   decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Enter longitude'),
//                   keyboardType: TextInputType.number,
//                   onChanged: _saveLon,
//                   onSubmitted: _saveLon)))
//     ],
//   );
// }
