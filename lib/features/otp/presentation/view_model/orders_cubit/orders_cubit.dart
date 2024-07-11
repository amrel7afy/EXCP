
import 'package:flutter_bloc/flutter_bloc.dart';

import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  int selectedTypeOfOrdersIndex=0;
 /* void setSelectedTypeOfOrdersIndex(int index) {
    emit(OrdersChanged());
  }*/
}
