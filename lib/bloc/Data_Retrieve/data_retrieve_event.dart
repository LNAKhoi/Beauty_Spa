part of 'data_retrieve_bloc.dart';

abstract class DataRetrieveEvent extends Equatable {
  const DataRetrieveEvent();

  @override
  List<Object> get props => [];
}

class CustomerDataRetrieveRequest extends DataRetrieveEvent {}

class SalonImageListRetrieveRequest extends DataRetrieveEvent {}
