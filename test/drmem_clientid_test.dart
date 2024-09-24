import "package:drmem_provider/drmem_provider.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  test("... Client ID serialization", () {
    final id = ClientID.fromJson({'clientID': "0817263544536271"});

    expect(id.fingerprint, equals("08:17:26:35:44:53:62:71"));
    expect(ClientID.fromJson(id.toJson()).fingerprint,
        equals("08:17:26:35:44:53:62:71"));
  });
}
