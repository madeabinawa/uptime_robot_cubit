import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uptime_robot_cubit/api/apis.dart';
import 'package:uptime_robot_cubit/models/dashboard_model.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  void getDashboard() async {
    // Set state to Loading
    emit(DashboardLoading());
    // Request data to api
    DashboardModel dashboard = await DashboardServices.getDashboard();
    // Return api data to state
    emit(DashboardLoaded(dashboard));
  }
}
