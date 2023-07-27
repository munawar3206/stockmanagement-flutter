import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock/Screens/Item.dart';

class add extends StatelessWidget {
  const add({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 216, 255),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => item()),
            );
          },
          icon: Icon(Icons.arrow_back),
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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 207, 216, 255),
                    border: Border.all(width: 8, color: Colors.white),
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
              SizedBox(height: 20),
              Card(
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
                      Text(
                        'Opening Stock',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: '0.0',
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Reorder Stock',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: '0.0',
                        ),
                      ),
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
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 222, 228, 255),
    );
  }
}
