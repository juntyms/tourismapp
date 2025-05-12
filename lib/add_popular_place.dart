import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddPopularPlace extends StatefulWidget {
  const AddPopularPlace({super.key});

  @override
  State<AddPopularPlace> createState() => _AddPopularPlaceState();
}

class _AddPopularPlaceState extends State<AddPopularPlace> {
  final TextEditingController _placename = TextEditingController();
  final TextEditingController _price = TextEditingController();

  Future addPopular() async {
    await FirebaseFirestore.instance
        .collection('places')
        .add({
          'placename': _placename.text.trim(),
          'price': _price.text.trim(),
        })
        .then(
          (value) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Added Successfully'))),
        )
        .catchError(
            (error) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Failed to add popular place: $error'),
                )));
  }

  @override
  void dispose() {
    _placename.dispose();
    _price.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Popular Place'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.green),
        padding: EdgeInsets.all(10),
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          Text('Popular Place Entry Form',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _placename,
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
            controller: _price,
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
              addPopular();
            },
            child: Text('Add'),
          )
        ]),
      ),
    );
  }
}
