import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock/model/stock.dart';

class Update extends StatefulWidget {
  final Stock stock;

  Update({required this.stock});

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController _itemNameController = TextEditingController();
  TextEditingController _stallNumberController = TextEditingController();
  TextEditingController _sellingPriceController = TextEditingController();
  TextEditingController _costPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _itemNameController.text = widget.stock.itemname ?? '';
    _stallNumberController.text = widget.stock.stallNo ?? '';
    _sellingPriceController.text = widget.stock.sellingPrice.toString();
    _costPriceController.text = widget.stock.costPrice.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 216, 255),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Edit Items',
          style: GoogleFonts.acme(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
   
             Stock updatedStock = Stock(
                        id: widget.stock.id,
                        imagePath: widget.stock.imagePath,
                        itemname: _itemNameController.text,
                        stallNo: _stallNumberController.text,
                        sellingPrice:
                             int.tryParse(_sellingPriceController.text) ?? 0,
                        costPrice: int.tryParse(_costPriceController.text) ?? 0,
                        openingStock: widget.stock.openingStock, 
                        reorderStock: widget.stock.reorderStock,
                     
                      );

              // You can now use this updatedStock object to save the data or perform other actions.
              // For example, you can pass it back to the previous screen using Navigator.pop.

              Navigator.pop(context, updatedStock); // Pass the updated stock back
            },
            child: Text(
              "SAVE",
              style: TextStyle(color: Color.fromARGB(255, 0, 42, 255)),
            ),
          )
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
                    controller: _itemNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Enter Item Name',
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
                    controller: _stallNumberController,
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
                    controller: _sellingPriceController,
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
                    controller: _costPriceController,
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
