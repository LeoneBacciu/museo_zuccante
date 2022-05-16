import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:museo_zuccante/core/api_config.dart';
import 'package:museo_zuccante/core/failure.dart';
import 'package:museo_zuccante/models/company.dart';

class CompanyRepository {
  final Dio dio;

  const CompanyRepository({required this.dio});

  Future<Either<Company, Failure>> getCompany(String id) async {
    try {
      final item = await dio.get(ApiConfig.companyUrl(id));
      final parsedItem = Company.fromJson(item.data);
      return Left(parsedItem);
    } on Exception catch (e) {
      return Right(Failure(e));
    }
  }
}
