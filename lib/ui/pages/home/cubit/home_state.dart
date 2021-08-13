part of 'home_cubit.dart';

enum HomeStatus { loading, loaded, error }

class HomeState extends Equatable {
  const HomeState._({
    this.status = HomeStatus.loading,
    this.customerEntity,
  });

  const HomeState.loading() : this._();

  const HomeState.loaded(CustomerEntity customerEntity)
      : this._(
          status: HomeStatus.loaded,
          customerEntity: customerEntity,
        );

  const HomeState.error() : this._(status: HomeStatus.error);

  final HomeStatus status;
  final CustomerEntity? customerEntity;

  @override
  List<Object?> get props => [status, customerEntity];
}
