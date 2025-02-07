import 'package:flutter_bloc/flutter_bloc.dart';

class VariableStateCubit<T> extends Cubit<T?> {
  VariableStateCubit() : super(null);
  void update(T updatedValue) {
    emit(updatedValue);
  }

  void reset() {
    emit(null);
  }
}
