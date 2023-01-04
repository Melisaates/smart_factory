import 'package:flutter/material.dart';

class AddWorker extends StatefulWidget {
  const AddWorker({super.key});

  @override
  State<AddWorker> createState() => _AddWorkerState();
}

class _AddWorkerState extends State<AddWorker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personel Ekleme'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 35),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              children: const [
                Text('Adı-Soyadı: ',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                //SizexedBox(width: 30),
                Expanded(
                  child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '',
                      )),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: const [
                Text('Departmanı: ',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                //SizedBox(width: 30),
                Expanded(
                  child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '',
                      )),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: const [
                Text('Maaşı:           ',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                //SizedBox(width: 30),
                Expanded(
                  child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '',
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 320),
              child: FloatingActionButton(
                onPressed: () {},
                child: Text(
                  'Ekle',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Color.fromARGB(255, 243, 42, 109),
              ),
            )
          ],
        ),
      ),
    );
  }
}
