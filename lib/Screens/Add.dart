import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stock/screens/Item.dart';
import 'package:stock/functions/function.dart';
import 'package:stock/model/stock.dart';
import '../functions/image.dart';

class Add extends StatefulWidget {
  const Add({Key? key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final _itemNameController = TextEditingController();
  final _openingStockController = TextEditingController();
  final _reorderStockController = TextEditingController();
  final _stallNumberController = TextEditingController();
  final _sellingPriceController = TextEditingController();
  final _costPriceController = TextEditingController();
  final StockRepository stockRepository = StockRepository();
  XFile? pickedImage;

  Future<void> _pickImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose From...'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  XFile? picked =
                      await ImageUtils.pickImage(ImageSource.camera);
                  setState(() {
                    pickedImage = picked;
                  });
                },
                child: Text('Camera'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  XFile? picked =
                      await ImageUtils.pickImage(ImageSource.gallery);
                  setState(() {
                    pickedImage = picked;
                  });
                },
                child: Text('Gallery'),
              ),
            ],
          ),
        );
      },
    );
  }

  String? _itemNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    return null;
  }

  String? _numericValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    if (int.tryParse(value) == null) {
      return 'Please enter a valid number.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 216, 255),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Item()),
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
            onPressed: () {
              final Stock newStock = Stock(
                imagePath: pickedImage?.path ?? '',
                itemname: _itemNameController.text,
                openingStock: int.parse(_openingStockController.text),
                reorderStock: int.parse(_reorderStockController.text),
                stallNo: _stallNumberController.text,
                sellingPrice: int.parse(_sellingPriceController.text),
                costPrice: int.parse(_costPriceController.text),
              );
              stockRepository.addStock(newStock);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Item(),
                  ));
            },
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
                  child: Stack(
                    children: [
                      pickedImage != null
                          ? Image.file(
                              File(pickedImage!.path),
                              width: 100,
                              height: 100,
                            )
                          : Container(),
                      pickedImage == null
                          ? IconButton(
                              onPressed: () {
                                _pickImage();
                              },
                              icon: Icon(Icons.camera_enhance_sharp),
                              iconSize: 68,
                              color: Color.fromARGB(255, 30, 110, 176),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              pickedImage == null
                  ? Text(
                      'Add Image',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 140, 255),
                      ),
                    )
                  : SizedBox(),
              SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextFormField(
                        'Item Name',
                        _itemNameController,
                        TextInputType.text,
                        'Enter Item Name',
                        _itemNameValidator,
                      ),
                      SizedBox(height: 16),
                      buildTextFormField(
                        'Opening Stock',
                        _openingStockController,
                        TextInputType.number,
                        '0.0',
                        _numericValidator,
                      ),
                      SizedBox(height: 16),
                      buildTextFormField(
                        'Reorder Stock',
                        _reorderStockController,
                        TextInputType.number,
                        '0.0',
                        _numericValidator,
                      ),
                      SizedBox(height: 16),
                      buildTextFormField('Stall No:', _stallNumberController,
                          TextInputType.text, 'A2...', _itemNameValidator),
                      SizedBox(height: 16),
                      buildTextFormField(
                        'Selling Price',
                        _sellingPriceController,
                        TextInputType.number,
                        '₹',
                        _numericValidator,
                      ),
                      SizedBox(height: 16),
                      buildTextFormField(
                        'Cost Price',
                        _costPriceController,
                        TextInputType.number,
                        '₹',
                        _numericValidator,
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

  TextFormField buildTextFormField(
    String label,
    TextEditingController controller,
    TextInputType keyboardType,
    String hintText,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: UnderlineInputBorder(),
        errorText: validator != null ? validator(controller.text) : null,
      ),
    );
  }
}
