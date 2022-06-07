import 'package:app/widgets/rightSide.dart';
import 'package:flutter/material.dart';

import '../models/todayWeather.dart';
import 'leftSide.dart';

SizedBox todayWeatherBoard(TodayWeatherData? data) {
  return SizedBox(
    width: 300,
    height: 150,
    child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(38, 38, 38, 0.4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: leftside(data),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: rightside(data),
              ),
            )
          ],
        )),
  );
}
