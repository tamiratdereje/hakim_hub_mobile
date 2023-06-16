// import 'package:flutter/material.dart';
// import 'package:hakim_hub_mobile/core/utils/colors.dart';
// import 'package:hakim_hub_mobile/core/utils/icons.dart';
// import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';
// import 'package:hakim_hub_mobile/features/home/presentation/widgets/custom_chips.dart';

// class CustomCard extends StatelessWidget {
//   final List<Color> chipColors = [
//     tertiaryTextColor,
//     primaryColor,
//     chipTextColor,
//   ];

//   final List<String> chipTexts;

//   CustomCard({required this.chipTexts});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20),
//       child: Material(
//         elevation: 10, // Add elevation here
//         borderRadius: BorderRadius.circular(30),
//         child: Container(
//           width: UIConverter.getComponentWidth(context, 300),
//           height: UIConverter.getComponentHeight(context, 228),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 // margin: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
//                 width: UIConverter.getComponentWidth(context, 300),
//                 height: UIConverter.getComponentHeight(context, 114),
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                   color: Colors.blue,
//                   border: Border.all(width: 2, color: Colors.white),
//                   image: const DecorationImage(
//                     image: AssetImage('assets/images/hositalsImg.png'),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 10, top: 10),
//                 child: Text(
//                   "Tikur Anbesa",
//                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: chipTexts.length,
//                   itemBuilder: (context, index) => ChipsCards(
//                       chipTexts[index], chipColors[index % chipColors.length]),
//                 ),
//               ),
//               const Align(
//                 alignment: Alignment
//                     .topRight, // Align the location text to the top-right corner
//                 child: Padding(
//                   padding: EdgeInsets.only(right: 30, bottom: 5),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       location,
//                       Text(
//                         "King George Street",
//                         style: TextStyle(color: location`IconColor),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }