//yapım aşamasında...

import 'package:flutter/material.dart';
import 'package:milat/kayitlar.dart';

class TalonMekanik extends StatefulWidget {
  final String controllerName;
  final String selectedOption;

  const TalonMekanik({
    super.key,
    required this.controllerName,
    required this.selectedOption,
  });

  @override
  State<TalonMekanik> createState() => _TalonMekanikState();
}

class _TalonMekanikState extends State<TalonMekanik> {
  

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
          "Talon Mekanik Görev Listesi",
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