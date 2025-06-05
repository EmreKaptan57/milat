import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:milat1453/araclar.dart';
import 'package:milat1453/kayitlar.dart';

class OrkaMekanik extends StatefulWidget {
  final String controllerName;
  final String selectedOption;

  const OrkaMekanik({
    super.key,
    required this.controllerName,
    required this.selectedOption,
  });

  @override
  State<OrkaMekanik> createState() => _OrkaMekanikState();
}

class _OrkaMekanikState extends State<OrkaMekanik> {
  bool isChecked1 = false;
  bool isChecked2_1 = false;
  bool isChecked2_2 = false;
  bool isChecked2_3 = false;
  bool isChecked2_4 = false;
  bool isChecked2_5 = false;
  bool isChecked2_6 = false;
  bool isChecked2_7 = false;
  bool isChecked2_8 = false;
  bool isChecked2_9 = false;
  bool isChecked3 = false;
  bool isChecked4_1 = false;
  bool isChecked4_2 = false;
  bool isChecked4_3 = false;
  bool isChecked5 = false;
  bool isChecked6_1 = false;
  bool isChecked6_2 = false;
  bool isChecked6_3 = false;
  bool isChecked6_4 = false;
  bool isChecked7 = false;
  bool isChecked8 = false;
  bool isChecked9 = false;
  bool isChecked10 = false;
  bool isChecked11 = false;
  bool isChecked12 = false;
  bool isChecked13 = false;
  bool isChecked14 = false;
  bool isChecked15 = false;
  bool isChecked16 = false;
  bool isChecked17 = false;
  bool isChecked18 = false;
  bool isChecked19 = false;
  bool isChecked20 = false;
  bool isChecked21 = false;
  bool isChecked22_1 = false;
  bool isChecked22_2 = false;
  bool isChecked22_3 = false;
  bool isChecked22_4 = false;
  bool isChecked22_5_1 = false;
  bool isChecked22_5_2 = false;
  bool isChecked22_5_3 = false;
  bool isChecked22_5_4 = false;
  bool isChecked22_6 = false;
  bool isChecked23 = false;

