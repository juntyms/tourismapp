import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tourismapp/edit_popular_place.dart';

class ViewPopularPage extends StatefulWidget {
  const ViewPopularPage({super.key});

  @override
  State<ViewPopularPage> createState() => _ViewPopularPageState();
}

class _ViewPopularPageState extends State<ViewPopularPage> {
  deletePlace(docId) async {
    final result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text(
          'This action is permanent and can not be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          )
        ],
      ),
    );
    if (result == true) {
      await FirebaseFirestore.instance.collection('places').doc(docId).delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('View Popular Place'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('places').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var docId = snapshot.data!.docs[index].id;
                    var placeName = snapshot.data!.docs[index]['placename'];
                    var placePrice = snapshot.data!.docs[index]['price'];
                    return Card(
                      child: ListTile(
                        title: Text(placeName),
                        subtitle: Text(placePrice),
                        trailing:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          GestureDetector(
                              child: Icon(Icons.edit),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return EditPopularPlace(
                                      popularname: placeName,
                                      price: placePrice,
                                      docId: docId);
                                }));
                              }),
                          GestureDetector(
                              child: Icon(Icons.delete),
                              onTap: () {
                                deletePlace(docId);
                              }),
                        ]),
                      ),
                    );
                  },
                );
              }
              return Container();
            }),
      ),
    );
  }
}
