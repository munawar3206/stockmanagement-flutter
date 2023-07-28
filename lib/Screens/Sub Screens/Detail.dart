import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock/Screens/Item.dart';
import 'package:stock/Screens/Sub%20Screens/update.dart';

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
                Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => update()),
                            );
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
              leading: Container(
                height: 50,
                width: 50,
                color: Color.fromARGB(255, 147, 91, 244),
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
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        MaterialButton(
  color: const Color.fromARGB(255, 0, 0, 255),
  onPressed: () {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            const Text("Select Quantity"),
            SizedBox(
              width: 50,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  icon: Icon(Icons.close),
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            )
          ],
        ),
        content: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              color: Color.fromARGB(255, 155, 49, 221),
            ),
            SizedBox(width: 10),
            Text("Pen"),
            Spacer(),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                  
                  },
                  icon: Icon(Icons.remove),
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                SizedBox(width: 10),
                Text(
                  "1", 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                 
                  },
                  icon: Icon(Icons.add),
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            )
          ],
        ),
        actions: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 0, 0, 255),
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
      Icon(
        Icons.system_update_alt_outlined,
        color: Colors.white,
      ),
      const SizedBox(width: 18),
      Text(
        "UPDATED STOCK",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ],
  ),
)
      ]),
    );
  }
}
