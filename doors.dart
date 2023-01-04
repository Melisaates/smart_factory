import 'package:flutter/material.dart';
import 'package:smart_factory/auth/register_screens/add_door.dart';
import 'package:smart_factory/auth/register_screens/bottomNavigationBar.dart';
import 'door_model.dart';

List<Map<String, dynamic>> doors = [
  {
    'name': 'Bir numaralı kapı',
    'image':
        'https://beysanaluminyum.com/wp-content/uploads/2018/06/al%C3%BCminyum-bina-kapisi.png',
    'state': 'Açık',
  },
  {
    'name': 'İki numaralı kapı',
    'image':
        'https://beysanaluminyum.com/wp-content/uploads/2018/06/al%C3%BCminyum-bina-kapisi.png',
    'state': 'Kilitli',
  },
  {
    'name': 'Üç numaralı kapı',
    'image':
        'https://beysanaluminyum.com/wp-content/uploads/2018/06/al%C3%BCminyum-bina-kapisi.png',
    'state': 'Açık',
  },
  {
    'name': 'Dört numaralı kapı',
    'image':
        'https://beysanaluminyum.com/wp-content/uploads/2018/06/al%C3%BCminyum-bina-kapisi.png',
    'state': 'Kilitli',
  }
];

List<Door> my_doors = doors.map((e) => Door.fromJson(e)).toList();

class Doors extends StatefulWidget {
  const Doors({Key? key}) : super(key: key);

  @override
  State<Doors> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Doors> {
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
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: my_doors.length,
                  itemBuilder: (context, index) {
                    final item = my_doors[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 1.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Row(children: [
                          Container(
                            width: 150,
                            height: 150,
                            child: Image.network(
                              item.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
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
                                      setState(() {
                                        item.state == "Açık"
                                            ? item.state = "kilitli"
                                            : item.state = "Açık";
                                      });
                                    },
                                    child: item.state == "Açık"
                                        ? const Text("kilitle")
                                        : const Text("Aç"))
                              ],
                            ),
                          )
                        ]),
                      ),
                    );
                  }),
            ),
          )
        ]),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
