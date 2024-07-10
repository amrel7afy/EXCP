
abstract class ChooseWorkerState {}

class ChooseWorkerInitial extends ChooseWorkerState {}

class ChooseWorkerChangeState extends ChooseWorkerState {
  final bool isFromApp;

  ChooseWorkerChangeState(this.isFromApp);
}
