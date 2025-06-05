import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:milat1453/araclar.dart';
import 'package:milat1453/kayitlar.dart';

class OrkaElektronik extends StatefulWidget {
  final String controllerName;
  final String selectedOption;

  const OrkaElektronik({
    super.key,
    required this.controllerName,
    required this.selectedOption,
  });

  @override
  State<OrkaElektronik> createState() => _OrkaElektronikState();
}

class _OrkaElektronikState extends State<OrkaElektronik> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4_1 = false;
  bool isChecked4_2 = false;
  bool isChecked4_3 = false;
  bool isChecked4_4 = false;
  bool isChecked4_5 = false;
  bool isChecked4_6 = false;
  bool isChecked4_7 = false;
  bool isChecked4_8 = false;
  bool isChecked4_9 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7_1 = false;
  bool isChecked7_2 = false;
  bool isChecked7_3 = false;
  bool isChecked7_4_1 = false;
  bool isChecked7_4_2 = false;
  bool isChecked7_4_3 = false;
  bool isChecked7_4_4 = false;
  bool isChecked7_4_5 = false;
  bool isChecked7_4_6 = false;
  bool isChecked7_5 = false;
  bool isChecked7_6 = false;
  bool isChecked7_7_1 = false;
  bool isChecked7_7_2 = false;
  bool isChecked7_7_3 = false;
  bool isChecked7_7_4 = false;
  bool isChecked7_7_5 = false;
  bool isChecked7_7_6 = false;
  bool isChecked8 = false;
  bool isChecked9 = false;
  bool isChecked10 = false;
  bool isChecked11 = false;
  bool isChecked12 = false;
  bool isChecked13 = false;
  bool isChecked14_1_1 = false;
  bool isChecked14_1_2 = false;
  bool isChecked15_1 = false;
  bool isChecked15_2 = false;
  bool isChecked15_3 = false;
  bool isChecked15_4 = false;
  bool isChecked16 = false;
  bool isChecked17 = false;
  bool isChecked18 = false;
  bool isChecked19 = false;
  bool isChecked20 = false;
  bool isChecked21 = false;

  final TextEditingController _noteController1 = TextEditingController();
  final TextEditingController _noteController2 = TextEditingController();
  final TextEditingController _noteController3 = TextEditingController();
  final TextEditingController _noteController4_1 = TextEditingController();
  final TextEditingController _noteController4_2 = TextEditingController();
  final TextEditingController _noteController4_3 = TextEditingController();
  final TextEditingController _noteController4_4 = TextEditingController();
  final TextEditingController _noteController4_5 = TextEditingController();
  final TextEditingController _noteController4_6 = TextEditingController();
  final TextEditingController _noteController4_7 = TextEditingController();
  final TextEditingController _noteController4_8 = TextEditingController();
  final TextEditingController _noteController4_9 = TextEditingController();
  final TextEditingController _noteController5 = TextEditingController();
  final TextEditingController _noteController6 = TextEditingController();
  final TextEditingController _noteController7_1 = TextEditingController();
  final TextEditingController _noteController7_2 = TextEditingController();
  final TextEditingController _noteController7_3 = TextEditingController();
  final TextEditingController _noteController7_4_1 = TextEditingController();
  final TextEditingController _noteController7_4_2 = TextEditingController();
  final TextEditingController _noteController7_4_3 = TextEditingController();
  final TextEditingController _noteController7_4_4 = TextEditingController();
  final TextEditingController _noteController7_4_5 = TextEditingController();
  final TextEditingController _noteController7_4_6 = TextEditingController();
  final TextEditingController _noteController7_5 = TextEditingController();
  final TextEditingController _noteController7_6 = TextEditingController();
  final TextEditingController _noteController7_7_1 = TextEditingController();
  final TextEditingController _noteController7_7_2 = TextEditingController();
  final TextEditingController _noteController7_7_3 = TextEditingController();
  final TextEditingController _noteController7_7_4 = TextEditingController();
  final TextEditingController _noteController7_7_5 = TextEditingController();
  final TextEditingController _noteController7_7_6 = TextEditingController();
  final TextEditingController _noteController8 = TextEditingController();
  final TextEditingController _noteController9 = TextEditingController();
  final TextEditingController _noteController10 = TextEditingController();
  final TextEditingController _noteController11 = TextEditingController();
  final TextEditingController _noteController12 = TextEditingController();
  final TextEditingController _noteController13 = TextEditingController();
  final TextEditingController _noteController14_1_1 = TextEditingController();
  final TextEditingController _noteController14_1_2 = TextEditingController();
  final TextEditingController _noteController15_1 = TextEditingController();
  final TextEditingController _noteController15_2 = TextEditingController();
  final TextEditingController _noteController15_3 = TextEditingController();
  final TextEditingController _noteController15_4 = TextEditingController();
  final TextEditingController _noteController16 = TextEditingController();
  final TextEditingController _noteController17 = TextEditingController();
  final TextEditingController _noteController18 = TextEditingController();
  final TextEditingController _noteController19 = TextEditingController();
  final TextEditingController _noteController20 = TextEditingController();
  final TextEditingController _noteController21 = TextEditingController();
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
          FirebaseFirestore.instance.collection('usersOE').doc('userOEId');
      final docSnapshot = await userDoc.get();
      if (docSnapshot.exists) {
        setState(() {
          isChecked1 = docSnapshot['isChecked1'] ?? false;
          isChecked2 = docSnapshot['isChecked2'] ?? false;
          isChecked3 = docSnapshot['isChecked3'] ?? false;
          isChecked4_1 = docSnapshot['isChecked4_1'] ?? false;
          isChecked4_2 = docSnapshot['isChecked4_2'] ?? false;
          isChecked4_3 = docSnapshot['isChecked4_3'] ?? false;
          isChecked4_4 = docSnapshot['isChecked4_4'] ?? false;
          isChecked4_5 = docSnapshot['isChecked4_5'] ?? false;
          isChecked4_6 = docSnapshot['isChecked4_6'] ?? false;
          isChecked4_7 = docSnapshot['isChecked4_7'] ?? false;
          isChecked4_8 = docSnapshot['isChecked4_8'] ?? false;
          isChecked4_9 = docSnapshot['isChecked4_9'] ?? false;
          isChecked5 = docSnapshot['isChecked5'] ?? false;
          isChecked6 = docSnapshot['isChecked6'] ?? false;
          isChecked7_1 = docSnapshot['isChecked7_1'] ?? false;
          isChecked7_2 = docSnapshot['isChecked7_2'] ?? false;
          isChecked7_3 = docSnapshot['isChecked7_3'] ?? false;
          isChecked7_4_1 = docSnapshot['isChecked7_4_1'] ?? false;
          isChecked7_4_2 = docSnapshot['isChecked7_4_2'] ?? false;
          isChecked7_4_3 = docSnapshot['isChecked7_4_3'] ?? false;
          isChecked7_4_4 = docSnapshot['isChecked7_4_4'] ?? false;
          isChecked7_4_5 = docSnapshot['isChecked7_4_5'] ?? false;
          isChecked7_4_6 = docSnapshot['isChecked7_4_6'] ?? false;
          isChecked7_5 = docSnapshot['isChecked7_5'] ?? false;
          isChecked7_6 = docSnapshot['isChecked7_6'] ?? false;
          isChecked7_7_1 = docSnapshot['isChecked7_4_6'] ?? false;
          isChecked7_7_2 = docSnapshot['isChecked7_4_6'] ?? false;
          isChecked7_7_3 = docSnapshot['isChecked7_4_6'] ?? false;
          isChecked7_7_4 = docSnapshot['isChecked7_4_6'] ?? false;
          isChecked7_7_5 = docSnapshot['isChecked7_4_6'] ?? false;
          isChecked7_7_6 = docSnapshot['isChecked7_4_6'] ?? false;
          isChecked8 = docSnapshot['isChecked8'] ?? false;
          isChecked9 = docSnapshot['isChecked9'] ?? false;
          isChecked10 = docSnapshot['isChecked10'] ?? false;
          isChecked11 = docSnapshot['isChecked11'] ?? false;
          isChecked12 = docSnapshot['isChecked12'] ?? false;
          isChecked13 = docSnapshot['isChecked13'] ?? false;
          isChecked14_1_1 = docSnapshot['isChecked14_1_1'] ?? false;
          isChecked14_1_2 = docSnapshot['isChecked14_1_2'] ?? false;
          isChecked15_1 = docSnapshot['isChecked15_1'] ?? false;
          isChecked15_2 = docSnapshot['isChecked15_2'] ?? false;
          isChecked15_3 = docSnapshot['isChecked15_3'] ?? false;
          isChecked15_4 = docSnapshot['isChecked15_4'] ?? false;
          isChecked16 = docSnapshot['isChecked16'] ?? false;
          isChecked17 = docSnapshot['isChecked17'] ?? false;
          isChecked18 = docSnapshot['isChecked18'] ?? false;
          isChecked19 = docSnapshot['isChecked19'] ?? false;
          isChecked20 = docSnapshot['isChecked20'] ?? false;
          isChecked21 = docSnapshot['isChecked21'] ?? false;
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
        FirebaseFirestore.instance.collection('usersOE').doc('userOEId');
    final docSnapshot = await userDoc.get();
    if (docSnapshot.exists) {
      setState(() {
        _noteController1.text = docSnapshot['note1'] ?? '';
        _noteController2.text = docSnapshot['note2'] ?? '';
        _noteController3.text = docSnapshot['note3'] ?? '';
        _noteController4_1.text = docSnapshot['note4_1'] ?? '';
        _noteController4_2.text = docSnapshot['note4_2'] ?? '';
        _noteController4_3.text = docSnapshot['note4_3'] ?? '';
        _noteController4_4.text = docSnapshot['note4_4'] ?? '';
        _noteController4_5.text = docSnapshot['note4_5'] ?? '';
        _noteController4_6.text = docSnapshot['note4_6'] ?? '';
        _noteController4_7.text = docSnapshot['note4_7'] ?? '';
        _noteController4_8.text = docSnapshot['note4_8'] ?? '';
        _noteController4_9.text = docSnapshot['note4_9'] ?? '';
        _noteController5.text = docSnapshot['note5'] ?? '';
        _noteController6.text = docSnapshot['note6'] ?? '';
        _noteController7_1.text = docSnapshot['note7_1'] ?? '';
        _noteController7_2.text = docSnapshot['note7_2'] ?? '';
        _noteController7_3.text = docSnapshot['note7_3'] ?? '';
        _noteController7_4_1.text = docSnapshot['note7_4_1'] ?? '';
        _noteController7_4_2.text = docSnapshot['note7_4_2'] ?? '';
        _noteController7_4_3.text = docSnapshot['note7_4_3'] ?? '';
        _noteController7_4_4.text = docSnapshot['note7_4_4'] ?? '';
        _noteController7_4_5.text = docSnapshot['note7_4_5'] ?? '';
        _noteController7_4_6.text = docSnapshot['note7_4_6'] ?? '';
        _noteController7_5.text = docSnapshot['note7_5'] ?? '';
        _noteController7_6.text = docSnapshot['note7_6'] ?? '';
        _noteController7_7_1.text = docSnapshot['note7_7_1'] ?? '';
        _noteController7_7_2.text = docSnapshot['note7_7_2'] ?? '';
        _noteController7_7_3.text = docSnapshot['note7_7_3'] ?? '';
        _noteController7_7_4.text = docSnapshot['note7_7_4'] ?? '';
        _noteController7_7_5.text = docSnapshot['note7_7_5'] ?? '';
        _noteController7_7_6.text = docSnapshot['note7_7_6'] ?? '';
        _noteController8.text = docSnapshot['note8'] ?? '';
        _noteController9.text = docSnapshot['note9'] ?? '';
        _noteController10.text = docSnapshot['note10'] ?? '';
        _noteController11.text = docSnapshot['note11'] ?? '';
        _noteController12.text = docSnapshot['note12'] ?? '';
        _noteController13.text = docSnapshot['note13'] ?? '';
        _noteController14_1_1.text = docSnapshot['note14_1_1'] ?? '';
        _noteController14_1_2.text = docSnapshot['note14_1_2'] ?? '';
        _noteController15_1.text = docSnapshot['note15_1'] ?? '';
        _noteController15_2.text = docSnapshot['note15_2'] ?? '';
        _noteController15_3.text = docSnapshot['note15_3'] ?? '';
        _noteController15_4.text = docSnapshot['note15_4'] ?? '';
        _noteController16.text = docSnapshot['note16'] ?? '';
        _noteController17.text = docSnapshot['note17'] ?? '';
        _noteController18.text = docSnapshot['note18'] ?? '';
        _noteController19.text = docSnapshot['note19'] ?? '';
        _noteController20.text = docSnapshot['note20'] ?? '';
        _noteController21.text = docSnapshot['note21'] ?? '';
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _saveCheckboxState() async {
    final userDoc =
        FirebaseFirestore.instance.collection('usersOE').doc('userOEId');
    await userDoc.set({
      'isChecked1': isChecked1,
      'isChecked2': isChecked2,
      'isChecked3': isChecked3,
      'isChecked4_1': isChecked4_1,
      'isChecked4_2': isChecked4_2,
      'isChecked4_3': isChecked4_3,
      'isChecked4_4': isChecked4_4,
      'isChecked4_5': isChecked4_5,
      'isChecked4_6': isChecked4_6,
      'isChecked4_7': isChecked4_7,
      'isChecked4_8': isChecked4_8,
      'isChecked4_9': isChecked4_9,
      'isChecked5': isChecked5,
      'isChecked6': isChecked6,
      'isChecked7_1': isChecked7_1,
      'isChecked7_2': isChecked7_2,
      'isChecked7_3': isChecked7_3,
      'isChecked7_4_1': isChecked7_4_1,
      'isChecked7_4_2': isChecked7_4_2,
      'isChecked7_4_3': isChecked7_4_3,
      'isChecked7_4_4': isChecked7_4_4,
      'isChecked7_4_5': isChecked7_4_5,
      'isChecked7_4_6': isChecked7_4_6,
      'isChecked7_5': isChecked7_5,
      'isChecked7_6': isChecked7_6,
      'isChecked7_7_1': isChecked7_7_1,
      'isChecked7_7_2': isChecked7_7_2,
      'isChecked7_7_3': isChecked7_7_3,
      'isChecked7_7_4': isChecked7_7_4,
      'isChecked7_7_5': isChecked7_7_5,
      'isChecked7_7_6': isChecked7_7_6,
      'isChecked8': isChecked8,
      'isChecked9': isChecked9,
      'isChecked10': isChecked10,
      'isChecked11': isChecked11,
      'isChecked12': isChecked12,
      'isChecked13': isChecked13,
      'isChecked14_1_1': isChecked14_1_1,
      'isChecked14_1_2': isChecked14_1_2,
      'isChecked15_1': isChecked15_1,
      'isChecked15_2': isChecked15_2,
      'isChecked15_3': isChecked15_3,
      'isChecked15_4': isChecked15_4,
      'isChecked16': isChecked16,
      'isChecked17': isChecked17,
      'isChecked18': isChecked18,
      'isChecked19': isChecked19,
      'isChecked20': isChecked20,
      'isChecked21': isChecked21,
      'note1': _noteController1.text,
      'note2': _noteController2.text,
      'note3': _noteController3.text,
      'note4_1': _noteController4_1.text,
      'note4_2': _noteController4_2.text,
      'note4_3': _noteController4_3.text,
      'note4_4': _noteController4_4.text,
      'note4_5': _noteController4_5.text,
      'note4_6': _noteController4_6.text,
      'note4_7': _noteController4_7.text,
      'note4_8': _noteController4_8.text,
      'note4_9': _noteController4_9.text,
      'note5': _noteController5.text,
      'note6': _noteController6.text,
      'note7_1': _noteController7_1.text,
      'note7_2': _noteController7_2.text,
      'note7_3': _noteController7_3.text,
      'note7_4_1': _noteController7_4_1.text,
      'note7_4_2': _noteController7_4_2.text,
      'note7_4_3': _noteController7_4_3.text,
      'note7_4_4': _noteController7_4_4.text,
      'note7_4_5': _noteController7_4_5.text,
      'note7_4_6': _noteController7_4_6.text,
      'note7_5': _noteController7_5.text,
      'note7_6': _noteController7_6.text,
      'note7_7_1': _noteController7_7_1.text,
      'note7_7_2': _noteController7_7_2.text,
      'note7_7_3': _noteController7_7_3.text,
      'note7_7_4': _noteController7_7_4.text,
      'note7_7_5': _noteController7_7_5.text,
      'note7_7_6': _noteController7_7_6.text,
      'note8': _noteController8.text,
      'note9': _noteController9.text,
      'note10': _noteController10.text,
      'note11': _noteController11.text,
      'note12': _noteController12.text,
      'note13': _noteController13.text,
      'note14_1_1': _noteController14_1_1.text,
      'note14_1_2': _noteController14_1_2.text,
      'note15_1': _noteController15_1.text,
      'note15_2': _noteController15_2.text,
      'note15_3': _noteController15_3.text,
      'note15_4': _noteController15_4.text,
      'note16': _noteController16.text,
      'note17': _noteController17.text,
      'note18': _noteController18.text,
      'note19': _noteController19.text,
      'note20': _noteController20.text,
      'note21': _noteController21.text,
    }, SetOptions(merge: true));
  }

  Future<void> _saveHistory() async {
    String timestamp = DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());
    String historyEntry =
        "Kontrolcü İsmi: ${widget.controllerName}\nBirimi: ${widget.selectedOption}\nTarih: $timestamp\n\nGörev 1: $isChecked1, Görev 2: $isChecked2, Görev 3: $isChecked3,Görev 4-1: $isChecked4_1, Görev 4-2: $isChecked4_2, Görev 4-3: $isChecked4_3, Görev 4-4: $isChecked4_4,Görev 4-5: $isChecked4_5, Görev 4-6: $isChecked4_6, Görev 4-7: $isChecked4_7, Görev 4-8: $isChecked4_8, Görev 4-9: $isChecked4_9,Görev 5: $isChecked5, Görev 6: $isChecked6,Görev 7-1: $isChecked7_1, Görev 7-2: $isChecked7_2, Görev 7-3: $isChecked7_3,Görev 7-4-1: $isChecked7_4_1, Görev 7-4-2: $isChecked7_4_2, Görev 7-4-3: $isChecked7_4_3, Görev 7-4-4: $isChecked7_4_4, Görev 7-4-5: $isChecked7_4_5, Görev 7-4-6: $isChecked7_4_6,Görev 7-5: $isChecked7_5, Görev 7-6: $isChecked7_6,Görev 7-7-1: $isChecked7_7_1, Görev 7-7-2: $isChecked7_7_2, Görev 7-7-3: $isChecked7_7_3, Görev 7-7-4: $isChecked7_7_4, Görev 7-7-5: $isChecked7_7_5, Görev 7-7-6: $isChecked7_7_6,Görev 8: $isChecked8, Görev 9: $isChecked9, Görev 10: $isChecked10,Görev 11: $isChecked11, Görev 12: $isChecked12, Görev 13: $isChecked13,Görev 14-1-1: $isChecked14_1_1, Görev 14-1-2: $isChecked14_1_2,Görev 15-1: $isChecked15_1, Görev 15-2: $isChecked15_2, Görev 15-3: $isChecked15_3, Görev 15-4: $isChecked15_4,Görev 16: $isChecked16, Görev 17: $isChecked17, Görev 18: $isChecked18, Görev 19: $isChecked19, Görev 20: $isChecked20, Görev 21: $isChecked21.\nNotlar: 1: ${_noteController1.text}, 2: ${_noteController2.text}, 3: ${_noteController3.text},4-1: ${_noteController4_1.text}, 4-2: ${_noteController4_2.text}, 4-3: ${_noteController4_3.text}, 4-4: ${_noteController4_4.text},4-5: ${_noteController4_5.text}, 4-6: ${_noteController4_6.text}, 4-7: ${_noteController4_7.text}, 4-8: ${_noteController4_8.text}, 4-9: ${_noteController4_9.text},5: ${_noteController5.text}, 6: ${_noteController6.text},7-1: ${_noteController7_1.text}, 7-2: ${_noteController7_2.text}, 7-3: ${_noteController7_3.text},7-4-1: ${_noteController7_4_1.text}, 7-4-2: ${_noteController7_4_2.text}, 7-4-3: ${_noteController7_4_3.text}, 7-4-4: ${_noteController7_4_4.text}, 7-4-5: ${_noteController7_4_5.text}, 7-4-6: ${_noteController7_4_6.text},7-5: ${_noteController7_5.text}, 7-6: ${_noteController7_6.text},7-7-1: ${_noteController7_7_1.text}, 7-7-2: ${_noteController7_7_2.text}, 7-7-3: ${_noteController7_7_3.text}, 7-7-4: ${_noteController7_7_4.text}, 7-7-5: ${_noteController7_7_5.text}, 7-7-6: ${_noteController7_7_6.text},8: ${_noteController8.text}, 9: ${_noteController9.text}, 10: ${_noteController10.text},11: ${_noteController11.text}, 12: ${_noteController12.text}, 13: ${_noteController13.text},14-1-1: ${_noteController14_1_1.text}, 14-1-2: ${_noteController14_1_2.text},15-1: ${_noteController15_1.text}, 15-2: ${_noteController15_2.text}, 15-3: ${_noteController15_3.text}, 15-4: ${_noteController15_4.text},16: ${_noteController16.text}, 17: ${_noteController17.text}, 18: ${_noteController18.text}, 19: ${_noteController19.text}, 20: ${_noteController20.text}, 21: ${_noteController21.text}.";

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
          "Orka Elektronik Görev Listesi",
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
                                  "1. Lipo şarjı 8.4V mu?",
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
                                  "2. Lipo batarya kablosu bantlandı mı?",
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
                                  "3. Güç modülü – DC Converter bağlantısı yapıldı mı?",
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
                            "4. Pixhawk bağlantıları",
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
                                  "4.1.     GPS CAN1 portunda mı?",
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
                                  "4.2.     Telemetri TELEM1 portunda mı?",
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
                                  "4.3.     Power Modül kablosu POWER1 portunda mı?",
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
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.blue,
                              value: isChecked4_4,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked4_4 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController4_4);
                                },
                                child: Text(
                                  "4.4.     Safety switch GPS1 portunda mı?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked4_4
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
                              value: isChecked4_5,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked4_5 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController4_5);
                                },
                                child: Text(
                                  "4.5.     Buzzer USB portunda mı?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked4_5
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
                              value: isChecked4_6,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked4_6 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController4_6);
                                },
                                child: Text(
                                  "4.6.     Servo kabloları doğru pinlerde mi?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked4_6
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
                              value: isChecked4_7,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked4_7 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController4_7);
                                },
                                child: Text(
                                  "4.7.     Alıcı RC pinlerinde mi?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked4_7
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
                              value: isChecked4_8,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked4_8 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController4_8);
                                },
                                child: Text(
                                  "4.8.  DC coverter çıkışı AUX 1’e mi bağlı?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked4_8
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
                              value: isChecked4_9,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked4_9 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController4_9);
                                },
                                child: Text(
                                  "4.9.  RPM sensörü AUX6’ya mı bağlı?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked4_9
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
                                  "5.  Pixhawk’ta SD kart takılı mı?",
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
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.blue,
                              value: isChecked6,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked6 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController6);
                                },
                                child: Text(
                                  "6.  Alıcı bağlantısı doğru mu?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked6
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
                            "7.  Parametre Kontrolü",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.blue,
                              value: isChecked7_1,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7_1 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7_1);
                                },
                                child: Text(
                                  "7.1.     H_SV_MAN parametresi 0 mı?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7_1
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
                              value: isChecked7_2,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7_2 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7_2);
                                },
                                child: Text(
                                  "7.2.     H_RSC_MODE istenilen rsc moduna ayarlandı mı? (3:throttle curve, 4:Autothrottle)",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7_2
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
                              value: isChecked7_3,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7_3 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7_3);
                                },
                                child: Text(
                                  "7.3.     RTL parametresi (RTL_ALT : 1500)",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7_3
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
                            "7.4.     Batarya failsafe parametreleri:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.blue,
                              value: isChecked7_4_1,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7_4_1 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7_4_1);
                                },
                                child: Text(
                                  "7.4.1.           BATT_FS_LOW_ACT : 2 ,",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7_4_1
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
                              value: isChecked7_4_2,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7_4_2 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7_4_2);
                                },
                                child: Text(
                                  "7.4.2.           BATT_LOW_VOLT : 7.2 ,",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7_4_2
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
                              value: isChecked7_4_3,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7_4_3 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7_4_3);
                                },
                                child: Text(
                                  "7.4.3.           BATT_LOW_MAH : 0 ,",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7_4_3
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
                              value: isChecked7_4_4,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7_4_4 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7_4_4);
                                },
                                child: Text(
                                  "7.4.4.           BATT_FS_CRT_ACT : 1 ,",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7_4_4
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
                              value: isChecked7_4_5,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7_4_5 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7_4_5);
                                },
                                child: Text(
                                  "7.4.5.           BATT_CRT_MAH : 0 ,",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7_4_5
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
                              value: isChecked7_4_6,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7_4_6 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7_4_6);
                                },
                                child: Text(
                                  "7.4.6.           BATT_CRT_VOLT : 7. ,",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7_4_6
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
                              value: isChecked7_5,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7_5 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7_5);
                                },
                                child: Text(
                                  "7.5.     Radyo failsafe parametreleri(FS_THR_VALUE , FS_THR_ENABLE)",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7_5
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
                              value: isChecked7_6,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7_6 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7_6);
                                },
                                child: Text(
                                  "7.6.     GCS failsafe parametreleri ( FS_GCS_ENABLE, FS_GCS_TIMEOUT)",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7_6
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
                            "7.7.     GPS parametreleri",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.blue,
                              value: isChecked7_7_1,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7_7_1 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7_7_1);
                                },
                                child: Text(
                                  "7.7.1.            CAN_D1_PROTOCOL: 1,",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7_7_1
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
                              value: isChecked7_7_2,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7_7_2 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7_7_2);
                                },
                                child: Text(
                                  "7.7.2.            CAN_D2_PROTOCOL: 1,",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7_7_2
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
                              value: isChecked7_7_3,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7_7_3 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7_7_3);
                                },
                                child: Text(
                                  "7.7.3.            CAN_P1_DRIVER: 1,",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7_7_3
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
                              value: isChecked7_7_4,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7_7_4 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7_7_4);
                                },
                                child: Text(
                                  "7.7.4.            CAN_P2_DRIVER: 1,",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7_7_4
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
                              value: isChecked7_7_5,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7_7_5 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7_7_5);
                                },
                                child: Text(
                                  "7.7.5.            GPS_TYPE: 9,",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7_7_5
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
                              value: isChecked7_7_6,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7_7_6 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7_7_6);
                                },
                                child: Text(
                                  "7.7.6.            NTF_LED_TYPES: 231)",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7_7_6
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
                                  "8.  Telemetri anteni takılı mı? Bağlantı başarılı mı?",
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
                                  "9.  Doğru compass seçildi mi? Birinci sırada UAVCAN mı var?",
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
                                  "10. Mission Planner’da GPS hatası haricinde hata var mı?",
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
                                  "11. Parametrelerin son hali dosyaya kaydedildi mi?",
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
                                  "12. Kumandanın pili var mı?",
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
                                  "13. Radyo kalibrasyonu kontrol edilir. (Throttle, yaw ve roll kanalları için; kanal stick’i ile Mission Planner’daki yeşil barlar ile aynı yönde, Pitch kanalı için ise stick ile yeşil bar zıt yönde hareket etmeli.)",
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
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "14. Kumanda kanallarına doğru seçenekler atandı mı?",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.blue,
                              value: isChecked14_1_1,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked14_1_1 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController14_1_1);
                                },
                                child: Text(
                                  "14.1.1. Motor interlock “A” switchinde mi?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked14_1_1
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
                              value: isChecked14_1_2,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked14_1_2 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController14_1_2);
                                },
                                child: Text(
                                  "14.1.2. Uçuş Modları “C” switchinde mi? (Üstten alta Poshold, guided ve RTL)",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked14_1_2
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
                            "15.                      Kumanda kullanılarak swashplate, kuyruk ve gaz servolarının hareketlerinin istenilen yönde olduğu kontrol edilecek.",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.blue,
                              value: isChecked15_1,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked15_1 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController15_1);
                                },
                                child: Text(
                                  "15.1.                             Throttle çubuğu yükseltildiğinde swashplate yükselmeli. Araç arm durumdaysa karbüratör açılmalı.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked15_1
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
                              value: isChecked15_2,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked15_2 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController15_2);
                                },
                                child: Text(
                                  "15.2.                             Roll çubuğu itildiğinde swashplate itilen yöne doğru eğilmelidir.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked15_2
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
                              value: isChecked15_3,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked15_3 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController15_3);
                                },
                                child: Text(
                                  "15.3.                             Pitch çubuğu itildiğinde swashplate itilen yöne doğru eğilmelidir.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked15_3
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
                              value: isChecked15_4,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked15_4 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController15_4);
                                },
                                child: Text(
                                  "15.4.                             Yaw çubuğu sağa itildiğinde kuyruk pervaneleri sol tarafa doğru dönmelidir.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked15_4
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
                                  "16.                      Servo motorlar hareket ederken herhangi bir takılma, zorlanma var mı?",
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
                                  "17.                      Kablajlarda sorun olmamasına ve dişlilere temas edip etmediği kontrol edilecek.",
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
                                  "18.                      H_RSC_IDLE kontrol edilecek.",
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
                                  "19.                       H_RSC_RUNUP_TIME kontrol edilecek.",
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
                              value: isChecked7_3,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked7_3 = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _openNoteDialog(_noteController7_3);
                                },
                                child: Text(
                                  "20.                       H_RSC_RAMP_TIME kontrol edilecek.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: isChecked7_3
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
                                  "21.                       RPM değeri okunduğu kontrol edilecek.",
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
