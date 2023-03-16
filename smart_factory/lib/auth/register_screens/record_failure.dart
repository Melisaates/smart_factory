import 'package:flutter/material.dart';

class RecordFailure extends StatefulWidget {
  const RecordFailure({Key? key}) : super(key: key);

  @override
  State<RecordFailure> createState() => _MyHomePageState();
}

List<String> arizaliMakine = ["Makine 1", "Makine 2", "Makine 3"];
String arizaliMakinem = arizaliMakine.first;

class _MyHomePageState extends State<RecordFailure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Arıza Kayıt",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            children: <Widget>[
              Container(
                height: 190,
                width: 190,
                child: Image(
                    image: NetworkImage(
                        'https://www.haliyikamamakinalari.com/images/hali-yikama-makinasi-2700.png')),
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
                        value: arizaliMakinem,
                        items: arizaliMakine.map((String myState) {
                          return DropdownMenuItem(
                            value: myState,
                            child: Text(myState),
                          );
                        }).toList(),
                        onChanged: ((String? newValue) {
                          setState(() {
                            arizaliMakinem = newValue!;
                          });
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 27),
              Row(
                children: const [
                  Text('Arıza Nedenini Giriniz ',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '',
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 295.0, top: 27),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Onayla'),
                ),
              ),
            ],
          ),
        )));
  }
}
