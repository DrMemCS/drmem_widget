library;

import "package:flutter/foundation.dart";
import "device_value.dart";

/// Represents a reading of a device.

@immutable
class Reading {
  /// This field represents the time that the device value was saved. This value
  /// should be very close to when the associated hardware was sampled. It is
  /// up to the driver to keep this promise.
  final DateTime stamp;

  /// The value returned from the device.
  final DevValue value;

  const Reading({required this.stamp, required this.value});
}
