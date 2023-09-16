library;

import "device_value.dart";

/// Represents a reading of a device.

class Reading {
  /// This field represents the time that the device value was saved. This value
  /// should be very close to when the associated hardware was sampled. It is
  /// up to the driver to keep this promise.
  final DateTime stamp;

  /// The value of the device.
  late final DevValue value;

  Reading(this.stamp, this.value);
}
