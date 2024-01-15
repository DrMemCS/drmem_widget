import "package:drmem_provider/drmem_provider.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  test("... Device", () {
    expect(Device(name: "a"), isNot(isException));
    expect(Device(name: "ab"), isNot(isException));
    expect(Device(name: "a:b"), isNot(isException));
    expect(Device(name: "a:b:c"), isNot(isException));
    expect(Device(name: "0"), isNot(isException));
    expect(Device(name: "01"), isNot(isException));
    expect(Device(name: "0:1"), isNot(isException));
    expect(Device(name: "0:1:2"), isNot(isException));

    expect(Device(name: "a-b"), isNot(isException));

    expect(() => Device(name: "."), throwsA(isArgumentError));
    expect(() => Device(name: ":"), throwsA(isArgumentError));
    expect(() => Device(name: ":a"), throwsA(isArgumentError));
    expect(() => Device(name: "a:"), throwsA(isArgumentError));
    expect(() => Device(name: "-a"), throwsA(isArgumentError));
    expect(() => Device(name: "a-"), throwsA(isArgumentError));
    expect(() => Device(name: "a-"), throwsA(isArgumentError));
  });
}
