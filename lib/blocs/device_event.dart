part of 'device_bloc.dart';

@freezed
sealed class DeviceEvent with _$DeviceEvent {
  const factory DeviceEvent.reset() = DeviceEventReset;
  const factory DeviceEvent.update() = DeviceEventUpdate;
}
