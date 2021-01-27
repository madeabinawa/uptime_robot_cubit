import 'package:flutter/material.dart';
import 'package:uptime_robot_cubit/cubit/dashboard_cubit.dart';
import 'package:uptime_robot_cubit/cubit/monitors_cubit.dart';
import 'package:uptime_robot_cubit/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uptime Robot Cubit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => MonitorsCubit()),
        BlocProvider(create: (context) => DashboardCubit()),
      ], child: Homepage()),
    );
  }
}
