import 'dart:convert';
import 'dart:io';

const _path = 'test/helpers/fixtures';

Map<String, dynamic> getHomeDataFixture() => _readFixture('home_data.json');

Map<String, dynamic> getPurchaseSuccessFixture() =>
    _readFixture('purchase_success.json');
Map<String, dynamic> getPurchaseFailureFixture() =>
    _readFixture('purchase_failure.json');

Map<String, dynamic> _readFixture(String name) =>
    jsonDecode(File('$_path/$name').readAsStringSync()) as Map<String, dynamic>;
