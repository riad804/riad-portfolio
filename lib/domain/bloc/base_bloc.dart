import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<State> extends Cubit<State> {
  BaseBloc(super.initialState);
}
