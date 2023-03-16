import 'package:flutter/material.dart';
import 'package:smart_factory/auth/register_screens/firebase_mixin.dart';
import 'package:smart_factory/auth/register_screens/technician.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'machine_model.dart';

class Machines extends StatefulWidget {
  const Machines({Key? key}) : super(key: key);

  @override
  State<Machines> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Machines> with FirebaseMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Makineler'),
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(255, 251, 194, 213),
          child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Technician()));
            },
            child: const Text('Teknisyen Ekranına Geç',
                style: TextStyle(color: Color.fromARGB(255, 113, 113, 113))),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('machines')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.active) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  }

                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          final Map<String, dynamic> currentMap =
                              snapshot.data!.docs[index].data()
                                  as Map<String, dynamic>;
                          final docId = snapshot.data!.docs[index].id;

                          final item = Machine(
                            name: currentMap['name'],
                            image: currentMap['image'],
                            failure_type: currentMap['failure_type'],
                            state: currentMap['state'],
                            failure_statement: currentMap['failure_statement'],
                          );
                          return Padding(
                            padding: const EdgeInsets.only(right: 1.0),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Row(children: [
                                SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Image.network(item.image),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                      ),
                                      Text("Durumu: ${item.state}"),
                                      Text("Arıza Türü: ${item.failure_type}"),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              updateData(
                                                  'machines',
                                                  docId,
                                                  machineProperties(
                                                      name: item.name,
                                                      image: item.image,
                                                      state:
                                                          item.state == 'Açık'
                                                              ? 'Kapalı'
                                                              : 'Açık',
                                                      failure_type:
                                                          item.failure_type,
                                                      failure_statement: item
                                                          .failure_statement));
                                            },
                                            child: item.state == "Açık"
                                                ? const Text('Kapat')
                                                : const Text('Aç'),
                                          ),
                                          const SizedBox(width: 8),
                                          Visibility(
                                            visible: item.failure_type != "yok"
                                                ? true
                                                : false,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                              context) =>
                                                          AlertDialog(
                                                              content: Text(
                                                                  'DİKKAT!!! ${item.name} isimli makine için teknik destek gerekmektedir'),
                                                              actions: <
                                                                  TextButton>[
                                                                TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: const Text(
                                                                        'Tamam'))
                                                              ]));
                                                },
                                                child: const Text(
                                                    'Teknisyeni Çağır')),
                                          )
                                        ],
                                      )

                                      //ButtonBar("")
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      });
                },
              ),
            )
          ]),
        ));
  }
}
