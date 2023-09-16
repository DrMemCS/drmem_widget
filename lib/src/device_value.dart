/// This module defines a type which models all the types supported by DrMem
/// devices. These classes are bound together by the sealed, base class so they
/// define the complete set of allowed types. They don't provide much more API
/// than this because they're mostly used to transfer data to and from DrMem.
/// If any value needs to be used in calculations, that should be done before
/// encoding it into one of these types.
library;

/// The base class for all types returned by a device. This class is `sealed`
/// so new variants can't be created outside of this module.
sealed class DevValue {
  const DevValue();
}

/// Holds boolean values.
class DevBool extends DevValue {
  final bool value;

  const DevBool({required this.value});
}

/// Holds integer value.
class DevInt extends DevValue {
  final int value;

  const DevInt({required this.value});
}

/// Holds floating point values.
class DevFlt extends DevValue {
  final double value;

  const DevFlt({required this.value});
}

/// Holds text values.
class DevStr extends DevValue {
  final String value;

  const DevStr({required this.value});
}
