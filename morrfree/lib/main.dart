import 'package:flutter/material.dart';

void main() {
  runApp(CreditApp());
}

class CreditApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Credit Card Input Exercise"),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _key1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  value = value.toString();
                  if ((new RegExp(
                      r'^4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|^(222[1-9]|22[3-9]\\d|2[3-6]\\d{2}|27[0-1]\\d|2720)[0-9]{12}|6(?:011|5[0-9]{2})[0-9]{12}|3[47]\d{13,14}$'))
                      .hasMatch(value)) {
                    if (Luhn(value)) {
                      return null;
                    }
                  }
                  return "Credit card Number is not appropriate";
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: " Credit Card number",
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.green, width: 2.0),
                  ),
                ),
                autocorrect: false,
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        value = value.toString();
                        if ((new RegExp(r'[0-3][0-9][/][0-9][0-9]'))
                            .hasMatch(value)) {
                          return null;
                        }
                        return "Expiry date is Invalid";
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Expiry date(MM/YY)",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.green, width: 2.0),
                        ),
                      ),
                      autocorrect: false,
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        value = value.toString();
                        if ((new RegExp(r'^[0-9]{3,4}$')).hasMatch(value)) {
                          return null;
                        }
                        return " Security Code is Invalid";
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: " CVV",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.green, width: 2.0),
                        ),
                      ),
                      autocorrect: false,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        value = value.toString();
                        if ((new RegExp(r'[A-Za-z ]$')).hasMatch(value)) {
                          return null;
                        }
                        return " First name is Invalid";
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "First name",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.green, width: 2.0),
                        ),
                      ),
                      autocorrect: false,
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        value = value.toString();
                        if ((new RegExp(r'[A-Za-z ]$')).hasMatch(value)) {
                          return null;
                        }
                        return " Last name is Invalid";
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Last name",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.green, width: 2.0),
                        ),
                      ),
                      autocorrect: false,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    if (_key1.currentState!.validate()) {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text(
                            'Transaction Is Successful',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "SUBMIT PAYMENT",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Luhn(String input) {
  int s = 0;
  int length = input.length;
  for (var j = 0; j < length; j++) {
    int dig = int.parse(input[length - j - 1]);
    if (j % 2 == 1) {
      dig *= 2;
    }
    s += dig > 9 ? (dig - 9) : dig;
  }

  if (s % 10 == 0) {
    return true;
  }

  return false;
}

