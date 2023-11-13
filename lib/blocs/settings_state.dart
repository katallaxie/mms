part of 'settings_bloc.dart';

@freezed
sealed class SettingsState with _$SettingsState {
  factory SettingsState({
    required bool isSystemBrightness,
    required bool isDarkMode,
    required bool enableCrashlytics,
    required bool enableAnalytics,
  }) = _SettingsState;

  factory SettingsState.empty() => SettingsState(
        isSystemBrightness: true,
        isDarkMode: false,
        enableCrashlytics: true,
        enableAnalytics: true,
      );

  factory SettingsState.fromJson(Map<String, dynamic> json) =>
      _$SettingsStateFromJson(json);
}
