import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:milat1453/araclar.dart';
import 'package:milat1453/kayitlar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MiraYazilim extends StatefulWidget {
  final String controllerName;
  final String selectedOption;

  const MiraYazilim({
    super.key,
    required this.controllerName,
    required this.selectedOption,
  });

  @override
  State<MiraYazilim> createState() => _MiraYazilimState();
}

class _MiraYazilimState extends State<MiraYazilim> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  final TextEditingController _noteController1 = TextEditingController();
  final TextEditingController _noteController2 = TextEditingController();
  final TextEditingController _noteController3 = TextEditingController();
  List<String> historyList = [];

  @override
  void initState() {
    super.initState();
    _loadCheckboxState();
    _loadNotes();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      historyList = prefs.getStringList('historyList') ?? [];
    });
  }

  Future<void> _loadCheckboxState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isChecked1 = prefs.getBool('isChecked1') ?? false;
      isChecked2 = prefs.getBool('isChecked2') ?? false;
      isChecked3 = prefs.getBool('isChecked3') ?? false;
    });
  }

  Future<void> _loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _noteController1.text = prefs.getString('note1') ?? '';
      _noteController2.text = prefs.getString('note2') ?? '';
      _noteController3.text = prefs.getString('note3') ?? '';
    });
  }

  Future<void> _saveCheckboxState() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isChecked1', isChecked1);
    prefs.setBool('isChecked2', isChecked2);
    prefs.setBool('isChecked3', isChecked3);
  }

  Future<void> _saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('note1', _noteController1.text);
    prefs.setString('note2', _noteController2.text);
    prefs.setString('note3', _noteController3.text);
  }

  Future<void> _saveHistory() async {
    final prefs = await SharedPreferences.getInstance();
    String timestamp = DateTime.now().toString();
    String historyEntry =
        "Kontrolcü İsmi: ${widget.controllerName}\nBirimi: ${widget.selectedOption}\nTarih: $timestamp\nGörev 1: $isChecked1, Görev 2: $isChecked2, Görev 3: $isChecked3\nNotlar: 1: ${_noteController1.text}, 2: ${_noteController2.text}, 3: ${_noteController3.text}, ";

    setState(() {
      historyList.add(historyEntry);
    });

    prefs.setStringList('historyList', historyList);
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
              await _saveNotes();
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

  void _showHistory() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Kaydedilen Veriler"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: historyList.map((entry) {
              return Column(
                children: [
                  Text(entry),
                  const Divider(),
                ],
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Kapat"),
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
          "Mira Yazılım Görev Listesi",
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
      body: Padding(
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
              const SizedBox(height: 40),
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
