import 'package:equatable/equatable.dart';

class GenericUpdateState<T>extends Equatable {
  final T? data;

  const GenericUpdateState(this.data);

  @override
  List<Object?> get props => [data];
}

class GenericInitial<T> extends GenericUpdateState<T> {
  const GenericInitial(super.data);
}
