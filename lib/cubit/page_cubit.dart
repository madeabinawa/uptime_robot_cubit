import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:uptime_robot_cubit/models/monitor_model.dart';

part 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(PageInitial());
  void goToMainPage() => emit(PageInitial());
  void goToWebview(MonitorModel monitor) => emit(PageWebview(monitor));
}
