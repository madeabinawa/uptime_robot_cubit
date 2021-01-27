import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uptime_robot_cubit/api/apis.dart';
import 'package:uptime_robot_cubit/models/monitor_model.dart';

part 'monitors_state.dart';

class MonitorsCubit extends Cubit<MonitorsState> {
  MonitorsCubit() : super(MonitorsInitial());

  void getMonitorList() async {
    emit(MonitorsLoading());
    List<MonitorModel> monitors = await MonitorServices.getMonitors();
    emit(MonitorsLoaded(monitors));
  }
}
