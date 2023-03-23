import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../secure_storage/secure_storage.dart';
import '../secure_storage/secure_storage_impl.dart';
import 'hive_box_key.dart';
import 'hive_const.dart';

final hiveDbProvider = Provider<HiveDb>((ref) {
  // final secureStorage = ref.watch(secureStorageProvider);

  return HiveDb();
});

class HiveDb {
  HiveDb() {}
  // final SecureStorage _secureStorage;

  // HiveDb(this._secureStorage);

  Future<void> init() async {
    //You can provide a [subDir] where the boxes should be stored.
    await Hive.initFlutter(hiveDbPath);
    await Hive.openBox(
      settingBox,
      // encryptionCipher: HiveAesCipher(),
    );

    String? encryptionKey;
    // encryptionKey = await _secureStorage.getHiveKey();

    if (encryptionKey == null) {
      //Generates a secure encryption key using the fortuna random algorithm
      final key = Hive.generateSecureKey();

      // store the key to flutter secure storage
      // await _secureStorage.setHiveKey(base64UrlEncode(key));

      // read the key
      // encryptionKey = await _secureStorage.getHiveKey();
    }

    if (encryptionKey != null) {
      final key = base64Url.decode(encryptionKey);

      await Hive.openBox(
        settingBox,
        // encryptionCipher: HiveAesCipher(key),
      );
    }
  }
}

class HiveDb1 {
  HiveDb() {}
  // final SecureStorage _secureStorage;

  // HiveDb(this._secureStorage);

  Future<void> init() async {
    //You can provide a [subDir] where the boxes should be stored.
    await Hive.initFlutter(hiveDbPath);
    await Hive.openBox(
      settingBox,
      // encryptionCipher: HiveAesCipher(key),
    );

    String? encryptionKey;
    // encryptionKey = await _secureStorage.getHiveKey();

    if (encryptionKey == null) {
      //Generates a secure encryption key using the fortuna random algorithm
      final key = Hive.generateSecureKey();

      // store the key to flutter secure storage
      // await _secureStorage.setHiveKey(base64UrlEncode(key));

      // read the key
      // encryptionKey = await _secureStorage.getHiveKey();
    }

    if (encryptionKey != null) {
      final key = base64Url.decode(encryptionKey);

      await Hive.openBox(
        settingBox,
        // encryptionCipher: HiveAesCipher(key),
      );
    }
  }
}
