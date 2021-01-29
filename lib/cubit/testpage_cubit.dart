import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'testpage_state.dart';

class TestpageCubit extends Cubit<TestpageState> {
  TestpageCubit() : super(TestpageInitial());

  void setToAlfa() => emit(TestpageAlfa());
  void setToBeta() => emit(TestpageBeta());
  void reset() => emit(TestpageReset());
}
