import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silver/features/silver/data/repo/silver_repo.dart';
import 'package:silver/features/silver/representation/cubit/silver_state.dart';

class SilverCubit extends Cubit<SilverState> {
  final SilverRepo silverRepo;

  SilverCubit(this.silverRepo) : super(SilverInitial());

  Future<void> getSilver() async {
    emit(SilverLoading());

    final res = await silverRepo.getSilverPrice();

    res.fold(
      (error) {
        emit(SilverError(message: error));
      },
      (silverModel) {
        emit(SilverSuccess(silverModel: silverModel));
      },
    );
  }
}
