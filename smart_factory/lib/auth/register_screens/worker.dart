import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_factory/auth/register_screens/add_worker.dart';
import 'package:smart_factory/auth/register_screens/firebase_mixin.dart';
import 'worker_model.dart';
import 'bottomNavigationBar.dart';

class Workers extends StatefulWidget {
  const Workers({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<Workers> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Workers> with FirebaseMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the Workers object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Personeller'),
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(255, 251, 194, 213),
          child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddWorker()));
            },
            child: Icon(Icons.add),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('workers')
                    .snapshots(),
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

                          final item = Worker(
                            name: currentMap["name"],
                            image: currentMap["image"],
                            department: currentMap["department"],
                            wage: currentMap["wage"],
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
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                      ),
                                      Text("Departmanı: " + item.department),
                                      Text("Maaşı: " + item.wage.toString()),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                deleteData('workers', docId);
                                              },
                                              child: const Text('delete')),
                                          const SizedBox(width: 8),
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
              // child: ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: abc.length,
              //     itemBuilder: (context, index) {
              //       final item = abc[index];
              //       return Padding(
              //         padding: const EdgeInsets.only(right: 1.0),
              //         child: Padding(
              //           padding: const EdgeInsets.only(left: 12.0),
              //           child: Row(children: [
              //             Container(
              //               width: 150,
              //               height: 150,
              //               child: Image.network(item.image),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(left: 8.0),
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     item.name,
              //                   ),

              //                   Text("Departman: " + item.department),
              //                   Text("Maaşı: " + item.wage.toString()),
              //                   Row(
              //                     children: [
              //                       ElevatedButton(
              //                           onPressed: () {
              //                             setState(() {});
              //                           },
              //                           child: const Text('delete')),
              //                       const SizedBox(width: 2),
              //                     ],
              //                   )

              //                   //ButtonBar("")
              //                 ],
              //               ),
              //             )
              //           ]),
              //         ),
              //       );
              //     }),
            )
          ]),
        ));
  }
}
