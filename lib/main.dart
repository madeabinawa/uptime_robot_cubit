import 'package:flutter/material.dart';
import 'package:uptime_robot_cubit/cubit/dashboard_cubit.dart';
import 'package:uptime_robot_cubit/cubit/monitors_cubit.dart';
import 'package:uptime_robot_cubit/cubit/page_cubit.dart';
import 'package:uptime_robot_cubit/cubit/theme_cubit.dart';
import 'package:uptime_robot_cubit/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => MonitorsCubit()),
        BlocProvider(create: (context) => DashboardCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
              title: 'Uptime Robot Cubit',
              theme: ThemeData(
                brightness:
                    (state is ThemeLight) ? Brightness.light : Brightness.dark,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              debugShowCheckedModeBanner: false,
              home: Navigation());
        },
      ),
    );
  }
}
