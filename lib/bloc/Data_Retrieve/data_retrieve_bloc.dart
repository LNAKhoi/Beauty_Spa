import 'package:beauty_spa/repositories/Crud.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/customer.dart';

part 'data_retrieve_event.dart';
part 'data_retrieve_state.dart';

class DataRetrieveBloc extends Bloc<DataRetrieveEvent, DataRetrieveState> {
  Crud crud;
  DataRetrieveBloc({required this.crud}) : super(DataRetrieving()) {
    on<DataRetrieveEvent>((event, emit) async {
      emit(DataRetrieving());
      try {
        // add auth.Login here
        await crud.retrieveUser();
        emit(DataRetrieveSuccess());
      } catch (exception) {
        emit(DataRetrieveFailed(exception.toString()));
      }
    });
  }
}
