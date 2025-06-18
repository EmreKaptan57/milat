//yapım aşamasında...

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class YkiMicPage extends StatefulWidget {
  const YkiMicPage({Key? key}) : super(key: key);

  @override
  State<YkiMicPage> createState() => _YkiMicPageState();
}

class _YkiMicPageState extends State<YkiMicPage> {
  final TextEditingController _pythonIpController =
      TextEditingController(text: '127.0.0.1');
  final TextEditingController _pythonPortController =
      TextEditingController(text: '14550');

  RawDatagramSocket? _socketRecv;
  final int _flutterRecvPort = 14550;

  String _statusText = "Bağlanmadı";
  double? _lastLat, _lastLon, _lastAlt;

  @override
  void initState() {
    super.initState();
    _startFlutterListener();
  }

  @override
  void dispose() {
    _socketRecv?.close();
    super.dispose();
  }

  void _startFlutterListener() async {
    try {
      _socketRecv =
          await RawDatagramSocket.bind(InternetAddress.anyIPv4, _flutterRecvPort);
      print("[FlutterBridge] Dinleyici başlatıldı: port $_flutterRecvPort");

      _socketRecv!.listen((RawSocketEvent event) {
        if (event != RawSocketEvent.read) return;
        final dg = _socketRecv!.receive();
        if (dg == null) return;

        try {
          final msg = jsonDecode(utf8.decode(dg.data));
          _processPythonMessage(msg);
        } catch (e) {
          print("[FlutterBridge] Geçersiz JSON geldi: ${dg.data}");
        }
      });
    } catch (e) {
      print("[FlutterBridge] Dinleyici hata: $e");
    }
  }

  void _processPythonMessage(Map<String, dynamic> msg) {
    String type = msg['type'] ?? '';
    switch (type) {
      case "MODE_ACK":
        int result = msg['result'] ?? -1;
        setState(() {
          _statusText = "GUIDED ACK: $result";
        });
        break;
      case "ARM_ACK":
        int result = msg['result'] ?? -1;
        setState(() {
          _statusText = "ARM ACK: $result";
        });
        break;
      case "TAKEOFF_ACK":
        int result = msg['result'] ?? -1;
        setState(() {
          _statusText = "TAKEOFF ACK: $result";
        });
        break;
      case "LAND_ACK":
        int result = msg['result'] ?? -1;
        setState(() {
          _statusText = "LAND ACK: $result";
        });
        break;
      case "POSITION":
        double lat = (msg['lat'] ?? 0.0).toDouble();
        double lon = (msg['lon'] ?? 0.0).toDouble();
        double alt = (msg['alt'] ?? 0.0).toDouble();
        setState(() {
          _lastLat = lat;
          _lastLon = lon;
          _lastAlt = alt;
          _statusText = "Konum alındı";
        });
        break;
      default:
        print("[FlutterBridge] Bilinmeyen mesaj tipi: $type");
    }
  }

  void _sendCommandToPython(String cmd) async {
    final String ip = _pythonIpController.text;
    final int port = int.tryParse(_pythonPortController.text) ?? 14550;
    try {
      final sender = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
      final msg = jsonEncode({"cmd": cmd});
      sender.send(utf8.encode(msg), InternetAddress(ip), port);
      sender.close();
      setState(() {
        _statusText = "Komut gönderildi: $cmd";
      });
    } catch (e) {
      setState(() {
        _statusText = "Gönderme hatası: $e";
      });
    }
  }

  void _onMicButtonPressed() {
    
  }

  @override
  Widget build(BuildContext context) {
    final latText = _lastLat?.toStringAsFixed(6) ?? "--";
    final lonText = _lastLon?.toStringAsFixed(6) ?? "--";
    final altText = _lastAlt?.toStringAsFixed(2) ?? "--";

    return Scaffold(
      appBar: AppBar(
        title: Text('Lat: $latText  Lon: $lonText  Alt: $altText m'),
      ),
      body: Stack( 
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("yapım aşamasındadır..."),
                TextField(
                  controller: _pythonIpController,
                  decoration: const InputDecoration(labelText: 'Python IP Adresi'),
                ),
                TextField(
                  controller: _pythonPortController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Python Port (14550)'),
                ),
                const SizedBox(height: 10),
                Text("Durum: $_statusText"),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: () => _sendCommandToPython("GUIDED"),
                      child: const Text('Guided'),
                    ),
                    ElevatedButton(
                      onPressed: () => _sendCommandToPython("ARM"),
                      child: const Text('Arm'),
                    ),
                    ElevatedButton(
                      onPressed: () => _sendCommandToPython("TAKEOFF"),
                      child: const Text('Takeoff'),
                    ),
                    ElevatedButton(
                      onPressed: () => _sendCommandToPython("LAND"),
                      child: const Text('Autoland'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter, 
            child: Padding(
              padding: const EdgeInsets.only(bottom: 120.0), 
              child: FloatingActionButton(
                onPressed: _onMicButtonPressed,
                child: const Icon(
                  Icons.mic, 
                  size: 30.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}