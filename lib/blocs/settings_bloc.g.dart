// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsStateImpl _$$SettingsStateImplFromJson(Map<String, dynamic> json) =>
    _$SettingsStateImpl(
      isSystemBrightness: json['isSystemBrightness'] as bool,
      isDarkMode: json['isDarkMode'] as bool,
      enableCrashlytics: json['enableCrashlytics'] as bool,
      enableAnalytics: json['enableAnalytics'] as bool,
    );

Map<String, dynamic> _$$SettingsStateImplToJson(_$SettingsStateImpl instance) =>
    <String, dynamic>{
      'isSystemBrightness': instance.isSystemBrightness,
      'isDarkMode': instance.isDarkMode,
      'enableCrashlytics': instance.enableCrashlytics,
      'enableAnalytics': instance.enableAnalytics,
    };
