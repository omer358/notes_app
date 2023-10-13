import 'package:get_storage/get_storage.dart';
import 'package:logging/logging.dart';

mixin CacheManager {
  final log = Logger("CacheManager");

  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    log.info("Saving token to the cache");
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    var token = box.read(CacheManagerKey.TOKEN.toString());
    log.info("Get Token $token");

    /// the problem is that the token is being called on login page and it's null
    /// I/flutter ( 8712): INFO: 2023-10-13 07:11:49.152530: Get Token null
    return token;
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
    log.info("The token has been removed");
  }
}

enum CacheManagerKey { TOKEN }
