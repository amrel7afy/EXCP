import 'package:equatable/equatable.dart';

abstract class GenericState<T>extends Equatable {
  final T? data;
  final bool change;
  const GenericState({required this.data , required this.change});
}

class GenericInitial<T> extends GenericState<T> {
  const GenericInitial(T? data) : super(data: data , change: false);

  @override
  List<Object?> get props => [change];
}

class GenericUpdate<T> extends GenericState<T> {
  const GenericUpdate({required T super.data , required super.change });

  @override
  List<Object?> get props => [change];
}
