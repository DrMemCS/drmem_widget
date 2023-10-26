/// Base class for Device-like types. All device-like types have a "name" field.

library;

sealed class DeviceLike {
  final String name;

  const DeviceLike({required this.name});
}

/// Identifies a DrMem device. Since devices are available across multiple
/// instances of DrMem, a device has a node component. If the node field is
/// `null`, the application has several ways to handle it: it can display an
/// error, it can choose a default node, or it can prompt the user.

class Device extends DeviceLike {
  final String? node;

  const Device({this.node, required super.name});
}

/// Defines a device "pattern" device. In this type, the name field can be
/// a unique device name or can be a name pattern (using "glob" patterns). In
/// this type, the node field cannot be `null`.

class DevicePattern extends DeviceLike {
  final String node;

  const DevicePattern({required this.node, required super.name});
}
