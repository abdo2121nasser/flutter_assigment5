import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/servises/service.dart';

import '../models/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  static WeatherCubit get(context)=>BlocProvider.of(context);
  TextEditingController searchBarController=TextEditingController();
  WeatherModel? weatherModel;

  getData()
  {
    emit(LoudingGetDataState());
    DioHelper.getData(
        url: 'current.json',
        query: {
          'key':'d1b404d6d64f458685b170816231310',
          'q':searchBarController.text,
          'aqi':'no'
        }
        ).
  then(
            (value) async {
      weatherModel=WeatherModel.fromJson(value.data);
      emit(SuccessGetDataState());

    }
    )
        .catchError((error){
      print(error);
      emit(ErrorGetDataState());

    });
  }
}
