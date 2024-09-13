library;

/// Represents a client ID.
///
/// Each application should generate and remember their own randomly generated
/// client ID. This ID will be sent to DrMem instances when using an encrypted
/// channel.

class ClientID {
  final String _value;

  static String validate(String value) => value;

  static String _decode(Map<String, dynamic> json) {
    if (json case {'clientID': String value}) {
      return validate(value);
    } else {
      throw ("badly formed JSON data");
    }
  }

  /// Create a random client ID.

  ClientID.generate() : _value = "";

  /// Decode a client ID from a JSON payload.

  ClientID.fromJson(Map<String, dynamic> json) : _value = _decode(json);

  String get value => _value;

  Map<String, String> toJson() => {'clientID': _value};
}
