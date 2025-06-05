import 'package:flutter/material.dart';
import 'package:milat1453/giris.dart';
import 'package:milat1453/kayitlar.dart';
import 'package:milat1453/orka_e.dart';
import 'package:milat1453/orka_m.dart';

class Araclar extends StatefulWidget {
  final String controllerName;
  final String selectedOption;

  const Araclar(
      {super.key, required this.controllerName, required this.selectedOption});

  @override
  State<Araclar> createState() => _AraclarState();
}

class _AraclarState extends State<Araclar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.power_settings_new),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Giris()),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "HAVA ARACI SEÇİMİ",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.library_books_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Kayitlar()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if (widget.selectedOption == "Yazılım") {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.white,
                      title: const Text("Milat 1453"),
                      content: const Text("Yakında..."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Tamam",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (widget.selectedOption == "Mekanik") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrkaMekanik(
                            controllerName: widget.controllerName,
                            selectedOption: widget.selectedOption)),
                  );
                } else if (widget.selectedOption == "Elektronik") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrkaElektronik(
                            controllerName: widget.controllerName,
                            selectedOption: widget.selectedOption)),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Giris()),
                  );
                }
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/images/orka.jpg'),
                    ),
                  ),
                  SizedBox(width: 40),
                  Text(
                    "Orka",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text("Milat 1453"),
                    content: const Text("Yakında..."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Tamam",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/images/mira.jpg'),
                    ),
                  ),
                  SizedBox(width: 40),
                  Text(
                    "Mira",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text("Milat 1453"),
                    content: const Text("Yakında..."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Tamam",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/images/talon.jpg'),
                    ),
                  ),
                  SizedBox(width: 40),
                  Text(
                    "Talon",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
