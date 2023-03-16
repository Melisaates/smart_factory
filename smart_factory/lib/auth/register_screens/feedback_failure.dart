import 'package:flutter/material.dart';

class FeedbackFailure extends StatefulWidget {
  const FeedbackFailure({super.key});

  @override
  State<FeedbackFailure> createState() => _FeedbackFailureState();
}

class _FeedbackFailureState extends State<FeedbackFailure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arızalı Makineler'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 90, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: <Widget>[
                const SizedBox(
                  height: 100,
                  width: 190,
                  child: Image(
                      image: NetworkImage(
                          'https://www.haliyikamamakinalari.com/images/hali-yikama-makinasi-2700.png'),
                      height: 10,
                      width: 10),
                ),
                Column(children: [
                  const Text("3 numaralı makine",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(children: const [
                    Text("Durumu:"),
                    Text(
                      "Kapalı",
                      style: TextStyle(color: Colors.red),
                    ),
                  ]),
                  const Text('Arıza Türü:Bilinmeyen')
                ])
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50.0, bottom: 7.5),
              child: Text('Arıza Açıklaması',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: '256 karakter giriniz.',
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 241.2, top: 20, bottom: 10),
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Arıza Giderildi')),
            ),
            //Container(height: 1, width: 100)
          ],
        ),
      ),
    );
  }
}
