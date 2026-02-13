import 'package:silver/features/gold/data/models/gold_model.dart';

abstract class GoldState {}

class GoldInitialState extends GoldState {}

class GoldLoadingState extends GoldState {}

class GoldErrorState extends GoldState {
  final String errMsg;
  GoldErrorState({required this.errMsg}); 
}

class GoldSuccessState extends GoldState {
  final GoldModel goldModel;
  GoldSuccessState({required this.goldModel});
}