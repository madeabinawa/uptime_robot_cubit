part of 'screens.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dashboardWidth = (MediaQuery.of(context).size.width - 48 - 6) / 3;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purpleColor,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          // *Dashboard Widget
          ClipPath(
            clipper: ContainerClipper(),
            child: DashboardWidget(dashboardWidth),
          ),
          // *ListView Monitors
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: (MediaQuery.of(context).size.height * 0.7) - 10,
              child: BlocBuilder<MonitorsCubit, MonitorsState>(
                builder: (context, monitorState) {
                  if (monitorState is MonitorsInitial) {
                    // while state is initial, call get monitor list api
                    context.read<MonitorsCubit>().getMonitorList();
                  } else if (monitorState is MonitorsLoaded) {
                    return ListView(
                      physics: BouncingScrollPhysics(),
                      children: generateMonitorsCard(monitorState.monitors),
                    );
                  }
                  return Container(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: SpinKitWave(color: purpleColor),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(0, size.height * 0.84);
    path_0.quadraticBezierTo(size.width * -0.00, size.height * 0.93,
        size.width * 0.04, size.height * 0.93);
    path_0.cubicTo(size.width * 0.27, size.height * 0.93, size.width * 0.72,
        size.height * 0.93, size.width * 0.95, size.height * 0.93);
    path_0.quadraticBezierTo(
        size.width * 0.99, size.height * 0.93, size.width, size.height);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

generateMonitorsCard(List<MonitorModel> monitors) {
  List<Widget> generatedMonitorCards = [];
  for (var monitorsItem in monitors) {
    // MonitorModel newMonitorItem = await getMetaTitle(monitorsItem);
    generatedMonitorCards.add(MonitorCard(monitorsItem));
  }
  return generatedMonitorCards;
}
