import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';
part 'settings_bloc.g.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState.empty()) {
    on<SettingsEventToggleSystemBrightness>(_onToggleSystemBrightness);
    on<SettingsEventToggleDarkMode>(_onToggleDarkMode);
    on<SettingsEventToggleCrashlytics>(_onToggleCrashlytics);
    on<SettingsEventToggleAnalytics>(_onToggleAnalytics);
    on<SettingsEventIsFirstLaunch>(_onIsFirsLaunch);
    on<SettingsEventReset>(_onReset);
  }

  void _onIsFirsLaunch(
    SettingsEventIsFirstLaunch event,
    Emitter<SettingsState> emit,
  ) {
    emit(state.copyWith(isFirstLaunch: false));
  }

  void _onToggleSystemBrightness(
    SettingsEventToggleSystemBrightness event,
    Emitter<SettingsState> emit,
  ) {
    emit(state.copyWith(
      isSystemBrightness: !state.isSystemBrightness,
      isDarkMode: state.isSystemBrightness ? true : state.isDarkMode,
    ));
  }

  void _onToggleDarkMode(
    SettingsEventToggleDarkMode event,
    Emitter<SettingsState> emit,
  ) {
    emit(state.copyWith(isDarkMode: !state.isDarkMode));
  }

  void _onToggleCrashlytics(
    SettingsEventToggleCrashlytics event,
    Emitter<SettingsState> emit,
  ) {
    emit(state.copyWith(enableCrashlytics: !state.enableCrashlytics));
  }

  void _onToggleAnalytics(
    SettingsEventToggleAnalytics event,
    Emitter<SettingsState> emit,
  ) {
    emit(state.copyWith(enableAnalytics: !state.enableAnalytics));
  }

  void _onReset(
    SettingsEventReset event,
    Emitter<SettingsState> emit,
  ) {
    emit(SettingsState.empty());
  }

  @override
  SettingsState fromJson(Map<String, dynamic> json) =>
      SettingsState.fromJson(json);

  @override
  Map<String, dynamic> toJson(SettingsState state) => state.toJson();

  void dispose() {
    close();
  }
}
