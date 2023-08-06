import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stock/Screens/Sub%20Screens/detail.dart';
import 'package:stock/functions/function.dart';
import 'package:stock/functions/image.dart';
import 'package:stock/model/stock.dart';

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  final StockRepository stockRepository = StockRepository();
  List<Stock> stocks = [];

  @override
  void initState() {
    super.initState();

    loadStocks();
  }

  void loadStocks() {
    stocks = stockRepository.getAllStock();
  }

  // refresh
  void deleteStockItem(int index) {
    stockRepository.deleteStock(index);

    setState(() {
      loadStocks();
    });
  }

  XFile? pickedImage;

  Future<void> _pickImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
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
            child: ListView.builder(
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
                              image: pickedImage != null
                                  ? DecorationImage(
                                      image: FileImage(File(pickedImage!.path)),
                                      fit: BoxFit.cover,
                                    )
                                  : stock.imagePath != null
                                      ? DecorationImage(
                                          image:
                                              FileImage(File(stock.imagePath!)),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                            ),
                            child: (pickedImage == null &&
                                    stock.imagePath == null)
                                ? IconButton(
                                    onPressed: _pickImage,
                                    icon: Icon(Icons.camera_enhance, size: 30),
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
                              MaterialPageRoute(builder: (context) => Detail()),
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
                                          int stockIndex =
                                              stocks.indexOf(stock);
                                          stockRepository
                                              .deleteStock(stockIndex);
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
            ),
          ),
        ],
      ),
    );
  }
}
