part of 'home_cubit.dart';

enum HomeStatus {
  loading,
  success,
  error,
  purchaseSuccess,
  purchaseFailure,
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.loading,
    this.customerEntity,
    this.errorMessage,
  });

  const HomeState.loading() : this();

  const HomeState.success(CustomerEntity? customerEntity)
      : this(
          status: HomeStatus.success,
          customerEntity: customerEntity,
        );

  const HomeState.purchaseSuccess(CustomerEntity? customerEntity)
      : this(
          status: HomeStatus.purchaseSuccess,
          customerEntity: customerEntity,
        );

  const HomeState.error() : this(status: HomeStatus.error);

  final HomeStatus status;
  final CustomerEntity? customerEntity;
  final String? errorMessage;

  HomeState copyWith({
    HomeStatus? status,
    CustomerEntity? customerEntity,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      customerEntity: customerEntity ?? this.customerEntity,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, customerEntity, errorMessage];
}
