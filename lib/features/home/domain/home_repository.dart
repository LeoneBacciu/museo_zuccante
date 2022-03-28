import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:museo_zuccante/core/api_config.dart';
import 'package:museo_zuccante/core/failure.dart';
import 'package:museo_zuccante/models/item.dart';

class HomeRepository {
  final Dio dio;

  const HomeRepository({required this.dio});

  Future<Either<List<Item>, Failure>> getItems() async {
    try {
      final items = await dio.get(ApiConfig.itemsUrl);
      final parsedItems =
          (items.data as List).map((e) => Item.fromJson(e)).toList();
      return Left(parsedItems);
    } on Exception catch (e) {
      return Right(Failure(e));
    }
  }
}
