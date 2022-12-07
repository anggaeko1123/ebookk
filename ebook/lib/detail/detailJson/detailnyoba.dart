import 'package:flutter/material.dart';

class DetailNyoba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Halaman Text")
      ),
      body: Center(
        child: Container(
            width: 600,
            child: Text(
              'Contoh penggunaan dengan text yang panjang di Widget Flutter',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            )
        ),
      ),
    );
  }
}