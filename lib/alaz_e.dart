import 'package:flutter/material.dart';
import 'package:milat/kayitlar.dart';

class AlazElektronik extends StatefulWidget {
  final String controllerName;
  final String selectedOption;

  const AlazElektronik({
    super.key,
    required this.controllerName,
    required this.selectedOption,
  });

  @override
  State<AlazElektronik> createState() => _AlazElektronikState();
}

class _AlazElektronikState extends State<AlazElektronik> {
  

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
          "Alaz Elektronik Görev Listesi",
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