  final TextEditingController _noteController1 = TextEditingController();
  final TextEditingController _noteController2_1 = TextEditingController();
  final TextEditingController _noteController2_2 = TextEditingController();
  final TextEditingController _noteController2_3 = TextEditingController();
  final TextEditingController _noteController2_4 = TextEditingController();
  final TextEditingController _noteController2_5 = TextEditingController();
  final TextEditingController _noteController2_6 = TextEditingController();
  final TextEditingController _noteController2_7 = TextEditingController();
  final TextEditingController _noteController2_8 = TextEditingController();
  final TextEditingController _noteController2_9 = TextEditingController();
  final TextEditingController _noteController3 = TextEditingController();
  final TextEditingController _noteController4_1 = TextEditingController();
  final TextEditingController _noteController4_2 = TextEditingController();
  final TextEditingController _noteController4_3 = TextEditingController();
  final TextEditingController _noteController5 = TextEditingController();
  final TextEditingController _noteController6_1 = TextEditingController();
  final TextEditingController _noteController6_2 = TextEditingController();
  final TextEditingController _noteController6_3 = TextEditingController();
  final TextEditingController _noteController6_4 = TextEditingController();
  final TextEditingController _noteController7 = TextEditingController();
  final TextEditingController _noteController8 = TextEditingController();
  final TextEditingController _noteController9 = TextEditingController();
  final TextEditingController _noteController10 = TextEditingController();
  final TextEditingController _noteController11 = TextEditingController();
  final TextEditingController _noteController12 = TextEditingController();
  final TextEditingController _noteController13 = TextEditingController();
  final TextEditingController _noteController14 = TextEditingController();
  final TextEditingController _noteController15 = TextEditingController();
  final TextEditingController _noteController16 = TextEditingController();
  final TextEditingController _noteController17 = TextEditingController();
  final TextEditingController _noteController18 = TextEditingController();
  final TextEditingController _noteController19 = TextEditingController();
  final TextEditingController _noteController20 = TextEditingController();
  final TextEditingController _noteController21 = TextEditingController();
  final TextEditingController _noteController22_1 = TextEditingController();
  final TextEditingController _noteController22_2 = TextEditingController();
  final TextEditingController _noteController22_3 = TextEditingController();
  final TextEditingController _noteController22_4 = TextEditingController();
  final TextEditingController _noteController22_5_1 = TextEditingController();
  final TextEditingController _noteController22_5_2 = TextEditingController();
  final TextEditingController _noteController22_5_3 = TextEditingController();
  final TextEditingController _noteController22_5_4 = TextEditingController();
  final TextEditingController _noteController22_6 = TextEditingController();
  final TextEditingController _noteController23 = TextEditingController();
  List<String> historyList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCheckboxState();
    _loadNotes();
  }

  Future<void> _loadCheckboxState() async {
    try {
      final userDoc =
          FirebaseFirestore.instance.collection('usersOM').doc('userOMId');
      final docSnapshot = await userDoc.get();
      if (docSnapshot.exists) {
        setState(() {
          isChecked1 = docSnapshot['isChecked1'] ?? false;
          isChecked2_1 = docSnapshot['isChecked2_1'] ?? false;
          isChecked2_2 = docSnapshot['isChecked2_2'] ?? false;
          isChecked2_3 = docSnapshot['isChecked2_3'] ?? false;
          isChecked2_4 = docSnapshot['isChecked2_4'] ?? false;
          isChecked2_5 = docSnapshot['isChecked2_5'] ?? false;
          isChecked2_6 = docSnapshot['isChecked2_6'] ?? false;
          isChecked2_7 = docSnapshot['isChecked2_7'] ?? false;
          isChecked2_8 = docSnapshot['isChecked2_8'] ?? false;
          isChecked2_9 = docSnapshot['isChecked2_9'] ?? false;
          isChecked3 = docSnapshot['isChecked3'] ?? false;
          isChecked4_1 = docSnapshot['isChecked4_1'] ?? false;
          isChecked4_2 = docSnapshot['isChecked4_2'] ?? false;
          isChecked4_3 = docSnapshot['isChecked4_3'] ?? false;
          isChecked5 = docSnapshot['isChecked5'] ?? false;
          isChecked6_1 = docSnapshot['isChecked6_1'] ?? false;
          isChecked6_2 = docSnapshot['isChecked6_2'] ?? false;
          isChecked6_3 = docSnapshot['isChecked6_3'] ?? false;
          isChecked6_4 = docSnapshot['isChecked6_4'] ?? false;
          isChecked7 = docSnapshot['isChecked7'] ?? false;
          isChecked8 = docSnapshot['isChecked8'] ?? false;
          isChecked9 = docSnapshot['isChecked9'] ?? false;
          isChecked10 = docSnapshot['isChecked10'] ?? false;
          isChecked11 = docSnapshot['isChecked11'] ?? false;
          isChecked12 = docSnapshot['isChecked12'] ?? false;
          isChecked13 = docSnapshot['isChecked13'] ?? false;
          isChecked14 = docSnapshot['isChecked14'] ?? false;
          isChecked15 = docSnapshot['isChecked15'] ?? false;
          isChecked16 = docSnapshot['isChecked16'] ?? false;
          isChecked17 = docSnapshot['isChecked17'] ?? false;
          isChecked18 = docSnapshot['isChecked18'] ?? false;
          isChecked19 = docSnapshot['isChecked19'] ?? false;
          isChecked20 = docSnapshot['isChecked20'] ?? false;
          isChecked21 = docSnapshot['isChecked21'] ?? false;
          isChecked22_1 = docSnapshot['isChecked22_1'] ?? false;
          isChecked22_2 = docSnapshot['isChecked22_2'] ?? false;
          isChecked22_3 = docSnapshot['isChecked22_3'] ?? false;
          isChecked22_4 = docSnapshot['isChecked22_4'] ?? false;
          isChecked22_5_1 = docSnapshot['isChecked22_5_1'] ?? false;
          isChecked22_5_2 = docSnapshot['isChecked22_5_2'] ?? false;
          isChecked22_5_3 = docSnapshot['isChecked22_5_3'] ?? false;
          isChecked22_5_4 = docSnapshot['isChecked22_5_4'] ?? false;
          isChecked22_6 = docSnapshot['isChecked22_6'] ?? false;
          isChecked23 = docSnapshot['isChecked23'] ?? false;
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

  Future<void> _loadNotes() async {
    final userDoc =
        FirebaseFirestore.instance.collection('usersOM').doc('userOMId');
    final docSnapshot = await userDoc.get();
    if (docSnapshot.exists) {
      setState(() {
        _noteController1.text = docSnapshot['note1'] ?? '';
        _noteController2_1.text = docSnapshot['note2_1'] ?? '';
        _noteController2_2.text = docSnapshot['note2_2'] ?? '';
        _noteController2_3.text = docSnapshot['note2_3'] ?? '';
        _noteController2_4.text = docSnapshot['note2_4'] ?? '';
        _noteController2_5.text = docSnapshot['note2_5'] ?? '';
        _noteController2_6.text = docSnapshot['note2_6'] ?? '';
        _noteController2_7.text = docSnapshot['note2_7'] ?? '';
        _noteController2_8.text = docSnapshot['note2_8'] ?? '';
        _noteController2_9.text = docSnapshot['note2_9'] ?? '';
        _noteController3.text = docSnapshot['note3'] ?? '';
        _noteController4_1.text = docSnapshot['note4_1'] ?? '';
        _noteController4_2.text = docSnapshot['note4_2'] ?? '';
        _noteController4_3.text = docSnapshot['note4_3'] ?? '';
        _noteController5.text = docSnapshot['note5'] ?? '';
        _noteController6_1.text = docSnapshot['note6_1'] ?? '';
        _noteController6_2.text = docSnapshot['note6_2'] ?? '';
        _noteController6_3.text = docSnapshot['note6_3'] ?? '';
        _noteController6_4.text = docSnapshot['note6_4'] ?? '';
        _noteController7.text = docSnapshot['note7'] ?? '';
        _noteController8.text = docSnapshot['note8'] ?? '';
        _noteController9.text = docSnapshot['note9'] ?? '';
        _noteController10.text = docSnapshot['note10'] ?? '';
        _noteController11.text = docSnapshot['note11'] ?? '';
        _noteController12.text = docSnapshot['note12'] ?? '';
        _noteController13.text = docSnapshot['note13'] ?? '';
        _noteController14.text = docSnapshot['note14'] ?? '';
        _noteController15.text = docSnapshot['note15'] ?? '';
        _noteController16.text = docSnapshot['note16'] ?? '';
        _noteController17.text = docSnapshot['note17'] ?? '';
        _noteController18.text = docSnapshot['note18'] ?? '';
        _noteController19.text = docSnapshot['note19'] ?? '';
        _noteController20.text = docSnapshot['note20'] ?? '';
        _noteController21.text = docSnapshot['note21'] ?? '';
        _noteController22_1.text = docSnapshot['note22_1'] ?? '';
        _noteController22_2.text = docSnapshot['note22_2'] ?? '';
        _noteController22_3.text = docSnapshot['note22_3'] ?? '';
        _noteController22_4.text = docSnapshot['note22_4'] ?? '';
        _noteController22_5_1.text = docSnapshot['note22_5_1'] ?? '';
        _noteController22_5_2.text = docSnapshot['note22_5_2'] ?? '';
        _noteController22_5_3.text = docSnapshot['note22_5_3'] ?? '';
        _noteController22_5_4.text = docSnapshot['note22_5_4'] ?? '';
        _noteController22_6.text = docSnapshot['note22_6'] ?? '';
        _noteController23.text = docSnapshot['note23'] ?? '';
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _saveCheckboxState() async {
    final userDoc =
        FirebaseFirestore.instance.collection('usersOM').doc('userOMId');
    await userDoc.set({
      'isChecked1': isChecked1,
      'isChecked2_1': isChecked2_1,
      'isChecked2_2': isChecked2_2,
      'isChecked2_3': isChecked2_3,
      'isChecked2_4': isChecked2_4,
      'isChecked2_5': isChecked2_5,
      'isChecked2_6': isChecked2_6,
      'isChecked2_7': isChecked2_7,
      'isChecked2_8': isChecked2_8,
      'isChecked2_9': isChecked2_9,
      'isChecked3': isChecked3,
      'isChecked4_1': isChecked4_1,
      'isChecked4_2': isChecked4_2,
      'isChecked4_3': isChecked4_3,
      'isChecked5': isChecked5,
      'isChecked6_1': isChecked6_1,
      'isChecked6_2': isChecked6_2,
      'isChecked6_3': isChecked6_3,
      'isChecked6_4': isChecked6_4,
      'isChecked7': isChecked7,
      'isChecked8': isChecked8,
      'isChecked9': isChecked9,
      'isChecked10': isChecked10,
      'isChecked11': isChecked11,
      'isChecked12': isChecked12,
      'isChecked13': isChecked13,
      'isChecked14': isChecked14,
      'isChecked15': isChecked15,
      'isChecked16': isChecked16,
      'isChecked17': isChecked17,
      'isChecked18': isChecked18,
      'isChecked19': isChecked19,
      'isChecked20': isChecked20,
      'isChecked21': isChecked21,
      'isChecked22_1': isChecked22_1,
      'isChecked22_2': isChecked22_2,
      'isChecked22_3': isChecked22_3,
      'isChecked22_4': isChecked22_4,
      'isChecked22_5_1': isChecked22_5_1,
      'isChecked22_5_2': isChecked22_5_2,
      'isChecked22_5_3': isChecked22_5_3,
      'isChecked22_5_4': isChecked22_5_4,
      'isChecked22_6': isChecked22_6,
      'isChecked23': isChecked23,
      'note1': _noteController1.text,
      'note2_1': _noteController2_1.text,
      'note2_2': _noteController2_2.text,
      'note2_3': _noteController2_3.text,
      'note2_4': _noteController2_4.text,
      'note2_5': _noteController2_5.text,
      'note2_6': _noteController2_6.text,
      'note2_7': _noteController2_7.text,
      'note2_8': _noteController2_8.text,
      'note2_9': _noteController2_9.text,
      'note3': _noteController3.text,
      'note4_1': _noteController4_1.text,
      'note4_2': _noteController4_2.text,
      'note4_3': _noteController4_3.text,
      'note5': _noteController5.text,
      'note6_1': _noteController6_1.text,
      'note6_2': _noteController6_2.text,
      'note6_3': _noteController6_3.text,
      'note6_4': _noteController6_4.text,
      'note7': _noteController7.text,
      'note8': _noteController8.text,
      'note9': _noteController9.text,
      'note10': _noteController10.text,
      'note11': _noteController11.text,
      'note12': _noteController12.text,
      'note13': _noteController13.text,
      'note14': _noteController14.text,
      'note15': _noteController15.text,
      'note16': _noteController16.text,
      'note17': _noteController17.text,
      'note18': _noteController18.text,
      'note19': _noteController19.text,
      'note20': _noteController20.text,
      'note21': _noteController21.text,
      'note22_1': _noteController22_1.text,
      'note22_2': _noteController22_2.text,
      'note22_3': _noteController22_3.text,
      'note22_4': _noteController22_4.text,
      'note22_5_1': _noteController22_5_1.text,
      'note22_5_2': _noteController22_5_2.text,
      'note22_5_3': _noteController22_5_3.text,
      'note22_5_4': _noteController22_5_4.text,
      'note22_6': _noteController22_6.text,
      'note23': _noteController23.text,
    }, SetOptions(merge: true));
  }

  Future<void> _saveHistory() async {
    String timestamp = DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());
    String historyEntry =
        "Kontrolcü İsmi: ${widget.controllerName}\nBirimi: ${widget.selectedOption}\nTarih: $timestamp\n\nGörev 1: $isChecked1, Görev 2-1: $isChecked2_1, Görev 2-2: $isChecked2_2, Görev 2-3: $isChecked2_3, Görev 2-4: $isChecked2_4, Görev 2-5: $isChecked2_5, Görev 2-6: $isChecked2_6, Görev 2-7: $isChecked2_7, Görev 2-8: $isChecked2_8, Görev 2-9: $isChecked2_9,Görev 3: $isChecked3,Görev 4-1: $isChecked4_1, Görev 4-2: $isChecked4_2, Görev 4-3: $isChecked4_3,Görev 5: $isChecked5,Görev 6-1: $isChecked6_1, Görev 6-2: $isChecked6_2, Görev 6-3: $isChecked6_3, Görev 6-4: $isChecked6_4,Görev 7: $isChecked7,Görev 8: $isChecked8,Görev 9: $isChecked9,Görev 10: $isChecked10,Görev 11: $isChecked11,Görev 12: $isChecked12,Görev 13: $isChecked13,Görev 14: $isChecked14,Görev 15: $isChecked15,Görev 16: $isChecked16,Görev 17: $isChecked17,Görev 18: $isChecked18,Görev 19: $isChecked19,Görev 20: $isChecked20,Görev 21: $isChecked21,Görev 22-1: $isChecked22_1, Görev 22-2: $isChecked22_2, Görev 22-3: $isChecked22_3, Görev 22-4: $isChecked22_4, Görev 22-5-1: $isChecked22_5_1, Görev 22-5-2: $isChecked22_5_2, Görev 22-5-3: $isChecked22_5_3, Görev 22-5-4: $isChecked22_5_4, Görev 22-6: $isChecked22_6,Görev 23: $isChecked23.\nNotlar:1: ${_noteController1.text},2-1: ${_noteController2_1.text}, 2-2: ${_noteController2_2.text}, 2-3: ${_noteController2_3.text}, 2-4: ${_noteController2_4.text}, 2-5: ${_noteController2_5.text}, 2-6: ${_noteController2_6.text}, 2-7: ${_noteController2_7.text}, 2-8: ${_noteController2_8.text}, 2-9: ${_noteController2_9.text},3: ${_noteController3.text},4-1: ${_noteController4_1.text}, 4-2: ${_noteController4_2.text}, 4-3: ${_noteController4_3.text},5: ${_noteController5.text},6-1: ${_noteController6_1.text}, 6-2: ${_noteController6_2.text}, 6-3: ${_noteController6_3.text}, 6-4: ${_noteController6_4.text},7: ${_noteController7.text},8: ${_noteController8.text},9: ${_noteController9.text},10: ${_noteController10.text},11: ${_noteController11.text},12: ${_noteController12.text},13: ${_noteController13.text},14: ${_noteController14.text},15: ${_noteController15.text},16: ${_noteController16.text},17: ${_noteController17.text},18: ${_noteController18.text},19: ${_noteController19.text},20: ${_noteController20.text},21: ${_noteController21.text},22-1: ${_noteController22_1.text}, 22-2: ${_noteController22_2.text}, 22-3: ${_noteController22_3.text}, 22-4: ${_noteController22_4.text}, 22-5-1: ${_noteController22_5_1.text}, 22-5-2: ${_noteController22_5_2.text}, 22-5-3: ${_noteController22_5_3.text}, 22-5-4: ${_noteController22_5_4.text}, 22-6: ${_noteController22_6.text},23: ${_noteController23.text}.";
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
        backgroundColor: Colors.white,
        title: const Text("Emin misiniz?"),
        content: const Text("Verileri kaydetmek istediğinizden emin misiniz?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Hayır",
              style: TextStyle(color: Colors.black),
            ),
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
            child: const Text(
              "Evet",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  void _openNoteDialog(TextEditingController controller) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text("Not"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "Notunuzu buraya girin",
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          maxLines: 1,
        ),
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
          "Orka Mekanik Görev Listesi",
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
              child: Stack(
                children: [
                  SingleChildScrollView(
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
                                  "1. Lipo sabitliği kontrol edilecek. (Kelepçe ve ÇTB ile sabitleniyor.)",
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
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "2. Çift taraflı bantla sabitlenen elektroniksel komponentlerde oynama olup olmadığı kontrol edilecek.",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.blue,
                              value: isChecked2_1,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked2_1 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController1);
                                },
                                child: Text(
                                  "2.1. Alıcı",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked2_1
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
                              value: isChecked2_2,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked2_2 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController2_2);
                                },
                                child: Text(
                                  "2.2. Telemetri",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked2_2
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
                              value: isChecked2_3,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked2_3 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController2_3);
                                },
                                child: Text(
                                  "2.3. Pixhawk",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked2_3
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
                              value: isChecked2_4,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked2_4 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController2_4);
                                },
                                child: Text(
                                  "2.4. GPS",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked2_4
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
                              value: isChecked2_5,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked2_5 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController2_5);
                                },
                                child: Text(
                                  "2.5. Güç modülü",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked2_5
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
                              value: isChecked2_6,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked2_6 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController2_6);
                                },
                                child: Text(
                                  "2.6. Buzzer",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked2_6
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
                              value: isChecked2_7,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked2_7 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController2_7);
                                },
                                child: Text(
                                  "2.7. Safety switch",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked2_7
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
                              value: isChecked2_8,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked2_8 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController2_8);
                                },
                                child: Text(
                                  "2.8. USB port",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked2_8
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
                              value: isChecked2_9,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked2_9 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController2_9);
                                },
                                child: Text(
                                  "2.9. DC Converter",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked2_9
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
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
                                  "3. Kablo tutucular ve kablo çorapları sabitlenmesine bakılacak.",
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
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "4. Vidaların tamamının sıkılmış olduğuna bakılacak.",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.blue,
                              value: isChecked4_1,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked4_1 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController4_1);
                                },
                                child: Text(
                                  "4.1. Sol şaside 59",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked4_1
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
                              value: isChecked4_2,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked4_2 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController4_2);
                                },
                                child: Text(
                                  "4.2. Sağ şaside 49",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked4_2
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
                              value: isChecked4_3,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked4_3 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController4_3);
                                },
                                child: Text(
                                  "4.3. Stabilizerda 5",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked4_3
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.blue,
                              value: isChecked5,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked5 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController5);
                                },
                                child: Text(
                                  "5. 32 adet aralayıcıların hepsinin takılı olduğu kontrol edilecek.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked5
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "6. Yakıt borusunun takılı olup olmadığı kontrol edilecek.",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.blue,
                              value: isChecked6_1,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked6_1 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController6_1);
                                },
                                child: Text(
                                  "6.1. Karbüratör",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked6_1
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
                              value: isChecked6_2,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked6_2 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController6_2);
                                },
                                child: Text(
                                  "6.2. Egzoz",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked6_2
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
                              value: isChecked6_3,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked6_3 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController6_3);
                                },
                                child: Text(
                                  "6.3. Yakıt İkmal",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked6_3
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
                              value: isChecked6_4,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked6_4 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController6_4);
                                },
                                child: Text(
                                  "6.4. Bu borunun sabitleme aparatına takılı olduğu teyit edilecek.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked6_4
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.blue,
                              value: isChecked7,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7);
                                },
                                child: Text(
                                  "7. Yakıt deposu süngerleri sabitliği ve oynama olup olmadığına bakılacak.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7
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
                              value: isChecked8,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked8 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController8);
                                },
                                child: Text(
                                  "8. Egzoz ve motor bağlantısı düzgünlüğüne bakılacak.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked8
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
                              value: isChecked9,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked9 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController9);
                                },
                                child: Text(
                                  "9. Motor needle ayarından emin olunacak (High needle 2 tur, Middle needle 1 tur)",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked9
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
                              value: isChecked10,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked10 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController10);
                                },
                                child: Text(
                                  "10. Bujinin çalıştığı kontrol edilecek.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked10
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
                              value: isChecked11,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked11 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController11);
                                },
                                child: Text(
                                  "11. Kullanılacak olan buji ısıtıcısının çalışıp çalışmadığı, pilinin doluluğu kontrol edilecek.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked11
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
                              value: isChecked12,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked12 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController12);
                                },
                                child: Text(
                                  "12. Motora buji takılacak.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked12
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
                              value: isChecked13,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked13 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController13);
                                },
                                child: Text(
                                  "13. Egzoz ile motor arasındaki metal plaka takılı olmasına bakılacak.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked13
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
                              value: isChecked15,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked15 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController15);
                                },
                                child: Text(
                                  "15. Havalandırmanın motora çarpmadığı kontrol edilecek ve sabitlenmesine bakılacak.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked15
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
                              value: isChecked16,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked16 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController16);
                                },
                                child: Text(
                                  "16. Ana pal ve kuyruk pallerinin takılış yönleri kontrol edilecek.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked16
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
                              value: isChecked17,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked17 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController17);
                                },
                                child: Text(
                                  "17. İniş takımları sağlamlığı ve sabitliği kontrol edilecek.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked17
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
                              value: isChecked18,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked18 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController18);
                                },
                                child: Text(
                                  "18. Stabilizer ve kuyruk pervanesinin düz bir açıda olması kontrol edilecek.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked18
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
                              value: isChecked19,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked19 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController19);
                                },
                                child: Text(
                                  "19. Alt plakada ve insert somunlarda çıkma olup olmadığı kontrol edilecek.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked19
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
                              value: isChecked20,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked20 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController20);
                                },
                                child: Text(
                                  "20. Kuyruk ve burundan olmak üzere kabuk sabitlenmesi kontrol edilecek",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked20
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
                              value: isChecked21,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked21 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController21);
                                },
                                child: Text(
                                  "21. Görev sistemi sabitliği ve mekanik aksaklık olmadığı kontrol edilecek.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked21
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "22. Mekanik Sistem Kontrolü",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.blue,
                              value: isChecked22_1,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked22_1 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController22_1);
                                },
                                child: Text(
                                  "22.1. Dişlilerin şasiye temas edip etmediği kontrol edilecek.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked22_1
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
                              value: isChecked22_2,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked22_2 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController22_2);
                                },
                                child: Text(
                                  "22.2. Push rodların düzgün takılı olmasına ve kırılma, çatlak veya herhangi bir bozulma olup olmadığına bakılacak.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked22_2
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
                              value: isChecked22_3,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked22_3 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController22_3);
                                },
                                child: Text(
                                  "22.3. Servo arm ball linkleri sabitliğine bakılacak.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked22_3
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
                              value: isChecked22_4,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked22_4 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController22_4);
                                },
                                child: Text(
                                  "22.4. Rotor kafasının sarsıntısı kontrol edilecek.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked22_4
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "22.5. Dişli kontrolü (Hasar ve yağlama kontrolü)",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.blue,
                              value: isChecked22_5_1,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked22_5_1 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController22_5_1);
                                },
                                child: Text(
                                  "22.5.1. Ana rotor dişlisi",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked22_5_1
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
                              value: isChecked22_5_2,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked22_5_2 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController22_5_2);
                                },
                                child: Text(
                                  "22.5.2. Ana kuyruk dişlisi",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked22_5_2
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
                              value: isChecked22_5_3,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked22_5_3 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController22_5_3);
                                },
                                child: Text(
                                  "22.5.3. Tork tüp Dişlileri",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked22_5_3
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
                              value: isChecked22_5_4,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked22_5_4 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController22_5_4);
                                },
                                child: Text(
                                  "22.5.4. Motor Dişlisi",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked22_5_4
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.blue,
                              value: isChecked22_6,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked22_6 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController22_6);
                                },
                                child: Text(
                                  "22.6. Kuyruk rotoru sabitliği kontrol edilecek.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked22_6
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
                              value: isChecked23,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked23 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController23);
                                },
                                child: Text(
                                  "23. Pervane açıları kontrol edilecek ve açı değerleri girilecek. (Aşağıdaki soruya girilecek.)",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked23
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          //Kaydet butonun sonda şık durması için lazım
                          height: 100,
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        width: 350,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _showSaveConfirmationDialog,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shadowColor: Colors.black,
                            elevation: 10,
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
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
