import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/dashboard_state.dart';

final dashboardControllerProvider =
    StateNotifierProvider<DashboardController, DashboardState>((ref) {
  return DashboardController(const DashboardState());
});

class DashboardController extends StateNotifier<DashboardState> {
  DashboardController(super.state);

  void setPageIndex(int value) {
    state = state.copyWith(pageIndex: value);
  }
}
