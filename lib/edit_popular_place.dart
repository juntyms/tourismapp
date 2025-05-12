import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditPopularPlace extends StatefulWidget {
  String popularname;
  String price;
  String docId;

  EditPopularPlace(
      {super.key,
      required this.popularname,
      required this.price,
      required this.docId});

  @override
  State<EditPopularPlace> createState() => _EditPopularPlaceState();
}

class _EditPopularPlaceState extends State<EditPopularPlace> {
  final TextEditingController _popularname = TextEditingController();
  final TextEditingController _price = TextEditingController();

  Future updatePopularPlace() async {
    await FirebaseFirestore.instance
        .collection('places')
        .doc(widget.docId)
        .update({
          'placename': _popularname.text.trim(),
          'price': _price.text.trim(),
        })
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Updated Successfully'))))
        .catchError(
            (error) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Failed to update popular place: $error'),
                )));
  }

  @override
  void dispose() {
    _popularname.dispose();
    _price.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Popular Place'),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _popularname..text = widget.popularname,
                decoration: InputDecoration(
                  labelText: 'Place Name',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _price..text = widget.price,
                decoration: InputDecoration(
                  labelText: 'Price',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  updatePopularPlace();
                },
                child: Text('Update'),
              ),
            ],
          )),
    );
  }
}
