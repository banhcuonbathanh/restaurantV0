import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/local/db/hive_box_key.dart';
import '../../application/setting_service.dart';
import '../../application/setting_service_impl.dart';
import '../state/setting_state.dart';

final settingControllerProvider =
    StateNotifierProvider<SettingController, SettingState>((ref) {
  final settingService = ref.watch(settingServiceProvider);

  return SettingController(settingService, const SettingState());
});

class SettingController extends StateNotifier<SettingState> {
  final SettingService _settingService;

  SettingController(this._settingService, super.state);

  void addPassCodeToBox(String key, String? value) async {
    final result = await _settingService.addToBox<String>(key, value);
    if (result) {
      state = state.copyWith(passCode: value);
    }
  }

  void getPassCodeFromBox(String key) async {
    final result = await _settingService.getFromBox<String>(key);
    state = state.copyWith(passCode: result);
  }

  Future<int> getUserIdFromBox() async {
    final result = await _settingService.getFromBox<int?>(userIdKey);
    state = state.copyWith(userId: result);
    return result ?? 0;
  }

  void getAccessTokenFromBox() async {
    final result = await _settingService.getFromBox<String?>(accessTokenKey);
    state = state.copyWith(accessToken: result);
  }
}
