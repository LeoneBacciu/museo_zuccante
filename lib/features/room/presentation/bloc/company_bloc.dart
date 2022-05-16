import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:museo_zuccante/features/room/domain/company_repository.dart';
import 'package:museo_zuccante/models/company.dart';

part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final CompanyRepository companyRepository;

  CompanyBloc({required this.companyRepository}) : super(CompanyInitial()) {
    on<CompanyEvent>((event, emit) async {
      if (event is CompanyLoad) {
        emit(CompanyLoading());
        final item = await companyRepository.getCompany(event.id);
        item.fold(
          (l) => emit(CompanyLoaded(l)),
          (r) => emit(CompanyError(r.e)),
        );
      }
    });
  }
}
