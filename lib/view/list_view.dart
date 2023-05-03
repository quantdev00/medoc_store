import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drug_store/backend/services/firebase_crud.dart';
import 'package:drug_store/view/add_page.dart';
import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  @override
  State<MyListView> createState() => _ListViewState();
}

class _ListViewState extends State<MyListView> {
  // String myString = ;
  final Stream<QuerySnapshot> collectionReference =
      FirebaseCrud.getDrugRecord();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Drug list"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.app_registration,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const AddPage()),
                ),
              );
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: collectionReference,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                ),
                child: ListView(
                  children: snapshot.data!.docs.map((e) {
                    return Card(
                      child: Column(children: [
                        ListTile(
                          title: Text(e["drug_name"]),
                          subtitle: Container(
                              child: (Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Description: " + e['description'],
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                "Price : " + e['price'],
                                style: const TextStyle(fontSize: 12),
                              )
                            ],
                          ))),
                        )
                      ]),
                    );
                  }).toList(),
                ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
