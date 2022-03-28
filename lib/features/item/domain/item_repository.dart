import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:museo_zuccante/core/api_config.dart';
import 'package:museo_zuccante/core/failure.dart';
import 'package:museo_zuccante/models/item.dart';

class ItemRepository {
  final Dio dio;

  const ItemRepository({required this.dio});

  Future<Either<Item, Failure>> getItem(String id) async {
    try {
      final item = await dio.get(ApiConfig.itemUrl(id));
      final parsedItem = Item.fromJson(item.data);
      return Left(parsedItem);
    } on Exception catch (e) {
      return Right(Failure(e));
    }
  }
}
