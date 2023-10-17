import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/screens/weather-screen.dart';


class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=WeatherCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('search screen'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SearchBar(
                onTap: (){
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => WeatherScreen(),));
                },
                controller:cubit.searchBarController,
                hintText: 'search',
                hintStyle: MaterialStateProperty.all(
                    TextStyle(color: Colors.black87.withOpacity(0.7),
                        fontSize: 18)),
                leading: IconButton(icon: Icon(
                  Icons.search, color: Colors.black87.withOpacity(0.7),),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => WeatherScreen(),));
                  },),
              ),
            ),
          ),

        );
      },
    );
  }
}
