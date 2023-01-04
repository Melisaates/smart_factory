import 'package:flutter/material.dart';

class AddDoor extends StatefulWidget {
  const AddDoor({super.key});

  @override
  State<AddDoor> createState() => _AddDoorState();
}

List<String> states = ['Açık', 'Kilitli'];
String text_controller = "";

class _AddDoorState extends State<AddDoor> {
  String kapiDurumu = states.first;
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
            SizedBox(height: 30),
            Row(
              children: const [
                Text('Kapı Adı: ',
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
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                children: [
                  const Text('Makine Durumu   :',
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
