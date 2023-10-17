import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit.dart';


class DetailBlock extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit=WeatherCubit.get(context);
    return Container(
      alignment: Alignment.center,
      width: 300,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: Colors.white,width: 2)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 50,
            child: Column(
              children: [
                Text(cubit.weatherModel!.current!.humidity!.toString(),style: TextStyle(
                    color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold
                ),),
                Text('humidity',style: TextStyle(
                    color: Colors.white,fontSize: 20
                ),)
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: Column(
              children: [
                Text(cubit.weatherModel!.current!.visKm.toString(),style: TextStyle(
                    color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold
                ),),
                Text('visability',style: TextStyle(
                    color: Colors.white,fontSize: 20
                ),)
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: Column(
              children: [
                Text(cubit.weatherModel!.current!.uv.toString(),style: TextStyle(
                    color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold
                ),),
                Text('UVindex',style: TextStyle(
                    color: Colors.white,fontSize: 20
                ),)
              ],
            ),
          ),

        ],
      ),
    );
  },
);
  }
}
