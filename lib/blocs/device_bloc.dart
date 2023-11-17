import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';

part 'device_event.dart';
part 'device_state.dart';
part 'device_bloc.freezed.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  DeviceBloc() : super(DeviceState.empty()) {
    on<DeviceEventReset>(_onReset);
    on<DeviceEventUpdate>(_onUpdate);
  }
  void _onReset(
    DeviceEventReset event,
    Emitter<DeviceState> emit,
  ) {
    emit(DeviceState.empty());
  }

  void _onUpdate(
    DeviceEventUpdate event,
    Emitter<DeviceState> emit,
  ) async {
    final info = await deviceInfoPlugin.macOsInfo;

    emit(state.copyWith(deviceInfo: info));
  }

  void dispose() {
    close();
  }
}
