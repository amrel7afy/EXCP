import 'package:equatable/equatable.dart';

class LoaderState extends Equatable {
  final bool loading;

  const LoaderState(this.loading);

  @override
  List<Object?> get props => [loading];
}

final class LoaderInitial extends LoaderState {
  const LoaderInitial(super.loading);
}
