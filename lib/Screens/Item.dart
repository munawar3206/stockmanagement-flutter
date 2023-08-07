import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock/Screens/Sub%20Screens/detail.dart';
import 'package:stock/functions/function.dart';
import 'package:stock/model/stock.dart';

class Item extends StatelessWidget {
  final StockRepository stockRepository = StockRepository();
  final ValueNotifier<List<Stock>> stocksNotifier = ValueNotifier([]);

  Item({Key? key}) : super(key: key) {
    loadStocks();
  }

  void loadStocks() {
    stocksNotifier.value = stockRepository.getAllStock();
  }

  Future<void> _pickImage() async {
   
  }

  Future<void> _deleteStock(int index) async {
    stockRepository.deleteStock(index);
    loadStocks();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 207, 216, 255),
        title: Text(
          "Items",
          style: GoogleFonts.acme(
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 222, 228, 255),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                hintText: 'Search Item Name...',
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<Stock>>(
              valueListenable: stocksNotifier,
              builder: (context, stocks, _) {
                return ListView.builder(
                  itemCount: stocks.length,
                  itemBuilder: (BuildContext context, int index) {
                    Stock stock = stocks[index];
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        children: [
                          Card(
                            elevation: 10,
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  image: stock.imagePath != null
                                      ? DecorationImage(
                                          image:
                                              FileImage(File(stock.imagePath!)),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                                child: (stock.imagePath == null)
                                    ? IconButton(
                                        onPressed: _pickImage,
                                        icon: Icon(Icons.camera_enhance,
                                            size: 30),
                                      )
                                    : null,
                              ),
                              title: Text(stock.itemname!),
                              subtitle: Text(
                                stock.stallNo!,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 255, 4),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detail(stock: stock),
                                  ),
                                );
                              },
                              shape: Border.all(),
                              trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Confirm Deletion'),
                                        content: Text(
                                            'Are you sure you want to delete this Stock?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              _deleteStock(
                                                  index); // Call the deleteStock method
                                              Navigator.pop(context);
                                            },
                                            child: Text('Delete'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.delete),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
