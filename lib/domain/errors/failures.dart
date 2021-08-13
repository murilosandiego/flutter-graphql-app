import 'package:equatable/equatable.dart';

class PurchaseFailure extends Equatable implements Exception {
  const PurchaseFailure(this.message);

  final String? message;

  @override
  List<Object?> get props => [message];
}
