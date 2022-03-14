// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app_moneyshare_sau/views/moneyshare_ui.dart';

main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoneyShareUi(),
      theme: ThemeData(
        fontFamily: 'Kanit',
      ),
    ),
  );
}
