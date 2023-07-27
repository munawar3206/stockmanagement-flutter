import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock/Screens/Item.dart';


class detail extends StatefulWidget {
  const detail({super.key});

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 216, 255),
        elevation: 0,
        title: Text(
          "Item Details",
          style: GoogleFonts.acme(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete),
              ),
              IconButton(onPressed: () {
                 
              }, icon: Icon(Icons.edit)),
              SizedBox(height: 10),
            ],
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 222, 228, 255),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
              ),
              title: Row(
                children: [
                  Text('Pen'),
                ],
              ),
              subtitle: Text('Price: '),
               trailing: Text(
                
                            '5',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Row(
                  children: [
                    const Text("Select Quantity"),
                    SizedBox(
                      width: 90,
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: () {
                         Navigator.of(ctx).pop();

                        }, icon: Icon(Icons.close),color: Colors.black,),
                      ],
                    )
                  ],
                ),
                content: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Name"),
                
                    
                  ],
                  
                ),
                actions: <Widget>[
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 0, 64, 255),
                      ),
                      child: const Text(
                        "OK",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          child: Column(
            children: [
              Icon(Icons.system_update_alt_outlined),
              const SizedBox(width: 18),
              const Text("UPDATED STOCK"),
            ],
          ),
        )
      ]),
    );
  }
}
