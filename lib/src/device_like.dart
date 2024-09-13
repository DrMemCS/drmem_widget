library;

/// Base class for Device-like types. All device-like types have a "name" field.
sealed class DeviceLike {
  final String name;
  final String node;

  const DeviceLike({required this.name, required this.node});
}

/// Identifies a DrMem device. Since devices are available across multiple
/// instances of DrMem, a device has a node component. If the node field is
/// `null`, the application has several ways to handle it: it can display an
/// error, it can choose a default node, or it can prompt the user.

class Device extends DeviceLike {
  static String _validateName(String name) {
    final regexp = RegExp(r'^\w([-\w]*\w)?(:\w([-\w]*\w)?)*$',
        multiLine: false, unicode: true, caseSensitive: false);

    if (regexp.hasMatch(name)) {
      return name;
    } else {
      throw ArgumentError("invalid device name", "name");
    }
  }

  Device({required super.node, required String name})
      : super(name: _validateName(name));

  /// Define a comparison method. First the names are compared. If they're the
  /// same, then the nodes are compared.

  int compareTo(Device o) {
    final result = name.compareTo(o.name);

    return result != 0 ? result : node.compareTo(o.node);
  }

  DevicePattern toPattern() => DevicePattern(node: node, name: name);
}

/// Defines a device "pattern" device. In this type, the name field can be
/// a unique device name or can be a name pattern (using "glob" patterns). In
/// this type, the node field cannot be `null`.

class DevicePattern extends DeviceLike {
  const DevicePattern({required super.node, required super.name});
}
