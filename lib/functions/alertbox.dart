import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stock/model/stock.dart';

class CustomAlertDialog {
  static void showAlertDialog(BuildContext context, Stock stock) {
    TextEditingController quantityController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Select Quantity"),
            IconButton(
              onPressed: () => Navigator.of(ctx).pop(),
              icon: Icon(Icons.close),
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
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
            SizedBox(height: 10),
            Text(stock.itemname ?? 'Unknown Item'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    int quantity = int.tryParse(quantityController.text) ?? 0;
                    quantity--;
                    quantityController.text = quantity.toString();
                  },
                  icon: Icon(Icons.remove),
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "1",
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    int quantity = int.tryParse(quantityController.text) ?? 0;
                    quantity++;
                    quantityController.text = quantity.toString();
                  },
                  icon: Icon(Icons.add),
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              int quantity = int.tryParse(quantityController.text) ?? 0;
              // Use the quantity value here or pass it to another function as needed
              Navigator.of(ctx).pop();
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 0, 0, 255),
            ),
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
