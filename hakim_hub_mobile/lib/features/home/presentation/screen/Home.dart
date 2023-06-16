import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Image(
                image: AssetImage('assets/images/HakimHubVectorImg.png'),
              ),
              Image(
                image: AssetImage('assets/images/HakimHub.png'),
              ),
            ],
          ),
          Image(
            image: AssetImage('assets/images/HakimHub.png'),
          ),
          Text('HakimHub'),
          Text(
            'Provide easily accessible information about healthcare facilities and healthcare professionals',
          ),
          TextField(
            decoration: InputDecoration(
              
            ),
          )
        ],
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:hakim_hub_mobile/core/utils/icons.dart';
// import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';
// import 'package:hakim_hub_mobile/features/core/splash_screen.dart';
// import 'package:hakim_hub_mobile/features/home/presentation/widgets/custom_card.dart';

// class HomePage extends StatelessWidget {
//   final List<String> services = ["cardio", "General", "Pediatrics"];

//   HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
//                 child: SizedBox(
//                   height: UIConverter.getComponentHeight(context, 250),
//                   width: UIConverter.getComponentWidth(context, 350),
//                   child: const Image(
//                     image: AssetImage("assets/images/homeImg.png"),
//                   ),
//                 ),
//               ),
//               const Text(
//                 "HakimHub",
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: UIConverter.getComponentHeight(context, 10),
//               ),
//               const Text(
//                   "Provide eassily accessible information about healthcare facilities and healthcare professionals",
//                   textAlign: TextAlign.center),
//               SizedBox(
//                 height: UIConverter.getComponentHeight(context, 20),
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: Container(
//                   height: UIConverter.getComponentHeight(context, 58),
//                   width: UIConverter.getComponentWidth(context, 381),
//                   child: Card(
//                     color: const Color.fromARGB(255, 237, 237, 237),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50)),
//                     child: const ListTile(
//                       leading: person,
//                       title: Text(
//                         "How are You feeling?",
//                         style: TextStyle(fontSize: 14),
//                       ),
//                       trailing: send,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: UIConverter.getComponentHeight(context, 30),
//               ),
//               // Expanded(
//               //   // child: CustomCard(chipTexts: services),
//               //   child: ListView.builder(
//               //       scrollDirection: Axis.horizontal,
//               //       itemBuilder: (context, index) {
//               //         return CustomCard(chipTexts: services);
//               //       }),
//               // )
//               Container(
//                 height: UIConverter.getComponentHeight(context, 240),
//                 width: UIConverter.getComponentWidth(context, 300),
//                 child: ListView.separated(
//                     separatorBuilder: (context, index) {
//                       return const SizedBox(
//                         width: 10,
//                       );
//                     },
//                     itemCount: 3,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return CustomCard(chipTexts: services);
//                     }),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }