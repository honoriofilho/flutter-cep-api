import 'package:cep_api/data/model/address.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => <Object>[];
}

class AddressResult extends HomeState {
  const AddressResult(this.address);
  final Address address;

  @override
  List<Object> get props => <Object>[address];
}

class AddressLoading extends HomeState {}

class AddressFailure extends HomeState {
  const AddressFailure({required this.message});

  final String message;

  @override
  List<Object> get props => <Object>[message];
}
