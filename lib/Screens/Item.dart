import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock/Screens/Sub%20Screens/Detail.dart';

class item extends StatefulWidget {
  const item({Key? key}) : super(key: key);

  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {
  final List<String> itemsList = [
    'Product Name1',
    'Product Name2',
    'Product Name3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                hintText: 'Search item Name...',
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itemsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      Card(
                        elevation: 10,
                        child: ListTile(
                          leading:Container(
                      height: 50,
                      width: 50,
                      color: Color.fromARGB(255, 128, 69, 255),
                    ),
                          title: Text(itemsList[index]),
                          subtitle: Text(
                            "Stall",
                            style: TextStyle(color: Color.fromARGB(255, 0, 255, 4)),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => detail()),
                            );
                          },
                          shape: Border.all(),
                          trailing: Text(
                            '5',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 255, 0, 0),
                            ),
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
