import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestVideo extends StatefulWidget {
  @override
  State<TestVideo> createState() => _TestVideoState();
}

class _TestVideoState extends State<TestVideo> {
  _addUser(CollectionReference users) {
    return users.add({"fullname": "Alice", "company": "KMITL"}).then(
        (value) => print(value.get()));
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection("video");

    return Scaffold(
      body: const Center(
        child: Text("test"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addUser(users),
        child: const Icon(Icons.add),
      ),
    );
  }
}
