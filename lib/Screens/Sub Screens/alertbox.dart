import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stock/model/stock.dart';
import '../../utility/utilities.dart';

class CustomAlertDialog {
  static Future<Stock?> showAlertDialog(
      BuildContext context, Stock stock, TextEditingController quantityController) async {
    final stockUtils = StockUtils([quantityController]);

    return showDialog<Stock>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
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
                    onPressed: () =>
                        stockUtils.decreaseStockQuantities(),
                    icon: Icon(Icons.remove),
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: quantityController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textAlign: TextAlign.center,
                      decoration:const  InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "0",
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () =>
                        stockUtils.increaseStockQuantities(),
                    icon:const Icon(Icons.add),
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
   ElevatedButton(
  onPressed: () {
    int quantity = stockUtils.getTotalQuantity();

    stock.quantity = quantity;

    Navigator.of(ctx).pop(stock);
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
        );
      },
    );
  }
}
