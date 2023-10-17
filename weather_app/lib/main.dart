import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/cubit_service/observer.dart';
import 'package:weather_app/root_app/root_app.dart';
import 'package:weather_app/servises/service.dart';

void main() {
  Bloc.observer=MyBlocObserver();
  DioHelper.init();
  runApp(WeatherApp());
}



