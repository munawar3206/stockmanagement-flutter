import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 216, 255),
        title: Text(
          'About',
          style: GoogleFonts.acme(
              fontWeight: FontWeight.bold, color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 222, 228, 255),
      body: SingleChildScrollView(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  '''         Welcome to InventoWare, a powerful and comprehensive inventory stock management application developed by Munawar.With a mission to simplify inventory control for businesses of all sizes, InventoWare offers an array of advanced features to streamline your inventory processes, optimize stock levels, and enhance overall efficiency.''',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 0, 255)),
                ),
                Text(
                  ''' \n\nInternship Experience at Bridgeon Solution Kakkanchery,Malappuram:
During my internship at Bridgeon Solution Kakkanchery, I had the privilege of honing my skills in inventory stock management and gaining hands-on experience in implementing cutting-edge solutions. Working alongside talented mentors and peers, I was exposed to the latest industry practices, which have greatly influenced the development of InventoWare. It was an enriching experience that helped me refine my expertise and passion for revolutionizing inventory management.''',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 8, 33, 255)),
                ),
                Text(
                  '''\n\nStay Connected with Munawar:
      
LinkedIn: 
Instagram: 
GitHub: 
Email: 
Website:
      
Feel free to reach out to me through any of these channels. I'm always open to connecting with fellow professionals, collaborators, and enthusiasts. Let's build a vibrant network and share our passion for inventory stock management and technology! Looking forward to connecting with you soon.
InventoWare is committed to empowering businesses to thrive by offering an all-in-one inventory management solution that saves time, reduces costs, and boosts productivity. Whether you are a small business owner or part of a large enterprise, join the InventoWare community today and experience the seamless and hassle-free way to manage your inventory efficiently. Let's embark on this transformative journey together!''',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 68, 0, 255)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}