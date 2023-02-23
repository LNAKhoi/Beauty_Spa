part of 'data_retrieve_bloc.dart';

abstract class DataRetrieveState extends Equatable {
  const DataRetrieveState();

  @override
  List<Object> get props => [];
}

class DataRetrieving extends DataRetrieveState {
  const DataRetrieving();

  @override
  List<Object> get props => [];
}

class DataRetrieveSuccess extends DataRetrieveState {
  const DataRetrieveSuccess();

  @override
  List<Object> get props => [];
}

class DataRetrieveFailed extends DataRetrieveState {
  const DataRetrieveFailed(this.errorMessage);
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
