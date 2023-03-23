import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/exception/failure.dart';
import '../../../../core/local/db/hive_box_key.dart';
import '../../../setting/data/repository/setting_repository.dart';
import '../../../setting/data/repository/setting_repository_impl.dart';
import '../data/repository/ilogin_repository.dart';
import '../data/repository/login_repository.dart';
import 'ilogin_service.dart';

final loginServiceProvider = Provider.autoDispose<ILoginService>((ref) {
  final loginRepository = ref.watch(loginRepositoryProvider);
  final settingRepository = ref.watch(settingRepositoryProvider);

  return LoginService(loginRepository, settingRepository);
});

class LoginService implements ILoginService {
  final ILoginRepository _loginRepository;
  final SettingRepository _settingRepository;

  LoginService(this._loginRepository, this._settingRepository);

  @override
  Future<Result<bool, Failure>> login(Map<String, dynamic> request) async {
    try {
      final response = await _loginRepository.login(request);

      // print('this is reposnce in LoginService');
      // print(response);

      /// add access token to hive db
      await addToBox<String>(accessTokenKey, response.accessToken);

      /// add userId to hive db
      final userIdResult = await addToBox<int>(userIdKey, response.userId);

      return Success(userIdResult);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  Future<bool> addToBox<T>(String key, T? value) async {
    try {
      return await _settingRepository.addToBox(key, value);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<Result<T?, Failure>> getFromBox<T>(String key) async {
    try {
      final result = await _settingRepository.getFromBox(key);
      return Success(result);
    } catch (e) {
      return Error(Failure(message: e.toString()));
    }
  }
}
