import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_factory/auth/register_screens/firebase_mixin.dart';
import 'package:smart_factory/auth/register_screens/machines.dart';

class AddMachine extends StatefulWidget {
  const AddMachine({Key? key}) : super(key: key);

  @override
  State<AddMachine> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AddMachine> with FirebaseMixin {
  late String makineDurumu = states.first;
  final myController = TextEditingController();
  List<String> states = ['Açık', 'Kapalı'];

  String text_controller = "";
  String name = "Açık";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the AddMachine object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Makine Ekleme'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 15),
              const SizedBox(
                width: 191,
                height: 191,
                child: Image(
                    image: NetworkImage(
                        'https://www.haliyikamamakinalari.com/images/hali-yikama-makinasi-2700.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  children: [
                    const Text('Makine Adı           : ',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 30),
                    Expanded(
                      child: TextField(
                          controller: myController,
                          maxLines: 1,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '',
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  children: [
                    const Text('Makine Durumu   :',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.only(left: 152.0),
                      child: DropdownButton(
                        value: makineDurumu,
                        items: states.map((String myState) {
                          return DropdownMenuItem(
                            value: myState,
                            child: Text(myState),
                          );
                        }).toList(),
                        onChanged: ((String? newValue) {
                          setState(() {
                            makineDurumu = newValue!;
                            text_controller = newValue;
                          });
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 295.0, top: 15),
                child: ElevatedButton(
                  onPressed: () {
                    addData(
                        'machines',
                        machineProperties(
                            name: myController.text,
                            image:
                                'https://www.haliyikamamakinalari.com/image/hali-yikama-makinasi-2700.png',
                            state: text_controller,
                            failure_type: 'yok',
                            failure_statement: ''));
                  },
                  child: const Text('Ekle'),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     veriEklemeSet();
              //   },
              //   child: const Text('set'),
              // ),
              //  ElevatedButton(
              //   onPressed: () {
              //     update_machine();
              //   },
              //   child: const Text('set'),
              // )
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // void veriEklemeSet() async {
  //   await firestore
  //       .doc('machines/OIsxQ6Dtg2F2gOcYToxK')
  //       .set({'name': 'melisa'}, SetOptions(merge: true));
  //  // firestore.collection('machines').doc().id;=>id oluşturma
  // }
//   void update_machine async {
// await firestore
//         .doc('machines/OIsxQ6Dtg2F2gOcYToxK')
//         .update({'name': 'nuray'});
//    // firestore.collection('machines').doc().id;=>id oluşturma
//   }
}
