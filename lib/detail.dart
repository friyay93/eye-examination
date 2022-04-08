import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_examination/color_blind_detail.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

class Detail extends StatelessWidget {
  final detailTransaction;
  final int _indexDetail;
  Detail(this.detailTransaction, this._indexDetail);
  @override
  Widget build(BuildContext context) {
    print(detailTransaction);
    print(detailTransaction[_indexDetail]);
    print(detailTransaction[_indexDetail]['name']);
    // return colorCase == "Color Blind" ? DetailColorBlind() : Text("Hello");
    return Scaffold(
      appBar: AppBar(
        title: Text("details"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(detailTransaction[_indexDetail]['name']),
              Text(detailTransaction[_indexDetail]['notes']),
              Text(detailTransaction[_indexDetail]['score'])
            ],
          ),
        ),
      ),
    );
  }
}
