part of 'monitors_cubit.dart';

@immutable
abstract class MonitorsState {}

class MonitorsInitial extends MonitorsState {}

class MonitorsLoading extends MonitorsState {}

class MonitorsLoaded extends MonitorsState {
  final List<MonitorModel> monitors;
  MonitorsLoaded(this.monitors);
}
