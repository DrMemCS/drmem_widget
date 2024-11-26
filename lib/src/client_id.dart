library;

import 'dart:math';

const String _jsonKey = 'fingerprint';

/// Represents a client ID.
///
/// Each application should generate and remember their own randomly generated
/// client ID. This ID will be sent to DrMem instances when using an encrypted
/// channel.

class ClientID {
  final String _value;

  // Validates the string value has the proper form (32 hexadecimal digits.)

  static String _validate(String value) {
    final form = RegExp(r'^[0-9A-Fa-f]{16}$');

    return form.hasMatch(value)
        ? value
        : throw ArgumentError("badly formed ID");
  }

  // Attempts to convert a simple map into the internal representation of an
  // ID.

  static String _decode(Map<String, dynamic> json) {
    if (json case {_jsonKey: String value}) {
      return _validate(value);
    } else {
      throw ArgumentError("badly formed JSON data", "json");
    }
  }

  // Generates a random, 64-bit hash value and returns it as a string.

  static String _random() {
    final rnd = Random();

    return Iterable.generate(2, (_) => rnd.nextInt(0xffffffff))
        .fold("", (acc, v) => acc += v.toRadixString(16).padLeft(8, '0'));
  }

  /// Create a random client ID.

  ClientID.generate() : _value = _random();

  /// Decode a client ID from a JSON payload.

  ClientID.fromJson(Map<String, dynamic> json) : _value = _decode(json);

  /// Returns the client ID as a `String` in "xx:xx:xx:xx:xx:xx:xx:xx" notation.

  String get fingerprint => Iterable.generate(_value.length ~/ 2)
      .map((ii) => _value.substring(ii * 2, ii * 2 + 2))
      .join(":");

  /// Returns a JSON representation of the client ID that can be used to
  /// serialize it to a persistent storage. The return value can be converted
  /// back to a client ID using `ClientID.fromJson`.

  Map<String, String> toJson() => {_jsonKey: _value};
}
