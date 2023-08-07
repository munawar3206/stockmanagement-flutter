import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock/functions/function.dart';
import 'package:stock/model/stock.dart';
import 'package:stock/screens/Sub%20Screens/update.dart';
import '../../functions/alertbox.dart';

class Detail extends StatelessWidget {
  final Stock stock;

  Detail({required this.stock});

  final StockRepository stockRepository = StockRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 216, 255),
        elevation: 0,
        title: Text(
          "Item Details",
          style: GoogleFonts.acme(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Update(),
                  ));
            },
            icon: Icon(Icons.edit),
          ),
          SizedBox(height: 10),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 222, 228, 255),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              child: ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: stock.imagePath != null
                        ? DecorationImage(
                            image: FileImage(File(stock.imagePath!)),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
                title: Row(
                  children: [
                    Text(stock.itemname ?? 'Unknown Item'),
                  ],
                ),
                subtitle: Text('Price: ${stock.sellingPrice}'),
                trailing: Text(
                  'Stall Number: ${stock.stallNo}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              CustomAlertDialog.showAlertDialog(context, stock);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 38, 0, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.system_update_alt_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(width: 18),
                  Text(
                    "UPDATED STOCK",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
