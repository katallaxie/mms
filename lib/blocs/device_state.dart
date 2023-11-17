part of 'device_bloc.dart';

@freezed
sealed class DeviceState with _$DeviceState {
  factory DeviceState({
    required MacOsDeviceInfo deviceInfo,
  }) = _DeviceState;

  factory DeviceState.empty() => DeviceState(
          deviceInfo: MacOsDeviceInfo.fromMap({
        'computerName': 'Unknown',
        'hostName': 'Unknown',
        'arch': 'Unknown',
        'model': 'Unknown',
        'kernelVersion': 'Unknown',
        'osRelease': 'Unknown',
        'majorVersion': 0,
        'minorVersion': 0,
        'patchVersion': 0,
        'activeCPUs': 0,
        'memorySize': 0,
        'cpuFrequency': 0,
        'systemGUID': 'Unknown'
      }));
}
