import "package:drmem_provider/drmem_provider.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  test("... Device", () {
    expect(() => Device(name: "a", node: "host"), returnsNormally);
    expect(() => Device(name: "ab", node: "host"), returnsNormally);
    expect(() => Device(name: "a:b", node: "host"), returnsNormally);
    expect(() => Device(name: "a:b:c", node: "host"), returnsNormally);
    expect(() => Device(name: "0", node: "host"), returnsNormally);
    expect(() => Device(name: "01", node: "host"), returnsNormally);
    expect(() => Device(name: "0:1", node: "host"), returnsNormally);
    expect(() => Device(name: "0:1:2", node: "host"), returnsNormally);
    expect(() => Device(name: "a-b", node: "host"), returnsNormally);

    expect(() => Device(name: ".", node: "host"), throwsA(isArgumentError));
    expect(() => Device(name: ":", node: "host"), throwsA(isArgumentError));
    expect(() => Device(name: ":a", node: "host"), throwsA(isArgumentError));
    expect(() => Device(name: "::", node: "host"), throwsA(isArgumentError));
    expect(() => Device(name: "a::", node: "host"), throwsA(isArgumentError));
    expect(() => Device(name: "::b", node: "host"), throwsA(isArgumentError));
    expect(() => Device(name: ":", node: "host"), throwsA(isArgumentError));
    expect(() => Device(name: "-a", node: "host"), throwsA(isArgumentError));
    expect(() => Device(name: "a-", node: "host"), throwsA(isArgumentError));
    expect(() => Device(name: "-a:b", node: "host"), throwsA(isArgumentError));
    expect(() => Device(name: "a-:b", node: "host"), throwsA(isArgumentError));
    expect(() => Device(name: "a:-b", node: "host"), throwsA(isArgumentError));
    expect(() => Device(name: "a:b-", node: "host"), throwsA(isArgumentError));
  });

  test("... Device comparisons", () {
    // Make sure comparisons work for devices without a node specified.

    expect(
        Device(name: "a", node: "host")
            .compareTo(Device(name: "a", node: "host")),
        equals(0));
    expect(
        Device(name: "b", node: "host")
            .compareTo(Device(name: "a", node: "host")),
        equals(1));
    expect(
        Device(name: "a", node: "host")
            .compareTo(Device(name: "b", node: "host")),
        equals(-1));

    // Make sure devices with the same name are properly sorted based on their
    // node value.

    expect(Device(name: "a", node: "z").compareTo(Device(name: "a", node: "z")),
        equals(0));
    expect(Device(name: "a", node: "y").compareTo(Device(name: "a", node: "z")),
        equals(-1));
    expect(Device(name: "a", node: "z").compareTo(Device(name: "a", node: "y")),
        equals(1));

    // Make sure devices with different names compare correctly and ignore
    // their node values.

    expect(Device(name: "b", node: "z").compareTo(Device(name: "a", node: "z")),
        equals(1));
    expect(Device(name: "b", node: "y").compareTo(Device(name: "a", node: "z")),
        equals(1));
    expect(Device(name: "b", node: "z").compareTo(Device(name: "a", node: "y")),
        equals(1));

    expect(Device(name: "a", node: "z").compareTo(Device(name: "b", node: "z")),
        equals(-1));
    expect(Device(name: "a", node: "y").compareTo(Device(name: "b", node: "z")),
        equals(-1));
    expect(Device(name: "a", node: "z").compareTo(Device(name: "b", node: "y")),
        equals(-1));
  });
}
