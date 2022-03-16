import 'package:eye_examination/models/transaction.dart';
import 'package:flutter/material.dart';
import '../home_screen.dart';

final List listAnswer = [74, 6, 16, 2, 29, 7, 45, 5, 97, 8, 42, 3];
final List listAnswer2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

class ColorBlindResult extends StatelessWidget {
  final int _totalScore;
  final String _nameUser;
  final List _ansList;
  ColorBlindResult(this._totalScore, this._nameUser, this._ansList);
  static const routeName = "/bottomBarSelect";
  void _addColorblindTx(String userName, String note, String totalScore) {
    final _newDetailColorBlind =
        UserTransaction(name: userName, notes: note, score: totalScore);
    transactions.add(_newDetailColorBlind);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 104,
            margin: const EdgeInsets.only(top: 38),
            //color: Colors.grey,
            child: Column(
              children: [
                Container(
                  // color: Colors.red,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      // color: Colors.grey,
                      borderRadius: BorderRadiusDirectional.circular(4)),
                  child: Column(
                    children: [
                      const Text(
                        "Test Result",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 2),
                      Text("Score(${_totalScore.toString()}/12)"),
                      //Text("Score (0/12)")
                    ],
                  ),
                ),
                _totalScore > 1
                    ? const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text('"Normal Color Vision"'),
                      )
                    : Container(
                        padding: const EdgeInsets.only(top: 12),
                        child: Column(
                          children: const [
                            Text('"Have color blindness vision"'),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "In this case, it would be advisable to visit a doctor for further examination",
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
              ],
            ),
          ),
          const SizedBox(height: 12),
          DataTable(
            dividerThickness: 1,
            columnSpacing: 56,
            dataRowHeight: 20,
            headingRowHeight: 23,
            headingRowColor: MaterialStateColor.resolveWith(
                (states) => Colors.grey.shade400),
            border: TableBorder.all(width: 2, color: Colors.white),
            horizontalMargin: 50,
            // showBottomBorder: true,
            columns: const [
              DataColumn(
                  label: Center(
                child: FittedBox(
                  child: Text("Yours Answers"),
                  //alignment: Alignment.center,
                ),
              )),
              DataColumn(
                  label: FittedBox(
                child: Text("Answers"),
                alignment: Alignment.center,
              ))
            ],
            rows: List.generate(listAnswer.length, (index) {
              return DataRow(
                  cells: [
                    DataCell(Center(
                      child: Text(
                        "${_ansList[index]}",
                        // textAlign: TextAlign.center,
                      ),
                    )),
                    DataCell(Center(
                      child: Text(
                        "${listAnswer[index]}",
                        textAlign: TextAlign.center,
                      ),
                    ))
                  ],
                  color: MaterialStateColor.resolveWith(
                    (states) {
                      if (index % 2 == 0) {
                        return Colors.grey.shade300;
                      } else {
                        return Colors.grey.shade200;
                      }
                    },
                  ));
            }),
          ),
          const SizedBox(
            height: 25,
          ),
          Column(
            children: [
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  _addColorblindTx(
                      _nameUser, "Color Blind", _totalScore.toString());
                  //  print(answersList);
                  _ansList.clear();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => BottomBarSelect()),
                  // );
                  Navigator.pushNamed(context, ColorBlindResult.routeName);
                },
                color: Colors.blue.shade200,
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: const [
                    Icon(
                      Icons.save_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


// List.generate(listAnswer.length, (index) {
//         return DataRow(cells: DataCell[listAnswer.asMap()[index]]);
//       }),



// Center(
//           child: Container(
//               margin: const EdgeInsets.only(top: 20),
//               // color: Colors.grey,
//               width: 200,
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                   border: Border.all(width: 1),
//                   // color: Colors.grey,
//                   borderRadius: BorderRadiusDirectional.circular(5)),
//               child: Column(
//                 children: const [
//                   Text("Test Result"),
//                   Text("Normal"),
//                   Text("Score(12/12)")
//                 ],
//               )),
//         ),
        // const SizedBox(
        //   height: 20,
        // ),
        
