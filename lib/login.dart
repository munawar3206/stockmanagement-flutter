// import 'package:flutter/material.dart';
// import 'package:stock/bottom.dart';

// class Login extends StatelessWidget {
//   const Login({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Welcome'),
//         backgroundColor: const Color.fromARGB(255, 0, 0, 0),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//           const   CircleAvatar(
//               backgroundImage: AssetImage('asset/inventoware-logo1.png'),
//               radius: 50,
//             ),
//          const   SizedBox(
//               height: 20,
//             ),
//             const TextField(
//               decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Color.fromARGB(255, 227, 227, 227),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                     borderSide: BorderSide(
//                         color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
//                   ),
//                   hintText: "Enter Your Name",
//                   hintStyle: TextStyle(fontStyle: FontStyle.italic)),
//               cursorColor: Color.fromARGB(255, 17, 0, 255),
//             ),
//         const    SizedBox(
//               height: 20,
//             ),
//             ElevatedButton.icon(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Bottom(),
//                     ));
//               },
//               icon: const Icon(Icons.arrow_circle_right),
//               label: const Text("Gets Started"),
//               style: ElevatedButton.styleFrom(
//                   primary: const Color.fromARGB(255, 51, 0, 255)),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor:const Color.fromARGB(255, 7, 14, 142),
//     );
//   }
// }
