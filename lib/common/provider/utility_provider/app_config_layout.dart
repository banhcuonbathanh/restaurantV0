import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config_layout.freezed.dart';

@freezed
class AppConfigLayOutModel with _$AppConfigLayOutModel {
  const factory AppConfigLayOutModel({
    @Default(false) final bool isPhone,
    @Default(false) final bool isTablet,
    @Default(false) final bool isDesktop,
    @Default(false) final bool isWeb,
    @Default(false) final bool isApplication,
    @Default('') final String orientation,
    @Default(0) final double deviceHeight,
    @Default(0) final double deviceWith,
  }) = _AppConfigLayOutModel;
}
