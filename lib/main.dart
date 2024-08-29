import 'package:flutter/material.dart';

void main() {
  runApp(NilaiSiswaApp());
}


class NilaiSiswaApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pengelompokan Nilai Siswa',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NilaiSiswaHomePage(),
    );
  }
}

class NilaiSiswaHomePage extends StatefulWidget {
  @override
  _NilaiSiswaHomePageState createState() => _NilaiSiswaHomePageState();
}

class _NilaiSiswaHomePageState extends State<NilaiSiswaHomePage> {
  final TextEditingController _nilaiController = TextEditingController();
  String _hasilKategori = '';

  void _hitungKategori() {
    setState(() {
      final nilai = int.tryParse(_nilaiController.text);

      if (nilai == null || nilai < 0 || nilai > 100) {
        _hasilKategori = 'Nilai tidak valid. Masukkan nilai antara 0 - 100.';
      } else if (nilai >= 85 && nilai <= 100) {
        _hasilKategori = ' Grade A';
      } else if (nilai >= 70 && nilai <= 84) {
        _hasilKategori = 'Grade B';
      } else if (nilai >= 55 && nilai <= 69) {
        _hasilKategori = 'Grade C';
      } else {
        _hasilKategori = 'Garde D';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nilai Siswa' , style: TextStyle(fontWeight:FontWeight.bold),),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nilaiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Nilai Siswa',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _hasilKategori,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: _hitungKategori,
              child: Text(
                'Hitung',
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              iconAlignment: IconAlignment.end,
              style: ButtonStyle(
               backgroundColor: WidgetStatePropertyAll(Colors.blue)
              )
            ),
          ],
        ),
      ),
    );
  }
}
