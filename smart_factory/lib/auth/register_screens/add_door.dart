import 'package:flutter/material.dart';
import 'package:smart_factory/auth/register_screens/firebase_mixin.dart';

class AddDoor extends StatefulWidget {
  const AddDoor({super.key});

  @override
  State<AddDoor> createState() => _AddDoorState();
}

class _AddDoorState extends State<AddDoor> with FirebaseMixin {
  late String kapiDurumu = states.first;
  final myController = TextEditingController();
  List<String> states = ['Açık', 'Kilitli'];
  String text_controller = "";
  String name = 'Açık';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kapı Ekleme'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 85),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                const Text('Kapı Adı: ',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                //SizexedBox(width: 30),
                Expanded(
                  child: TextField(
                      controller: myController,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '',
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                children: [
                  const Text('Kapı Durumu   :          ',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(left: 152.0),
                    child: DropdownButton(
                      value: kapiDurumu,
                      items: states.map((String myState) {
                        return DropdownMenuItem(
                          value: myState,
                          child: Text(myState),
                        );
                      }).toList(),
                      onChanged: ((String? newValue) {
                        setState(() {
                          kapiDurumu = newValue!;
                          text_controller = newValue;
                        });
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 320),
              child: FloatingActionButton(
                onPressed: () {
                  addData(
                      'doors',
                      doorProperties(
                          name: myController.text,
                          image: ' ',
                          state: text_controller));
                },
                child: const Text(
                  'Ekle',
                  style: const TextStyle(color: Colors.white),
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
