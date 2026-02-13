
import 'package:silver/features/silver/data/models/silver_model.dart';

abstract class SilverState {}

class SilverInitial extends SilverState {}

class SilverLoading extends SilverState {}

class SilverError extends SilverState {
  final String message;
 SilverError({required this.message}); 
}

class SilverSuccess extends SilverState {
  final SilverModel silverModel;
 SilverSuccess({required this.silverModel});
}