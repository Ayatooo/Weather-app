import 'package:flutter/material.dart';

Padding city({required String cityName}) {
  return Padding(
    padding: const EdgeInsets.only(top: 50, bottom: 20),
    child: Text(
      cityName,
      style: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
