part of 'page_cubit.dart';

@immutable
abstract class PageState {}

class PageInitial extends PageState {}

class PageWebview extends PageState {
  final MonitorModel monitor;
  PageWebview(this.monitor);
}

class PageTestpage extends PageState {}
