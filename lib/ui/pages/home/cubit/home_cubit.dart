import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuconta_marketplace/domain/entities/customer_entity.dart';
import 'package:nuconta_marketplace/domain/usecases/get_home_data.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.getHomeData,
  }) : super(const HomeState.loading()) {
    handleGetHomeData();
  }

  final GetHomeData getHomeData;

  Future<void> handleGetHomeData() async {
    try {
      emit(const HomeState.loading());

      final customerEntity = await getHomeData();

      emit(HomeState.loaded(customerEntity));
    } catch (e) {
      emit(const HomeState.error());
    }
  }
}
