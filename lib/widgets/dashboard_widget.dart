part of 'widgets.dart';

class DashboardWidget extends StatelessWidget {
  final double dashboardWidth;
  DashboardWidget(this.dashboardWidth);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultMargin),
      height: MediaQuery.of(context).size.height * 0.33,
      decoration: BoxDecoration(
        color: purpleColor,
      ),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, dashboardState) {
          if (dashboardState is DashboardInitial) {
            // call cubit function to getDashboard data
            context.read<DashboardCubit>().getDashboard();
          } else if (dashboardState is DashboardLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // *  User Greetings
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hello, ${dashboardState.dashboard.email.split("@")[0]}",
                          style: whiteTextStyle.copyWith(
                              fontWeight: FontWeight.w900),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                        BlocBuilder<ThemeCubit, ThemeState>(
                          builder: (context, themeState) {
                            return GestureDetector(
                              onTap: () {
                                context.read<ThemeCubit>().switchTheme();
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    (themeState is ThemeLight)
                                        ? Icons.nights_stay
                                        : Icons.wb_sunny,
                                    color: Colors.white,
                                  ),
                                  FlatButton.icon(
                                    onPressed: () => context
                                        .read<PageCubit>()
                                        .goToTestpage(),
                                    icon: Icon(Icons.settings),
                                    label: Text("Test Page"),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ]),
                ),
                // *  Overview Text
                Text(
                  "Quickstats Overview",
                  style: greyTextStyle.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w100),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(width: 0.5, color: Colors.white),
                        ),
                      ),
                      width: dashboardWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(width: 0.5, color: Colors.white),
                            ),
                            child: Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Live',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300)),
                              Text(
                                dashboardState.dashboard.upMonitors.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(width: 0.5, color: Colors.white),
                        ),
                      ),
                      width: dashboardWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(width: 0.5, color: Colors.white),
                            ),
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Down',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                dashboardState.dashboard.downMonitors
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: dashboardWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(width: 0.5, color: Colors.white),
                            ),
                            child: Icon(
                              Icons.pause,
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Paused',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              Text(
                                dashboardState.dashboard.pausedMonitors
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10)
              ],
            );
          }
          return Center(
              child: SpinKitWave(
            color: Colors.white,
          ));
        },
      ),
    );
  }
}
