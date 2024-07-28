part of 'container_label_border_cubit.dart';


sealed class LabelBorderState {}

final class LabelBorderInitial extends LabelBorderState {}
final class LabelBorderSuccess extends LabelBorderState {}
final class LabelBorderError extends LabelBorderState {}
