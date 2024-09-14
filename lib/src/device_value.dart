/// Defines types which model all data types supported by DrMem devices.
///
/// These classes are bound together by the sealed, base class [DevValue] so
/// they define the complete set of allowed types. They don't provide much
/// more API than this because they're mostly used to transfer data to and
/// from DrMem. If any value needs to be used in calculations, that should
/// be done before encapsulating it into one of these types.
library;

import "dart:math";
import "package:flutter/foundation.dart";

/// The base class for all types returned by a device. This class is `sealed`
/// so new variants can't be created outside of this module.
@immutable
sealed class DevValue {
  const DevValue();
}

/// Holds boolean values.
class DevBool extends DevValue {
  final bool value;

  const DevBool({required this.value});

  int compareTo(DevBool o) => switch ((value, o.value)) {
        (false, false) || (true, true) => 0,
        (false, true) => -1,
        (true, false) => 1
      };
}

/// Holds integer value.
class DevInt extends DevValue {
  final int value;

  const DevInt({required this.value});

  int compareTo(DevInt o) => value.compareTo(o.value);
}

/// Holds floating point values.
class DevFlt extends DevValue {
  final double value;

  const DevFlt({required this.value});

  int compareTo(DevFlt o) => value.compareTo(o.value);
}

/// Holds text values.
class DevStr extends DevValue {
  final String value;

  const DevStr({required this.value});

  int compareTo(DevStr o) => value.compareTo(o.value);
}

/// Holds RGB color values.
class DevColor extends DevValue {
  final int red;
  final int green;
  final int blue;
  final int alpha;

  DevColor(
      {required int red,
      required int green,
      required int blue,
      int alpha = 255})
      : red = min(255, max(0, red)),
        green = min(255, max(0, green)),
        blue = min(255, max(0, blue)),
        alpha = min(255, max(0, alpha));

  int compareTo(DevColor o) {
    final dRed = red.compareTo(o.red);

    if (dRed == 0) {
      final dGreen = green.compareTo(o.green);

      if (dGreen == 0) {
        final dBlue = blue.compareTo(o.blue);

        return dBlue == 0 ? alpha.compareTo(o.alpha) : dBlue;
      } else {
        return dGreen;
      }
    } else {
      return dRed;
    }
  }
}
