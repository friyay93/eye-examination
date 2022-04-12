import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestVideo extends StatefulWidget {
  @override
  State<TestVideo> createState() => _TestVideoState();
}

class _TestVideoState extends State<TestVideo> {
  String url = "https://www.facebook.com/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("test"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
