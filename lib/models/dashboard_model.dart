class DashboardModel {
  final String email;
  final int upMonitors, downMonitors, pausedMonitors;

  DashboardModel(
      {this.email, this.upMonitors, this.downMonitors, this.pausedMonitors});

  factory DashboardModel.fromJson(Map<String, dynamic> account) {
    return DashboardModel(
      email: account['email'],
      upMonitors: account['up_monitors'],
      downMonitors: account['down_monitors'],
      pausedMonitors: account['paused_monitors'],
    );
  }
}
