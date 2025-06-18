import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:milat/araclar.dart';
import 'package:milat/kayitlar.dart';

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
          "Orka Mekanik Görev Listesi",
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
        TaskItem(id: "1", label: "1. Lipo sabitliği kontrol edilecek. (Kelepçe ve ÇTB ile sabitleniyor.)"),
        TaskItem(id: "2", label: "2. Çift taraflı bantla sabitlenen elektroniksel komponentlerde oynama olup olmadığı kontrol edilecek."),
        TaskItem(id: "2_1", label: "2.1. Alıcı"),
        TaskItem(id: "2_2", label: "2.2. Telemetri"),
        TaskItem(id: "2_3", label: "2.3. Pixhawk"),
        TaskItem(id: "2_4", label: "2.4. GPS"),
        TaskItem(id: "2_5", label: "2.5. Güç modülü"),
        TaskItem(id: "2_6", label: "2.6. Buzzer"),
        TaskItem(id: "2_7", label: "2.7. Safety switch"),
        TaskItem(id: "2_8", label: "2.8. USB port"),
        TaskItem(id: "2_9", label: "2.9. DC Converter"),
        TaskItem(id: "3", label: "3. Kablo tutucular ve kablo çorapları sabitlenmesine bakılacak."),
        TaskItem(id: "4", label: "4. Vidaların tamamının sıkılmış olduğuna bakılacak."),
        TaskItem(id: "4_1", label: "4.1. Sol şaside 59"),
        TaskItem(id: "4_2", label: "4.2. Sağ şaside 49"),
        TaskItem(id: "4_3", label: "4.3. Stabilizerda 5"),
        TaskItem(id: "5", label: "5. 32 adet aralayıcıların hepsinin takılı olduğu kontrol edilecek."),
        TaskItem(id: "6", label: "6. Yakıt borusunun takılı olup olmadığı kontrol edilecek."),
        TaskItem(id: "6_1", label: "6.1. Karbüratör"),
        TaskItem(id: "6_2", label: "6.2. Egzoz"),
        TaskItem(id: "6_3", label: "6.3. Yakıt İkmal"),
        TaskItem(id: "6_4", label: "6.4. Bu borunun sabitleme aparatına takılı olduğu teyit edilecek."),
        TaskItem(id: "7", label: "7. Yakıt deposu süngerleri sabitliği ve oynama olup olmadığına bakılacak."),
        TaskItem(id: "8", label: "8. Egzoz ve motor bağlantısı düzgünlüğüne bakılacak."),
        TaskItem(id: "9", label: "9. Motor needle ayarından emin olunacak (High needle 2 tur, Middle needle 1 tur)"),
        TaskItem(id: "10", label: "10. Bujinin çalıştığı kontrol edilecek."),
        TaskItem(id: "11", label: "11. Kullanılacak olan buji ısıtıcısının çalışıp çalışmadığı, pilinin doluluğu kontrol edilecek."),
        TaskItem(id: "12", label: "12. Motora buji takılacak."),
        TaskItem(id: "13", label: "13. Egzoz ile motor arasındaki metal plaka takılı olmasına bakılacak."),
        TaskItem(id: "14", label: "14. Havalandırmanın motora çarpmadığı kontrol edilecek ve sabitlenmesine bakılacak."),
        TaskItem(id: "15", label: "15. Ana pal ve kuyruk pallerinin takılış yönleri kontrol edilecek."),
        TaskItem(id: "16", label: "16. İniş takımları sağlamlığı ve sabitliği kontrol edilecek."),
        TaskItem(id: "17", label: "17. Stabilizer ve kuyruk pervanesinin düz bir açıda olması kontrol edilecek."),
        TaskItem(id: "18", label: "18. Alt plakada ve insert somunlarda çıkma olup olmadığı kontrol edilecek."),
        TaskItem(id: "19", label: "19. Kuyruk ve burundan olmak üzere kabuk sabitlenmesi kontrol edilecek."),
        TaskItem(id: "20", label: "20. Görev sistemi sabitliği ve mekanik aksaklık olmadığı kontrol edilecek."),
        TaskItem(id: "21", label: "21. Mekanik Sistem Kontrolü"),
        TaskItem(id: "22_1", label: "22.1. Dişlilerin şasiye temas edip etmediği kontrol edilecek."),
        TaskItem(id: "22_2", label: "22.2. Push rodların düzgün takılı olmasına ve kırılma, çatlak veya herhangi bir bozulma olup olmadığına bakılacak."),
        TaskItem(id: "22_3", label: "22.3. Servo arm ball linkleri sabitliğine bakılacak."),
        TaskItem(id: "22_4", label: "22.4. Rotor kafasının sarsıntısı kontrol edilecek."),
        TaskItem(id: "22_5", label: "22.5. Dişli kontrolü (Hasar ve yağlama kontrolü)"),
        TaskItem(id: "22_5_1", label: "22.5.1. Ana rotor dişlisi"),
        TaskItem(id: "22_5_2", label: "22.5.2. Ana kuyruk dişlisi"),
        TaskItem(id: "22_5_3", label: "22.5.3. Tork tüp Dişlileri"),
        TaskItem(id: "22_5_4", label: "22.5.4. Motor Dişlisi"),
        TaskItem(id: "22_6", label: "22.6. Kuyruk rotoru sabitliği kontrol edilecek."),
        TaskItem(id: "23", label: "23. Pervane açıları kontrol edilecek ve açı değerleri girilecek. (Aşağıdaki soruya girilecek.)"),
  ];

  static Future<void> loadTasks(List<TaskItem> items) async {
    final doc = await FirebaseFirestore.instance.collection("usersOM").doc("userOMId").get();
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
    await FirebaseFirestore.instance.collection("usersOM").doc("userOMId").set(data, SetOptions(merge: true));
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