part of 'company_bloc.dart';

abstract class CompanyEvent extends Equatable {
  const CompanyEvent();

  @override
  List<Object?> get props => [];
}

class CompanyLoad extends CompanyEvent {
  final String id;

  const CompanyLoad(this.id);

  @override
  List<Object?> get props => [id];
}
