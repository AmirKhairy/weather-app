import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/main/data/models/weather_model/weather_model.dart';

class BuildBodyHeaderWidget extends StatelessWidget {
  const BuildBodyHeaderWidget(
      {super.key, required this.cubit, required this.scaffoldKey});
  final WeatherModel cubit;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          FontAwesomeIcons.locationDot,
          color: Colors.white,
          size: 20,
        ),
        SizedBox(width: 5),
        Text(
          "${cubit.location!.name},",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        Text(
          cubit.location!.country ?? "",
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
          icon: FaIcon(
            FontAwesomeIcons.barsStaggered,
            color: Colors.white,
            size: 25,
          ),
        ),
      ],
    );
  }
}
