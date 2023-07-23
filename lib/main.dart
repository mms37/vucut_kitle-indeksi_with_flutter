import 'package:flutter/material.dart';

void main() => runApp(VKIHesaplamaApp());

class VKIHesaplamaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VKIHesaplamaPage(),
    );
  }
}

class VKIHesaplamaPage extends StatefulWidget {
  @override
  _VKIHesaplamaPageState createState() => _VKIHesaplamaPageState();
}

class _VKIHesaplamaPageState extends State<VKIHesaplamaPage> {
  TextEditingController kiloController = TextEditingController();
  TextEditingController boyController = TextEditingController();
  double vkiSonuc = 0.0;
  String vkiDurumu = '';

  void _hesaplaVKI() {
    double kilo = double.tryParse(kiloController.text) ?? 0;
    double boy = double.tryParse(boyController.text) ?? 0;

    if (kilo > 0 && boy > 0) {
      double vki = kilo / ((boy / 100) * (boy / 100));
      setState(() {
        vkiSonuc = vki;
        vkiDurumu = _getVKIDurumu(vki);
      });
    } else {
      setState(() {
        vkiSonuc = 0.0;
        vkiDurumu = '';
      });
    }
  }

  String _getVKIDurumu(double vki) {
    if (vki < 18.5) {
      return 'Zayıf';
    } else if (vki >= 18.5 && vki < 25) {
      return 'Normal';
    } else if (vki >= 25 && vki < 30) {
      return 'Fazla Kilolu';
    } else {
      return 'Obez';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VKI Hesaplama with Mert Mustafa Şen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: kiloController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Kilo (kg)"),
            ),
            SizedBox(height: 16),
            TextField(
              controller: boyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Boy (cm)"),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _hesaplaVKI,
              child: Text("VKI Hesapla"),
            ),
            SizedBox(height: 16),
            Text("VKI Sonucu: ${vkiSonuc.toStringAsFixed(2)}"),
            Text("Durumu: $vkiDurumu"),
          ],
        ),
      ),
    );
  }
}
