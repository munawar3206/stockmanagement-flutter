import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Update extends StatelessWidget {
  const Update({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 216, 255),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Edit Items',
          style: GoogleFonts.acme(
              fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "SAVE",
                style: TextStyle(color: Color.fromARGB(255, 0, 42, 255)),
              ))
        ],
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 222, 228, 255),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 400,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Item Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Enter Item Name',
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(height: 16),
                  Text(
                    'Stall No:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'A2...',
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Selling Price',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: '₹',
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Cost Price',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: '₹',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
