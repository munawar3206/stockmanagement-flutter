import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock/Screens/Sub%20Screens/account.dart';
import 'package:stock/Screens/Sub%20Screens/term.dart';


class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  final List<ItemData> itemsList = [
    ItemData(Icons.account_circle, 'Account'),
    ItemData(Icons.notes, 'Terms and Conditions'),
    ItemData(Icons.feedback, 'Send Feedback'),
    ItemData(Icons.restore, 'Reset App'),
    ItemData(Icons.star, 'Rate App'),
    ItemData(Icons.exit_to_app, 'Exit'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 207, 216, 255),
        title: Text(
          "Settings",
          style: GoogleFonts.acme(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 222, 228, 255),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemCount: itemsList.length,
            separatorBuilder: (context, index) => Divider(
              color: Color.fromARGB(255, 177, 190, 251),
              thickness: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              final ItemData pages = itemsList[index];
              return Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        pages.icon,
                        color: Colors.black,
                      ),
                      title: Text(
                        pages.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onTap: () {
                        _handleItemTap(pages);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _handleItemTap(ItemData pages) {
    switch (pages.name) {
      case 'Account':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => account()),
        );
        break;
      case 'Terms and Conditions':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => term()),
        );
        break;
      
      default:
        break;
    }
  }
}

class ItemData {
  final IconData icon;
  final String name;

  ItemData(this.icon, this.name);
}