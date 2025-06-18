import 'package:flutter/material.dart';
import 'package:milat/giris.dart';
import 'package:milat/kayitlar.dart';
import 'package:milat/mira_e.dart';
import 'package:milat/mira_m.dart';
import 'package:milat/mira_y.dart';
import 'package:milat/orka_e.dart';
import 'package:milat/orka_m.dart';
import 'package:milat/orka_y.dart';
import 'package:milat/talon_e.dart';
import 'package:milat/talon_m.dart';
import 'package:milat/talon_y.dart';

class Araclar extends StatefulWidget {
  final String controllerName;
  final String selectedOption;

  const Araclar(
      {super.key, required this.controllerName, required this.selectedOption});

  @override
  State<Araclar> createState() => _AraclarState();
}

class _AraclarState extends State<Araclar> {
  final Map<String, bool> _imageLoadedStatus = {
    'assets/images/orka.jpg': false,
    'assets/images/mira.jpg': false,
    'assets/images/talon.jpg': false,
  };

  Widget _buildImageWithManualLoading(String imagePath) {
    return CircleAvatar(
      radius: 100,
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (!_imageLoadedStatus[imagePath]!)
                const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      _imageLoadedStatus[imagePath] = true;
                    });
                  });
                  return const Icon(
                    Icons.broken_image,
                    color: Colors.red,
                    size: 50,
                  );
                },
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded || frame != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (!_imageLoadedStatus[imagePath]!) {
                        setState(() {
                          _imageLoadedStatus[imagePath] = true;
                        });
                      }
                    });
                  }
                  return child;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

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
                if (widget.selectedOption == "Mekanik") {
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
                } else if (widget.selectedOption == "Yazılım") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrkaYazilim(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: _buildImageWithManualLoading('assets/images/orka.jpg'),
                  ),
                  const SizedBox(width: 40),
                  const Text(
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
                if (widget.selectedOption == "Mekanik") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MiraMekanik(
                            controllerName: widget.controllerName,
                            selectedOption: widget.selectedOption)),
                  );
                } else if (widget.selectedOption == "Elektronik") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MiraElektronik(
                            controllerName: widget.controllerName,
                            selectedOption: widget.selectedOption)),
                  );
                } else if (widget.selectedOption == "Yazılım") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MiraYazilim(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: _buildImageWithManualLoading('assets/images/mira.jpg'),
                  ),
                  const SizedBox(width: 40),
                  const Text(
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
                if (widget.selectedOption == "Mekanik") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TalonMekanik(
                            controllerName: widget.controllerName,
                            selectedOption: widget.selectedOption)),
                  );
                } else if (widget.selectedOption == "Elektronik") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TalonElektronik(
                            controllerName: widget.controllerName,
                            selectedOption: widget.selectedOption)),
                  );
                } else if (widget.selectedOption == "Yazılım") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TalonYazilim(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: _buildImageWithManualLoading('assets/images/talon.jpg'),
                  ),
                  const SizedBox(width: 40),
                  const Text(
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
