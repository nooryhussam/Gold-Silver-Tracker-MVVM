import 'package:dartz/dartz.dart';
import 'package:silver/core/networking/api_constants.dart';
import 'package:silver/core/networking/dio_helper.dart';
import 'package:silver/features/gold/data/models/gold_model.dart';

class GoldRepo {
  Future<Either<String, GoldModel>> getGoldPrice() async {
    try {
      final response = await DioHelper.getData(
        endPoint: ApiConstants.goldEndPoint,
      );
      return right(GoldModel.fromJson(response.data));
    } catch (e) {
      return left(e.toString());
    }
  }
}
