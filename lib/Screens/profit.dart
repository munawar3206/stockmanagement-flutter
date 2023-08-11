import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:stock/model/stock.dart';

class Profit extends StatefulWidget {
  const Profit({Key? key}) : super(key: key);

  @override
  State<Profit> createState() => _ProfitState();
}

class _ProfitState extends State<Profit> {
  final List<Stock> ProfitsList = [];
  final Box<Stock> _stockBox = Hive.box<Stock>('stockbox');

  @override
  void initState() {
    super.initState();
    loadProfit();
  }

  void loadProfit() {
    ProfitsList.addAll(_stockBox.values.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 207, 216, 255),
        title: Text(
          "Profit",
          style: GoogleFonts.acme(
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 222, 228, 255),
      body: Column(
        children: [
          Expanded(
            child: Card(
              child: ListView.builder(
                itemCount: ProfitsList.length,
                itemBuilder: (BuildContext context, int index) {
                  final stock = ProfitsList[index];
                  final int openingstock = stock.openingStock ?? 0;
                  final int sellingPrice = stock.sellingPrice ?? 0;
                  final int costPrice = stock.costPrice ?? 0;
                  final int totalProfit =
                      openingstock * sellingPrice - (openingstock * costPrice);
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Color.fromARGB(255, 190, 209, 246),
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
                            // trailing:
                            title: Text(
                              stock.itemname!,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                            subtitle: Text('$totalProfit'),
                            textColor: Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
