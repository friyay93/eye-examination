import 'package:eye_examination/color_blind_instruction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ColorBlindForm extends StatefulWidget {
  @override
  State<ColorBlindForm> createState() => _ColorBlindFormState();
}

class _ColorBlindFormState extends State<ColorBlindForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _textcontroller = TextEditingController();

  // void _addtx(String name) {
  //   final newtx = Transactions(name: name, note: "Color Blind");
  //   widget._transactions.add(newtx);
  // }
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: const Text("Color Blind"), automaticallyImplyLeading: true),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Form(
                  key: _formKey,
                  child: user == null
                      ? TextFormField(
                          controller: _textcontroller,
                          decoration: const InputDecoration(
                              hintText: "Enter your name",
                              labelText: "Name",
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        )
                      : TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter your name",
                              labelText: "Name",
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          initialValue: user!.displayName,
                        )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // sumbit button
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ColorBlindInstruction(_textcontroller.text)),
                    );
                  }
                },
                child: const Text('Next'),
              ),
            ),
          ],
        ));
  }
}
