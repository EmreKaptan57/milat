import 'package:flutter/material.dart';
import 'package:milat1453/araclar.dart';
import 'package:milat1453/kayitlar.dart';

class Giris extends StatefulWidget {
  const Giris({super.key});

  @override
  State<Giris> createState() => _GirisState();
}

class _GirisState extends State<Giris> {
  String? selectedOption;
  final List<String> options = ['Mekanik', 'Elektronik', 'Yazılım'];
  final TextEditingController controllerName = TextEditingController();

  void _validateAndProceed() {
    if (controllerName.text.isEmpty || selectedOption == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("Eksik Bilgi"),
          content: const Text("Lütfen tüm alanları doldurun."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Tamam",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Araclar(
              controllerName: controllerName.text,
              selectedOption: selectedOption!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Center(
          // İçeriği yatayda ortalamak için Center ekleniyor
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Yatayda ortalamak için
            children: <Widget>[
              const CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage('assets/images/milat.jpg'),
              ),
              const SizedBox(height: 20),
              const Text(
                "MİLAT 1453 AR-GE TOPLULUĞU",
                textAlign: TextAlign.center, // Metin ortalanıyor
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: TextField(
                    controller: controllerName,
                    cursorColor: Colors.blue,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      labelText: "Kontrolcü İsmi",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Birimi",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                    dropdownColor: Colors.white,
                    iconEnabledColor: Colors.black,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    value: selectedOption,
                    items: options
                        .map(
                          (option) => DropdownMenuItem(
                            value: option,
                            child: Text(
                              option,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: _validateAndProceed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    "GİRİŞ YAP",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
