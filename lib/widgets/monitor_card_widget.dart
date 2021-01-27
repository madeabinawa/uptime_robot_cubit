part of 'widgets.dart';

class MonitorCard extends StatefulWidget {
  final MonitorModel monitor;

  MonitorCard(this.monitor);

  @override
  _MonitorCardState createState() => _MonitorCardState();
}

class _MonitorCardState extends State<MonitorCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: new EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
      child: InkWell(
        child: ListTile(
          contentPadding: EdgeInsets.all(5),
          leading: Container(
            padding: EdgeInsets.fromLTRB(10, 12, 10, 15),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 1.0, color: purpleColor),
              ),
            ),
            child: chkIconStat(widget.monitor.status),
          ),
          title: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              widget.monitor.alias,
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.monitor.metaTitle,
                    style: greyTextStyle.copyWith(fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.clip),
                SizedBox(
                  height: 10,
                ),
                Text(widget.monitor.site,
                    style: greyTextStyle.copyWith(fontSize: 11),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.fromLTRB(5, 15, 5, 10),
            child: Icon(
              Icons.chevron_right,
              color: purpleColor,
            ),
          ),
        ),
      ),
    );
  }

  chkIconStat(int a) {
    switch (a) {
      case 0:
        return Icon(
          Icons.pause_circle_filled,
          color: purpleColor,
          size: 30,
        );
      case 1:
        return Icon(
          Icons.sync,
          color: purpleColor,
          size: 30,
        );
      case 2:
        return Icon(
          Icons.check_circle,
          color: purpleColor,
          size: 30,
        );
      case 8:
        return Icon(
          Icons.sync_problem,
          color: Colors.red,
          size: 30,
        );
      case 9:
        return Icon(
          Icons.warning,
          color: Colors.red,
          size: 30,
        );
    }
  }
}
