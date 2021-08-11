import 'package:nuconta_marketplace/domain/entities/entities.dart';

abstract class GetHomeData {
  Future<CustomerEntity> call();
}
