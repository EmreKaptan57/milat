import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:milat1453/araclar.dart';
import 'package:milat1453/kayitlar.dart';

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
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  final TextEditingController _noteController1 = TextEditingController();
  final TextEditingController _noteController2 = TextEditingController();
  final TextEditingController _noteController3 = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCheckboxState();
    _loadNotes();
  }

  Future<void> fetchData() async {
    int retryCount = 3;
    while (retryCount > 0) {
      try {
        var data =
            await FirebaseFirestore.instance.collection('collectionName').get();
        print(data.docs);
        break;
      } catch (e) {
        print("Firestore Hatası: $e");
        retryCount--;
        await Future.delayed(Duration(seconds: 2));
      }
    }
  }

  Future<void> sendTestData() async {
    try {
      await FirebaseFirestore.instance.collection('testData').add({
        'name': 'Test User',
        'timestamp': FieldValue.serverTimestamp(),
      });
      print("Veri başarıyla gönderildi!");
    } catch (e) {
      print("Hata oluştu: $e");
    }
  }

  Future<void> _loadCheckboxState() async {
    try {
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc('userId');
      final docSnapshot = await userDoc.get();
      if (docSnapshot.exists) {
        setState(() {
          isChecked1 = docSnapshot['isChecked1'] ?? false;
          isChecked2 = docSnapshot['isChecked2'] ?? false;
          isChecked3 = docSnapshot['isChecked3'] ?? false;
        });
      }
    } catch (e) {
      print("Hata oluştu: $e");
      Fluttertoast.showToast(
        msg: "Veri yüklenirken bir hata oluştu: $e",
        toastLength: Toast.LENGTH_LONG,
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _saveCheckboxState() async {
    final userDoc =
        FirebaseFirestore.instance.collection('users').doc('userId');
    await userDoc.set({
      'isChecked1': isChecked1,
      'isChecked2': isChecked2,
      'isChecked3': isChecked3,
      'note1': _noteController1.text,
      'note2': _noteController2.text,
      'note3': _noteController3.text,
    }, SetOptions(merge: true));
  }

  Future<void> _loadNotes() async {
    final userDoc =
        FirebaseFirestore.instance.collection('users').doc('userId');
    final docSnapshot = await userDoc.get();
    if (docSnapshot.exists) {
      setState(() {
        _noteController1.text = docSnapshot['note1'] ?? '';
        _noteController2.text = docSnapshot['note2'] ?? '';
        _noteController3.text = docSnapshot['note3'] ?? '';
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _saveHistory() async {
    String timestamp = DateTime.now().toString();
    String historyEntry =
        "Kontrolcü İsmi: ${widget.controllerName}\nBirimi: ${widget.selectedOption}\nTarih: $timestamp\nGörev 1: $isChecked1, Görev 2: $isChecked2, Görev 3: $isChecked3\nNotlar: 1: ${_noteController1.text}, 2: ${_noteController2.text}, 3: ${_noteController3.text}, ";

    final historyDoc =
        FirebaseFirestore.instance.collection('history').doc('historyId');
    await historyDoc.set({
      'history': FieldValue.arrayUnion([historyEntry]),
    }, SetOptions(merge: true));
  }

  void _showSaveConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Emin misiniz?"),
        content: Text("Verileri kaydetmek istediğinizden emin misiniz?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Hayır"),
          ),
          TextButton(
            onPressed: () async {
              await _saveCheckboxState();
              await _saveHistory();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Araclar(
                    controllerName: widget.controllerName,
                    selectedOption: widget.selectedOption,
                  ),
                ),
              );
              Fluttertoast.showToast(
                msg: "Başarı ile kaydedildi",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            },
            child: Text("Evet"),
          ),
        ],
      ),
    );
  }

  void _openNoteDialog(TextEditingController controller) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Not"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "Notunuzu buraya girin"),
          maxLines: 1,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Tamam"),
          ),
        ],
      ),
    );
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.blue,
                          value: isChecked1,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked1 = value ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _openNoteDialog(_noteController1);
                            },
                            child: Text(
                              "Mira Yazılım ile ilgili yapılacak iş",
                              style: TextStyle(
                                  fontSize: 16,
                                  decoration: isChecked1
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.blue,
                          value: isChecked2,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked2 = value ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _openNoteDialog(_noteController2);
                            },
                            child: Text(
                              "Mira Yazılım ile test işlemleri",
                              style: TextStyle(
                                  fontSize: 16,
                                  decoration: isChecked2
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.blue,
                          value: isChecked3,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked3 = value ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _openNoteDialog(_noteController3);
                            },
                            child: Text(
                              "Raporlama yapılacak",
                              style: TextStyle(
                                  fontSize: 16,
                                  decoration: isChecked3
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 350,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _showSaveConfirmationDialog,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text(
                          "KAYDET",
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
