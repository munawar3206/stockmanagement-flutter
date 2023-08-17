import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:stock/Screens/Sub%20Screens/detail.dart';
import 'package:stock/model/stock.dart';
import 'item.dart';

class Home extends StatelessWidget {
  final ValueNotifier<List<Stock>> recentlyAddedStocksNotifier =
      ValueNotifier<List<Stock>>([]);

  String getPresentDate() {
    DateTime now = DateTime.now();
    String formattedDate =
        "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year}";
    return formattedDate;
  }

  Future<void> loadRecentlyAddedStocks() async {
    Item item = Item();
    await item.loadStocks(); // Load the stocks

    recentlyAddedStocksNotifier.value =
        item.stocksNotifier.value.take(4).toList();
  }

  @override
  Widget build(BuildContext context) {
    loadRecentlyAddedStocks();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 216, 255),
        title: Text(
          "Hello,  Merchant !",
          style: GoogleFonts.acme(
              fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  elevation: 8,
                  color: const Color.fromARGB(255, 13, 5, 78),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.all(12.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Summary",
                                  style: GoogleFonts.acme(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                                const Spacer(),
                                const Row(
                                  children: [
                                    Icon(Icons.filter_alt, color: Colors.white),
                                    Text(
                                      "Today",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white),
                                    ),
                                    Icon(Icons.arrow_drop_down,
                                        color: Colors.white),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Sold Quantities",
                                    style: GoogleFonts.acme(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Purchased Quantities",
                                    style: GoogleFonts.acme(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text('5',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('10',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Earning (₹)",
                                    style: GoogleFonts.acme(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Spending (₹)",
                                    style: GoogleFonts.acme(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text('50',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('100',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 20, 0),
              child: Row(
                children: [
                  Text(
                    "Recently Added Stocks",
                    style: GoogleFonts.acme(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.calendar_month_sharp),
                  Text(
                    "${getPresentDate()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder<List<Stock>>(
                valueListenable: recentlyAddedStocksNotifier,
                builder: (context, stocks, _) {
                  return Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 0.470,
                    child: stocks.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                'asset/animation_lldglary.json',
                              ),
                              // SizedBox(height: 5),
                              const Text(
                                'No recently added stocks!',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )
                        : ListView.builder(
                            itemCount: stocks.length,
                            itemBuilder: (context, index) {
                              Stock stock = stocks[index];
                              return Padding(
                                padding: const EdgeInsets.all(5),
                                child: Card(
                                  elevation: 10,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  child: ListTile(
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        image: stock.imagePath != null
                                            ? DecorationImage(
                                                image: FileImage(
                                                    File(stock.imagePath!)),
                                                fit: BoxFit.cover,
                                              )
                                            : null,
                                      ),
                                    ),
                                    title: Text(
                                      stock.itemname ?? '',
                                      style: GoogleFonts.acme(
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    ),
                                    subtitle: Text(
                                      stock.stallNo ?? '',
                                      style: GoogleFonts.acme(
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Detail(stock: stock),
                                        ),
                                      );
                                    },
                                    shape: Border.all(),
                                  ),
                                ),
                              );
                            },
                          ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 222, 228, 255),
    );
  }
}
