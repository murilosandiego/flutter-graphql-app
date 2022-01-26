import 'package:nuconta_marketplace/application/usecases/remote_get_home_data.dart';
import 'package:nuconta_marketplace/main/factories/factories.dart';
import 'package:nuconta_marketplace/main/utils/utils.dart';

RemoteGetHomeData makeRemoteGetHomeData() => RemoteGetHomeData(
      document: DocumentsConstants.getHomeData,
      graphQLClient: makeGraphQLClient(),
    );
