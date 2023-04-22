import 'package:flutter/material.dart';

class StlessScreen extends StatelessWidget {
  StlessScreen({super.key});

  ValueNotifier<int> _count = ValueNotifier<int>(0);
  ValueNotifier<bool> _toogle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateless as Stateful')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: _count,
                builder: ((context, value, child) {
                  return Text(
                    _count.value.toString(),
                    style: TextStyle(fontSize: 20),
                  );
                })),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ValueListenableBuilder(
                  valueListenable: _toogle,
                  builder: (context, value, child) {
                    return TextFormField(
                      obscureText: _toogle.value,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          prefix: Icon(Icons.lock),
                          suffix: InkWell(
                              onTap: () {
                                _toogle.value = !_toogle.value;
                              },
                              child: Icon(_toogle.value
                                  ? Icons.visibility_off
                                  : Icons.visibility))),
                    );
                  },
                ),
              ),
            )
          ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _count.value++;
          },
          child: Icon(Icons.add)),
    );
  }
}
