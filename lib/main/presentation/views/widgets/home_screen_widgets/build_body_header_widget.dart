import 'package:flutter/material.dart';
import 'package:weather_app/main/presentation/manager/cubit/weather_cubit.dart';

class BuildBodyHeaderWidget extends StatelessWidget {
  const BuildBodyHeaderWidget(
      {super.key, required this.cubit, required this.scaffoldKey});
  final WeatherCubit cubit;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          size: 20,
          color: Colors.white,
        ),
        SizedBox(width: 5),
        Text(
          "${cubit.weatherModel?.location!.name},",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        Text(
          cubit.weatherModel?.location!.country ?? "",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openEndDrawer();
          },
          icon: Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
