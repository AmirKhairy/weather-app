import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/api/api_service.dart';
import 'package:weather_app/main/data/models/weather_model/weather_model.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_states.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitial());

  static WeatherCubit get(context) => BlocProvider.of(context);

  ApiService apiService = ApiService();
  WeatherModel? weatherModel;
  Future<void> getWeather({required String location}) async {
    emit(WeatherLoading());

    await apiService.fetchWeather(location: location).then((value) {
      weatherModel = WeatherModel.fromJson(value);

      emit(WeatherSuccess());
    }).catchError((onError) {
      log(onError.toString());
      emit(WeatherError());
    });
  }
}
