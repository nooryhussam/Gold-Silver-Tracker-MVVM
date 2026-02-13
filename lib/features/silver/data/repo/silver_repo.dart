import 'package:dartz/dartz.dart';
import 'package:silver/core/networking/api_constants.dart';
import 'package:silver/core/networking/dio_helper.dart';

import 'package:silver/features/silver/data/models/silver_model.dart';

class SilverRepo {
  Future<Either<String, SilverModel>> getSilverPrice() async {
    try {
      final response = await DioHelper.getData(
        endPoint: ApiConstants.silverEndPoint,
      );
      return right(SilverModel.fromJson(response.data));
    } catch (e) {
      return left(e.toString());
    }
  }
}
