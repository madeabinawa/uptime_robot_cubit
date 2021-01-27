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
          // * Dashboard
          Container(
            padding: EdgeInsets.all(defaultMargin),
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: purpleColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // *  User Greetings
                Container(
                  width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                  child: Row(
                    children: [
                      Text(
                        'Hello, ',
                        style: whiteTextStyle.copyWith(
                            fontWeight: FontWeight.w100),
                      ),
                      Text(
                        'madeabinawa',
                        style: whiteTextStyle.copyWith(
                            fontWeight: FontWeight.w900),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
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
                                '11',
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
                                '11',
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
                                '11',
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
                SizedBox(height: 6)
              ],
            ),
          ),
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
                        children: generateMonitorsCard(monitorState.monitors));
                  }
                  return Container(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: CircularProgressIndicator(),
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

generateMonitorsCard(List<MonitorModel> monitors) {
  List<Widget> generatedMonitorCards = [];
  for (var monitorsItem in monitors) {
    // MonitorModel newMonitorItem = await getMetaTitle(monitorsItem);
    generatedMonitorCards.add(MonitorCard(monitorsItem));
  }
  return generatedMonitorCards;
}
