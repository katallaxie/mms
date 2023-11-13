part of 'settings_bloc.dart';

@freezed
sealed class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.toggleSystemBrightness() =
      SettingsEventToggleSystemBrightness;
  const factory SettingsEvent.toggleDarkMode() = SettingsEventToggleDarkMode;
  const factory SettingsEvent.toggleCrashlytics() =
      SettingsEventToggleCrashlytics;
  const factory SettingsEvent.toggleAnalytics() = SettingsEventToggleAnalytics;
}
