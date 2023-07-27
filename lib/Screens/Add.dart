import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class add extends StatelessWidget {
  const add({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 216, 255),
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: Text(
          "Add Item",
          style: GoogleFonts.acme(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'SAVE',
              style: TextStyle(color: Color.fromARGB(255, 0, 13, 255)),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 207, 216, 255),
                  border: Border.all(
                      width: 8, color: Colors.white), // add border here
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.camera_enhance,
                      size: 50,
                      color: const Color.fromARGB(255, 30, 110, 176),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Add Image',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 30, 110, 176)),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                child: Row(children: [
                  
                  
                ]),
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 222, 228, 255),
    );
  }
}
