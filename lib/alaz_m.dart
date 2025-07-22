import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:milat/araclar.dart';
import 'package:milat/kayitlar.dart';

class AlazMekanik extends StatefulWidget {
  final String controllerName;
  final String selectedOption;

  const AlazMekanik({
    super.key,
    required this.controllerName,
    required this.selectedOption,
  });

  @override
  State<AlazMekanik> createState() => _AlazMekanikState();
}

class _AlazMekanikState extends State<AlazMekanik> {
  bool isLoading = true;
  List<TaskItem> taskItems = TaskRepository.defaultTasks;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      await TaskRepository.loadTasks(taskItems);
    } catch (e) {
      Fluttertoast.showToast(msg: "Veri yüklenemedi: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _saveAll() async {
    try {
      await TaskRepository.saveTasks(taskItems);
      await TaskRepository.saveHistory(taskItems, widget.controllerName, widget.selectedOption);
      Fluttertoast.showToast(msg: "Başarıyla kaydedildi");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Araclar(
            controllerName: widget.controllerName,
            selectedOption: widget.selectedOption,
          ),
        ),
      );
    } catch (e) {
      Fluttertoast.showToast(msg: "Kayıt sırasında hata: $e");
    }
  }

  void _showNoteDialog(TaskItem task) {
    final controller = TextEditingController(text: task.note);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Not"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "Notunuzu buraya girin"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() => task.note = controller.text);
              Navigator.pop(context);
            },
            child: const Text("Tamam", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  void _showSaveDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Emin misiniz?"),
        content: const Text("Verileri kaydetmek istediğinizden emin misiniz?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Hayır", style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await _saveAll();
            },
            child: const Text("Evet", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Alaz Mekanik Görev Listesi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.library_books_outlined, color: Colors.white),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Kayitlar())),
          )
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                  child: ListView.builder(
                    itemCount: taskItems.length,
                    itemBuilder: (context, index) {
                      final task = taskItems[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: task.isChecked,
                                activeColor: Colors.blue,
                                onChanged: (val) => setState(() => task.isChecked = val ?? false),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => _showNoteDialog(task),
                                  child: Text(
                                    task.label,
                                    style: TextStyle(
                                      fontSize: 16,
                                      decoration: task.isChecked ? TextDecoration.lineThrough : null,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      width: 350,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _showSaveDialog,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          elevation: 10,
                        ),
                        child: const Text(
                          "KAYDET",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class TaskItem {
  final String id;
  final String label;
  bool isChecked;
  String note;

  TaskItem({
    required this.id,
    required this.label,
    this.isChecked = false,
    this.note = '',
  });
}

class TaskRepository {
  static List<TaskItem> get defaultTasks => [
        TaskItem(id: "1", label: "1. Kuyruk bomu düğme kilit kontrolü"),
        TaskItem(id: "2", label: "2. Sağ-sol kanat düğme kilit kontrolü"),
        TaskItem(id: "3", label: "3. Kuyruk ana sparı somun kontrolü"),
        TaskItem(id: "4", label: "4. Kuyruk menteşe sparı kontrolü"),
        TaskItem(id: "5", label: "5. Aktif yüzey pushrod kontrolü"),
        TaskItem(id: "6", label: "6. Motor sabitleme civataları kontrolü"),
        TaskItem(id: "7", label: "7. Pervane sabitliği"),
        TaskItem(id: "8", label: "8. Ağırlık merkezi kontrolü"),
        TaskItem(id: "9", label: "9. Kapak sabitlenmesi"),
  ];

  static Future<void> loadTasks(List<TaskItem> items) async {
    final doc = await FirebaseFirestore.instance.collection("usersAM").doc("userAMId").get();
    if (doc.exists) {
      for (var item in items) {
        item.isChecked = doc["isChecked${item.id}"] ?? false;
        item.note = doc["note${item.id}"] ?? "";
      }
    }
  }

  static Future<void> saveTasks(List<TaskItem> items) async {
    final data = <String, dynamic>{};
    for (var item in items) {
      data["isChecked${item.id}"] = item.isChecked;
      data["note${item.id}"] = item.note;
    }
    await FirebaseFirestore.instance.collection("usersAM").doc("userAMId").set(data, SetOptions(merge: true));
  }

  static Future<void> saveHistory(List<TaskItem> items, String name, String option) async {
    String timestamp = DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());
    final historyText = StringBuffer()
      ..writeln("Kontrolcü İsmi: $name")
      ..writeln("Birimi: $option")
      ..writeln("Tarih: $timestamp")
      ..writeln();

    for (var item in items) {
      historyText.writeln("${item.label} => ${item.isChecked ? 'Tamamlandı' : 'Eksik'} | Not: ${item.note}");
    }

    await FirebaseFirestore.instance.collection("history").doc("historyId").set({
      "history": FieldValue.arrayUnion([historyText.toString()])
    }, SetOptions(merge: true));
  }
}