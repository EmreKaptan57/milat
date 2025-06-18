import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:milat/araclar.dart';
import 'package:milat/kayitlar.dart';

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
          "Orka Elektronik Görev Listesi",
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
        TaskItem(id: "1", label: "1. Lipo şarjı 8.4V mu?"),
        TaskItem(id: "2", label: "2. Lipo batarya kablosu bantlandı mı?"),
        TaskItem(id: "3", label: "3. Güç modülü – DC Converter bağlantısı yapıldı mı?"),
        TaskItem(id: "4_1", label: "4.1. GPS CAN1 portunda mı?"),
        TaskItem(id: "4_2", label: "4.2. Telemetri TELEM1 portunda mı?"),
        TaskItem(id: "4_3", label: "4.3. Power Modül kablosu POWER1 portunda mı?"),
        TaskItem(id: "4_4", label: "4.4. Safety switch GPS1 portunda mı?"),
        TaskItem(id: "4_5", label: "4.5. Buzzer USB portunda mı?"),
        TaskItem(id: "4_6", label: "4.6. Servo kabloları doğru pinlerde mi?"),
        TaskItem(id: "4_7", label: "4.7. Alıcı RC pinlerinde mi?"),
        TaskItem(id: "4_8", label: "4.8. DC converter çıkışı AUX 1’e mi bağlı?"),
        TaskItem(id: "4_9", label: "4.9. RPM sensörü AUX6’ya mı bağlı?"),
        TaskItem(id: "5", label: "5. Pixhawk’ta SD kart takılı mı?"),
        TaskItem(id: "6", label: "6. Alıcı bağlantısı doğru mu?"),
        TaskItem(id: "7_1", label: "7.1. H_SV_MAN parametresi 0 mı?"),
        TaskItem(id: "7_2", label: "7.2. H_RSC_MODE istenilen rsc moduna ayarlandı mı? (3:throttle curve, 4:Autothrottle)"),
        TaskItem(id: "7_3", label: "7.3. RTL parametresi (RTL_ALT : 1500)"),
        TaskItem(id: "7_4_1", label: "7.4.1. BATT_FS_LOW_ACT : 2"),
        TaskItem(id: "7_4_2", label: "7.4.2. BATT_LOW_VOLT : 7.2"),
        TaskItem(id: "7_4_3", label: "7.4.3. BATT_LOW_MAH : 0"),
        TaskItem(id: "7_4_4", label: "7.4.4. BATT_FS_CRT_ACT : 1"),
        TaskItem(id: "7_4_5", label: "7.4.5. BATT_CRT_MAH : 0"),
        TaskItem(id: "7_4_6", label: "7.4.6. BATT_CRT_VOLT : 7"),
        TaskItem(id: "7_5", label: "7.5. Radyo failsafe parametreleri(FS_THR_VALUE, FS_THR_ENABLE)"),
        TaskItem(id: "7_6", label: "7.6. GCS failsafe parametreleri (FS_GCS_ENABLE, FS_GCS_TIMEOUT)"),
        TaskItem(id: "7_7_1", label: "7.7.1. CAN_D1_PROTOCOL: 1"),
        TaskItem(id: "7_7_2", label: "7.7.2. CAN_D2_PROTOCOL: 1"),
        TaskItem(id: "7_7_3", label: "7.7.3. CAN_P1_DRIVER: 1"),
        TaskItem(id: "7_7_4", label: "7.7.4. CAN_P2_DRIVER: 1"),
        TaskItem(id: "7_7_5", label: "7.7.5. GPS_TYPE: 9"),
        TaskItem(id: "7_7_6", label: "7.7.6. NTF_LED_TYPES: 231"),
        TaskItem(id: "8", label: "8. Telemetri anteni takılı mı? Bağlantı başarılı mı?"),
        TaskItem(id: "9", label: "9. Doğru compass seçildi mi? Birinci sırada UAVCAN mı var?"),
        TaskItem(id: "10", label: "10. Mission Planner’da GPS hatası haricinde hata var mı?"),
        TaskItem(id: "11", label: "11. Parametrelerin son hali dosyaya kaydedildi mi?"),
        TaskItem(id: "12", label: "12. Kumandanın pili var mı?"),
        TaskItem(id: "13", label: "13. Radyo kalibrasyonu kontrol edilir. (Throttle, yaw ve roll kanalları için; kanal stick’i ile Mission Planner’daki yeşil barlar ile aynı yönde, Pitch kanalı için ise stick ile yeşil bar zıt yönde hareket etmeli.)"),
        TaskItem(id: "14_1_1", label: "14.1.1. Motor interlock “A” switchinde mi?"),
        TaskItem(id: "14_1_2", label: "14.1.2. Uçuş Modları “C” switchinde mi? (Üstten alta Poshold, guided ve RTL)"),
        TaskItem(id: "15_1", label: "15.1. Throttle çubuğu yükseltildiğinde swashplate yükselmeli. Araç arm durumdaysa karbüratör açılmalı."),
        TaskItem(id: "15_2", label: "15.2. Roll çubuğu itildiğinde swashplate itilen yöne doğru eğilmelidir."),
        TaskItem(id: "15_3", label: "15.3. Pitch çubuğu itildiğinde swashplate itilen yöne doğru eğilmelidir."),
        TaskItem(id: "15_4", label: "15.4. Yaw çubuğu sağa itildiğinde kuyruk pervaneleri sol tarafa doğru dönmelidir."),
        TaskItem(id: "16", label: "16. Servo motorlar hareket ederken herhangi bir takılma, zorlanma var mı?"),
        TaskItem(id: "17", label: "17. Kablajlarda sorun olmamasına ve dişlilere temas edip etmediği kontrol edilecek."),
        TaskItem(id: "18", label: "18. H_RSC_IDLE kontrol edilecek."),
        TaskItem(id: "19", label: "19. H_RSC_RUNUP_TIME kontrol edilecek."),
        TaskItem(id: "20", label: "20. H_RSC_RAMP_TIME kontrol edilecek."),
        TaskItem(id: "21", label: "21. RPM değeri okunduğu kontrol edilecek."),
        TaskItem(id: "22_1", label: "22.1. Görev öncesi testler tamamlandı mı?"),
        TaskItem(id: "22_2", label: "22.2. Görev sonrası testler yapıldı mı?"),
        TaskItem(id: "22_3", label: "22.3. Sisteme dış müdahale gözlemlendi mi?"),
        TaskItem(id: "22_4", label: "22.4. Sistemde olağan dışı bir durum var mıydı?"),
        TaskItem(id: "22_5_1", label: "22.5.1. Lidar sensörü doğru çalışıyor mu?"),
        TaskItem(id: "22_5_2", label: "22.5.2. IR sensör verileri doğru mu?"),
        TaskItem(id: "22_5_3", label: "22.5.3. Barometre verileri uygun mu?"),
        TaskItem(id: "22_5_4", label: "22.5.4. Hava sıcaklığı ve basınç değerleri normal mi?"),
        TaskItem(id: "22_6", label: "22.6. Gimbal kontrolü yapıldı mı?"),
        TaskItem(id: "23", label: "23. Görev tamamlandıktan sonra sistem kapatıldı mı?"),
  ];

  static Future<void> loadTasks(List<TaskItem> items) async {
    final doc = await FirebaseFirestore.instance.collection("usersOE").doc("userOEId").get();
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
    await FirebaseFirestore.instance.collection("usersOE").doc("userOEId").set(data, SetOptions(merge: true));
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