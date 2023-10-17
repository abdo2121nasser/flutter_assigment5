part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}
class LoudingGetDataState extends WeatherState {}
class SuccessGetDataState extends WeatherState {}
class ErrorGetDataState extends WeatherState {}