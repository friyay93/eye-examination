import 'package:eye_examination/color_blind_detail.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

class Detail extends StatelessWidget {
  final UserTransaction detailTransaction;
  final int _indexDetail;
  Detail(this.detailTransaction, this._indexDetail);
  @override
  Widget build(BuildContext context) {
    // return colorCase == "Color Blind" ? DetailColorBlind() : Text("Hello");
    return detailTransaction.notes ==
            "Color Blind" //ถ้าเป็น detection จะลิงค์ไปอีกหน้า
        ? ColorBlindDetail(_indexDetail)
        : Container();
  }
}
