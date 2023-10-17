import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocks/detail_block.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit.dart';

import '../constants/constant.dart';


class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: WeatherCubit.get(context)..getData(),
      child: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = WeatherCubit.get(context);
          //cubit.printname();
          //var temp=cubit.temp;
          return Scaffold(
            body:  cubit.weatherModel!=null?
            Center(
              child: Stack(
                children: [
                  Image.asset(cubit.weatherModel!.current!.tempC!.toInt()>19?Constants.kSunnyImage:Constants.kWinterImage, fit: BoxFit.fill,),
                Column(
                    children: [
                      const SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(cubit.weatherModel!.location!.name!,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),),
                              Text(
                                cubit.weatherModel!.current!.tempC.toString(),
                                style: TextStyle(color: Colors.white,
                                    fontSize: 90,
                                    fontWeight: FontWeight.bold),)
                            ],
                          ),
                          RotatedBox(quarterTurns: 1,
                            child: Text(
                              cubit.weatherModel!.current!.condition!.text.toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25
                              ),),)
                        ],
                      ),
                      SizedBox(
                        height: 200,
                      ),
                      DetailBlock()
                    ],
                  )
                ],
              ),
            )
                :
            Center(child: CircularProgressIndicator()),

          );
        },
      ),
    );
  }
}
