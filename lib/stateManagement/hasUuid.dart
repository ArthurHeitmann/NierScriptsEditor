
import '../utils/utils.dart';

mixin HasUuid {
  String _uuid = uuidGen.v4();

  String get uuid => _uuid;

  void overrideUuid(String uuid) {
    _uuid = uuid;
  }
}
