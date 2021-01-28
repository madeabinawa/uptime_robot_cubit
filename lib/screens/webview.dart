part of 'screens.dart';

class Webview extends StatefulWidget {
  final MonitorModel monitor;
  final int index;
  Webview(this.monitor, {this.index = 1});

  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  int index;
  @override
  void initState() {
    super.initState();
    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<PageCubit>().goToMainPage();
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => context.read<PageCubit>().goToMainPage(),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.launch),
              onPressed: () => launch(widget.monitor.site,
                  forceWebView: false, forceSafariVC: false),
            )
          ],
          elevation: 8,
          title: Text(widget.monitor.alias),
          centerTitle: true,
          backgroundColor: purpleColor,
        ),
        body: IndexedStack(
          index: index,
          children: <Widget>[
            buildWebView(widget.monitor),
            Center(
              child: Container(
                child: SpinKitWave(color: purpleColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  WebView buildWebView(MonitorModel monitor) {
    return WebView(
      initialUrl: monitor.site,
      javascriptMode: JavascriptMode.unrestricted,
      onPageFinished: (_) {
        setState(() {
          index = 0;
        });
      },
    );
  }
}
