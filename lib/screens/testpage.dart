part of 'screens.dart';

class Testpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: purpleColor,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BlocConsumer<TestpageCubit, TestpageState>(
                buildWhen: (prvState, currState) {
                  return (currState is TestpageAlfa ||
                      currState is TestpageBeta);
                },
                listener: (context, state) {
                  if (state is TestpageAlfa) {
                    print("state is changed Alfa");
                  } else if (state is TestpageBeta) {
                    print("state is changed Beta");
                  } else {
                    print("state is reset");
                  }
                },
                builder: (context, state) {
                  if (state is TestpageAlfa) {
                    return Text('This is Alfa');
                  } else if (state is TestpageBeta) {
                    return Text('This is Beta');
                  }
                  return Text('Press Any Button Below');
                },
              ),
              FlatButton(
                color: purpleColor,
                onPressed: () => context.read<TestpageCubit>().setToAlfa(),
                child: Text('Alfa Button'),
              ),
              FlatButton(
                color: greyColor,
                onPressed: () => context.read<TestpageCubit>().setToBeta(),
                child: Text('Beta Button'),
              ),
              FlatButton(
                onPressed: () => context.read<TestpageCubit>().reset(),
                child: Text('Reset Button'),
              ),
            ],
          ),
        ));
  }
}
