part of 'company_bloc.dart';

abstract class CompanyState extends Equatable {
  const CompanyState();

  @override
  List<Object> get props => [];
}

class CompanyInitial extends CompanyState {}

class CompanyLoading extends CompanyState {}

class CompanyLoaded extends CompanyState {
  final Company room;

  const CompanyLoaded(this.room);

  @override
  List<Object> get props => [room];
}

class CompanyError extends CompanyState {
  final Exception e;

  const CompanyError(this.e);
}
