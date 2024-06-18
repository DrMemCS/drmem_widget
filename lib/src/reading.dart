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

  // Creates a [Reading] value from a set of values. This fucntion uses a
  // `switch` statement with pattern matching to make sure the parameters
  // specify a correctly formatted, single device value.

  @factory
  static Reading fromParams(
          DateTime dt, bool? b, int? i, double? d, String? s, List<int>? c) =>
      Reading(
          stamp: dt,
          value: switch ((b, i, d, s, c)) {
            (_, null, null, null, null) when b != null => DevBool(value: b),
            (null, _, null, null, null) when i != null => DevInt(value: i),
            (null, null, _, null, null) when d != null => DevFlt(value: d),
            (null, null, null, _, null) when s != null => DevStr(value: s),
            (null, null, null, null, [int r, int g, int b]) =>
              DevColor(red: r, green: g, blue: b),
            (null, null, null, null, [int r, int g, int b, int a]) =>
              DevColor(red: r, green: g, blue: b, alpha: a),
            (null, null, null, null, _) when c != null =>
              throw (Exception("wrong number of color components")),
            (null, null, null, null, null) =>
              throw (Exception("reading has no data")),
            _ => throw (Exception("reading has multiple value types"))
          });
}
