// import 'package:flutter/material.dart';
// import 'package:stock/bottom.dart';

// class ScreenSplash extends StatefulWidget {
//   const ScreenSplash({super.key});

//   @override
//   State<ScreenSplash> createState() => _ScreenSplashState();
// }

// class _ScreenSplashState extends State<ScreenSplash> {
//   @override
//   void initState() {
//     gotobottom();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: Center(
//           child: Image.asset(
//             "asset/inventoware-logo1.png",
//             height: 300,
//             width: 300,
//           ),
//         ),
//         backgroundColor: Color.fromARGB(255, 255, 255, 255),
//       );

//   Future<void> gotobottom() async {
//     await Future.delayed(Duration(seconds: 3));
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => Bottom(),
//       ),
//     );
//   }
// }
