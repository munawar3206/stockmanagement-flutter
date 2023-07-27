import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class term extends StatelessWidget {
  const term({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 216, 255),
        elevation: 0,
        title: Text(
          'Terms & Conditions',
          style: GoogleFonts.acme(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Color.fromARGB(255, 222, 228, 255),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                  '''      The user can perform various actions related to inventory management, such as:\n\n
1.Viewing Inventory: Users can see the current stock levels, product details, and other relevant information about the inventory items.\n\n
2.Adding New Items: Users may add new products to the inventory, specifying details like product name, description, quantity, price, etc. \n\n
3. Editing Existing Items: Users can modify the information of existing inventory items, such as updating stock quantities, changing product details, or adjusting prices. \n\n 
5.Generating Reports: Users may generate reports that provide insights into inventory levels, sales performance, and other relevant metrics.\n\n
6.Analyzing Data: Users can analyze inventory data to make informed decisions, such as identifying popular products or detecting slow-moving items.''',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text(
                ' App Updates and Modifications',
                style: GoogleFonts.acme(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
