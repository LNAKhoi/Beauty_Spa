import 'package:beauty_spa/models/salon.dart';
import 'package:beauty_spa/repositories/Crud.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/customer.dart';

part 'data_retrieve_event.dart';
part 'data_retrieve_state.dart';

class DataRetrieveBloc extends Bloc<DataRetrieveEvent, DataRetrieveState> {
  Crud crud;
  DataRetrieveBloc({required this.crud}) : super(DataRetrieving()) {
    on<CustomerDataRetrieveRequest>((event, emit) async {
      emit(DataRetrieving());
      try {
        await crud.retrieveUser();
        emit(DataRetrieveSuccess());
      } catch (exception) {
        emit(DataRetrieveFailed(exception.toString()));
      }
    });

    on<SalonImageListRetrieveRequest>((event, emit) async {
      emit(DataRetrieving());
      try {
        await crud.retrieveSalonImages();
        emit(DataRetrieveSuccess());
      } catch (exception) {
        emit(DataRetrieveFailed(exception.toString()));
      }
    });
  }
}
