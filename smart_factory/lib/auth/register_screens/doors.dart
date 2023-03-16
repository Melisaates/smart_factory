import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_factory/auth/register_screens/add_door.dart';
import 'package:smart_factory/auth/register_screens/bottomNavigationBar.dart';
import 'package:smart_factory/auth/register_screens/firebase_mixin.dart';
import 'door_model.dart';




class Doors extends StatefulWidget {
  const Doors({Key? key}) : super(key: key);

  @override
  State<Doors> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Doors> with FirebaseMixin {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kapılar'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 251, 194, 213),
        child: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddDoor()));
          },
          child: Icon(Icons.add),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('doors').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.active) {
                    return Center(child: CircularProgressIndicator.adaptive());
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

                          final item = Door(
                            name: currentMap["name"],
                            image: currentMap["image"],
                            state: currentMap["state"],
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
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                      ),

                                      Row(
                                        children: [
                                          Text("Durumu:"),
                                          Text(item.state,
                                              style: TextStyle(
                                                  color: item.state == "Açık"
                                                      ? Colors.green
                                                      : Colors.red)),
                                        ],
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            if (item.state == "Açık") {}
                                            updateData(
                                                'doors',
                                                docId,
                                                doorProperties(
                                                  name: item.name,
                                                  image: item.image,
                                                  state: item.state == "Açık"
                                                      ? 'Kilitli'
                                                      : 'Açık',
                                                ));

                                            // setState(() {
                                            //   item.state == "Açık"
                                            //       ? item.state = "kilitli"
                                            //       : item.state = "Açık";
                                            // });
                                          },
                                          child: item.state == "Açık"
                                              ? const Text("Kilitle")
                                              : const Text("Aç"))

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
              // child: ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: my_doors.length,
              //     itemBuilder: (context, index) {
              //       final item = my_doors[index];
              //       return Padding(
              //         padding: const EdgeInsets.only(right: 1.0),
              //         child: Padding(
              //           padding: const EdgeInsets.only(left: 12.0),
              //           child: Row(children: [
              //             Container(
              //               width: 150,
              //               height: 150,
              //               child: Image.network(
              //                 item.image,
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(left: 8.0),
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     item.name,
              //                     style: const TextStyle(
              //                         fontWeight: FontWeight.bold),
              //                   ),
              //                   Row(
              //                     children: [
              //                       Text("Durumu:"),
              //                       Text(item.state,
              //                           style: TextStyle(
              //                               color: item.state == "Açık"
              //                                   ? Colors.green
              //                                   : Colors.red)),
              //                     ],
              //                   ),
              //                   ElevatedButton(
              //                       onPressed: () {
              //                         setState(() {
              //                           item.state == "Açık"
              //                               ? item.state = "kilitli"
              //                               : item.state = "Açık";
              //                         });
              //                       },
              //                       child: item.state == "Açık"
              //                           ? const Text("kilitle")
              //                           : const Text("Aç"))
              //                 ],
              //               ),
              //             )
              //           ]),
              //         ),
              //       );
              //     }),
            ),
          )
        ]),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
