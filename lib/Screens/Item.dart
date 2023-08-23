import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock/Screens/Sub%20Screens/detail.dart';
import 'package:stock/bottom.dart';
import 'package:stock/functions/function.dart';
import 'package:stock/model/stock.dart';
import 'package:lottie/lottie.dart';

class Item extends StatelessWidget {
  final StockRepository stockRepository = StockRepository();
  final ValueNotifier<List<Stock>> stocksNotifier = ValueNotifier([]);

  Item({Key? key}) : super(key: key) {
    loadStocks();
  }

  List<Stock> loadStocks() {
    final allStocks = stockRepository.getAllStock();
    stocksNotifier.value = allStocks;

    return allStocks;
  }

  Future<void> _deleteStock(int id) async {
    stockRepository.deleteStock(id);
    stocksNotifier.value.removeAt(id);
    stocksNotifier.value = List.from(stocksNotifier.value);
  }

  List<Stock> filterStocks(List<Stock> stocks, String query) {
    if (query.isEmpty) {
      return stocksNotifier.value;
    } else {
      return stocks
          .where((stock) =>
              stock.itemname!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Bottom(),
                ));
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
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
              onChanged: (value) {
                final filteredStocks =
                    filterStocks(stockRepository.getAllStock(), value);
                stocksNotifier.value = filteredStocks;
              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  hintText: 'Search Item Name...',
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: const Color.fromARGB(255, 0, 0, 0),
                  suffixIcon: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Item(),
                          ));
                    },
                    icon: Icon(Icons.close),
                    color: Colors.black,
                  )),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<Stock>>(
              valueListenable: stocksNotifier,
              builder: (context, stocks, _) {
                if (stocks.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset('asset/data.json'),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: stocks.length,
                  reverse: false,
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
                              ),
                              title: Text(
                                stock.itemname!,
                                style: GoogleFonts.acme(),
                              ),
                              subtitle: Text(
                                stock.stallNo!,
                                style: GoogleFonts.acme(
                                  color: Color.fromARGB(255, 2, 26, 93),
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
                                        title: const Text('Confirm Deletion'),
                                        content: const Text(
                                            'Are you sure you want to delete this Stock?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              _deleteStock(index);
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Delete'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.delete),
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
