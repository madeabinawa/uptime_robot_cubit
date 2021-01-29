part of 'screens.dart';

// Navigation based on Page Cubit State
class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, PageState>(
      builder: (context, pageState) {
        // if PageState cubit is PageWebview
        // then set screen to Webview
        if (pageState is PageWebview) {
          return Webview(pageState.monitor);
        } else if (pageState is PageTestpage) {
          return Testpage();
        }
        return Homepage();
      },
    );
  }
}
