import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock/functions/function.dart';
import 'package:stock/model/stock.dart';

class Update extends StatefulWidget {
  late final Stock stock;

  Update({super.key, required this.stock});

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final _itemNameController = TextEditingController();
  final _stallNumberController = TextEditingController();
  final _sellingPriceController = TextEditingController();
  final _costPriceController = TextEditingController();
  final _openingStockController = TextEditingController();
  final _quantityController = TextEditingController();
final StockRepository stockRepository = StockRepository();
  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    _itemNameController.text = widget.stock.itemname ?? '';
    _stallNumberController.text = widget.stock.stallNo ?? '';
    _sellingPriceController.text = widget.stock.sellingPrice.toString();
    _costPriceController.text = widget.stock.costPrice.toString();
    _openingStockController.text = widget.stock.openingStock.toString();
    _quantityController.text = widget.stock.quantity.toString();
  }

  void _saveChanges(BuildContext context) {
    Stock updatedStock = Stock(
      id: widget.stock.id,
      imagePath: widget.stock.imagePath,
      itemname: _itemNameController.text,
      stallNo: _stallNumberController.text,
      sellingPrice: int.tryParse(_sellingPriceController.text) ?? 0,
      costPrice: int.tryParse(_costPriceController.text) ?? 0,
      openingStock: int.tryParse(_openingStockController.text) ?? 0,
      quantity: int.tryParse(_quantityController.text) ?? 0,
    );
     stockRepository.editStocks(updatedStock);
    // Update the widget.stock object directly with the new values
    widget.stock.itemname = updatedStock.itemname;
    widget.stock.stallNo = updatedStock.stallNo;
    widget.stock.sellingPrice = updatedStock.sellingPrice;
    widget.stock.costPrice = updatedStock.costPrice;
    widget.stock.openingStock = updatedStock.openingStock;
    widget.stock.quantity = updatedStock.quantity;

    Navigator.pop(context, widget.stock);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 216, 255),
        iconTheme: const IconThemeData(color: Colors.black),
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
              _saveChanges(context); /*callback update */
            },
            child: const Text(
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
          height: 500,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextFormField('Item Name', _itemNameController,
                        TextInputType.text, 'Enter Item Name'),
                    const SizedBox(height: 16),
                    _buildTextFormField('Stall No:', _stallNumberController,
                        TextInputType.text, 'A2...'),
                    const SizedBox(height: 16),
                    _buildTextFormField('Selling Price',
                        _sellingPriceController, TextInputType.number, '₹'),
                    const SizedBox(height: 16),
                    _buildTextFormField('Cost Price', _costPriceController,
                        TextInputType.number, '₹'),
                    const SizedBox(height: 16),
                    _buildTextFormField('OpeningStock', _openingStockController,
                        TextInputType.number, '123....'),
                    // ... Add more form fields here if needed
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String labelText, TextEditingController controller,
      TextInputType keyboardType, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
