import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_states.dart';
import 'package:weather_app/main/presentation/views/widgets/home_screen_widgets/build_body_widget.dart';
import 'package:weather_app/main/presentation/views/widgets/home_screen_widgets/build_drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = WeatherCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.blue[100],
          key: scaffoldKey,
          endDrawer: BuildDrawerWidget(
            cubit: cubit,
          ),
          body: BuildBodyWidget(
            scaffoldKey: scaffoldKey,
            cubit: cubit,
          ),
        );
      },
    );
  }
}
