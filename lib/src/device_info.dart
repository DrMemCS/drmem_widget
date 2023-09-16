library;

import "device_like.dart";

/// The result type for the [DrMem.getDeviceInfo] query. Provides
/// meta-information about a DrMem device.

class DeviceInfo {
  /// Full name and location of device.
  final Device device;

  /// Indicates whether the device is settable.
  final bool settable;

  /// Specifies the engineering units for the device. Some devices (e.g.
  /// boolean device) don't have units associated with the value. In those
  /// cases, this field will be `null`.
  final String? units;

  /// If the device has any history in the backend storage, this field will
  /// contain information related to it.
  final DevHistory? history;

  const DeviceInfo(this.device, this.settable, this.units, this.history);
}
