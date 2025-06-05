import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Kayitlar extends StatefulWidget {
  const Kayitlar({Key? key}) : super(key: key);

  @override
  State<Kayitlar> createState() => _KayitlarState();
}

class _KayitlarState extends State<Kayitlar> {
  List<String> historyList = [];
  List<String> filteredList = [];
  TextEditingController _searchController = TextEditingController();
  bool isAscending = true;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadHistory();
    _searchController.addListener(_filterList);
  }

  Future<void> _loadHistory() async {
    bool success = false;
    int retries = 0;

    setState(() {
      isLoading = true;
    });

    while (!success && retries < 3) {
      try {
        final historyDoc =
            FirebaseFirestore.instance.collection('history').doc('historyId');
        final docSnapshot = await historyDoc.get();
        if (docSnapshot.exists) {
          setState(() {
            historyList = List<String>.from(docSnapshot['history'] ?? []);
            filteredList = List.from(historyList);
          });
        }

        success = true;
      } catch (e) {
        retries++;
        print("Hata: $e. Yeniden denemek için $retries. giriş...");
        if (retries < 3) {
          await Future.delayed(const Duration(seconds: 2));
        }
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  void _filterList() {
    setState(() {
      filteredList = historyList
          .where((item) =>
              item.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  void _toggleSortOrder() {
    setState(() {
      isAscending = !isAscending;
      historyList = historyList.reversed.toList();
      filteredList = filteredList.reversed.toList();
    });
  }

  void _showDetailDialog(String item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Detaylar'),
          content: Text(item),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Kapat',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Kaydedilen Veriler",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(isAscending
                ? Icons.keyboard_double_arrow_down
                : Icons.keyboard_double_arrow_up),
            onPressed: _toggleSortOrder,
          ),
        ],
      ),
      body: Column(
        children: [
          if (historyList.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: "Ara...",
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blue,
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
          Expanded(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
                  )
                : historyList.isEmpty
                    ? const Center(
                        child: Text(
                          "Henüz kayıtlı veri yok",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: filteredList.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              filteredList[index],
                              maxLines: 3,
                            ),
                            leading:
                                const Icon(Icons.history, color: Colors.blue),
                            onTap: () {
                              _showDetailDialog(filteredList[index]);
                            },
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
