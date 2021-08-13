import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuconta_marketplace/domain/entities/customer_entity.dart';
import 'package:nuconta_marketplace/domain/errors/errors.dart';
import 'package:nuconta_marketplace/domain/usecases/get_home_data.dart';
import 'package:nuconta_marketplace/domain/usecases/usecases.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.getHomeData,
    required this.purchaseProduct,
  }) : super(const HomeState.loading()) {
    handleGetHomeData();
  }

  final GetHomeData getHomeData;
  final PurchaseProduct purchaseProduct;

  Future<void> handleGetHomeData() async {
    try {
      emit(const HomeState.loading());

      final customerEntity = await getHomeData();

      emit(HomeState.success(customerEntity));
    } catch (e) {
      emit(const HomeState.error());
    }
  }

  Future<void> handlePurchaseProduct({required String? offerId}) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));

      final balance = await purchaseProduct(offerId: offerId);

      final customerEntityUpdated =
          state.customerEntity?.copyWith(balance: balance);

      emit(
        state.copyWith(
          status: HomeStatus.purchaseSuccess,
          customerEntity: customerEntityUpdated,
        ),
      );
    } on PurchaseFailure catch (e) {
      emit(state.copyWith(
        status: HomeStatus.purchaseFailure,
        errorMessage: e.message,
      ));
    } catch (e) {
      emit(const HomeState.error());
    }
  }
}
