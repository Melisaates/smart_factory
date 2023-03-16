import 'package:flutter/material.dart';
import 'package:smart_factory/auth/register_screens/firebase_mixin.dart';
import 'package:smart_factory/auth/register_screens/worker.dart';

class AddWorker extends StatefulWidget {
  const AddWorker({super.key});

  @override
  State<AddWorker> createState() => _AddWorkerState();
}

class _AddWorkerState extends State<AddWorker> with FirebaseMixin {
  final TextEditingController name = TextEditingController();
  final TextEditingController department = TextEditingController();
  final TextEditingController wage = TextEditingController();

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
            const SizedBox(height: 30),
            Row(
              children: [
                const Text('Adı-Soyadı: ',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                //SizexedBox(width: 30),
                Expanded(
                  child: TextField(
                      controller: name,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '',
                      )),
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Text('Departmanı: ',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                //SizedBox(width: 30),
                Expanded(
                  child: TextField(
                      controller: department,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: '',
                      )),
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Text('Maaşı:           ',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                //SizedBox(width: 30),
                Expanded(
                  child: TextField(
                      controller: wage,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '',
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 320),
              child: FloatingActionButton(
                onPressed: () {
                  addData(
                      'workers',
                      workerProperties(
                          name: name.text,
                          department: department.text,
                          state: 'çalışıyor',
                          wage: int.parse(wage.text)));
                },
                child: Text(
                  'Ekle',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: const Color.fromARGB(255, 243, 42, 109),
              ),
            )
          ],
        ),
      ),
    );
  }
}
