import 'package:equatable/equatable.dart';

class LoadingState extends Equatable {
  final bool loading;

  const LoadingState(this.loading);

  @override
  List<Object?> get props => [loading];
}

final class LoadingInitial extends LoadingState {
  const LoadingInitial(super.loading);
}
