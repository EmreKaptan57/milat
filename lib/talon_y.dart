//yapım aşamasında...

import 'package:flutter/material.dart';
import 'package:milat/kayitlar.dart';

class TalonYazilim extends StatefulWidget {
  final String controllerName;
  final String selectedOption;

  const TalonYazilim({
    super.key,
    required this.controllerName,
    required this.selectedOption,
  });

  @override
  State<TalonYazilim> createState() => _TalonYazilimState();
}

class _TalonYazilimState extends State<TalonYazilim> {
  

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        title: const Text(
          "Talon Yazılım Görev Listesi",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Kayitlar()),
              );
            },
            icon: const Icon(Icons.library_books_outlined),
          )
        ],
      ),
      body: Center(
              child: Text("Yakında..."),
            ),
    );
  }
}