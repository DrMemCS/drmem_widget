import "package:drmem_provider/drmem_provider.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  test("... Device", () {
    expect(() => Device(name: "a"), returnsNormally);
    expect(() => Device(name: "ab"), returnsNormally);
    expect(() => Device(name: "a:b"), returnsNormally);
    expect(() => Device(name: "a:b:c"), returnsNormally);
    expect(() => Device(name: "0"), returnsNormally);
    expect(() => Device(name: "01"), returnsNormally);
    expect(() => Device(name: "0:1"), returnsNormally);
    expect(() => Device(name: "0:1:2"), returnsNormally);
    expect(() => Device(name: "a-b"), returnsNormally);

    expect(() => Device(name: "."), throwsA(isArgumentError));
    expect(() => Device(name: ":"), throwsA(isArgumentError));
    expect(() => Device(name: ":a"), throwsA(isArgumentError));
    expect(() => Device(name: "::"), throwsA(isArgumentError));
    expect(() => Device(name: "a::"), throwsA(isArgumentError));
    expect(() => Device(name: "::b"), throwsA(isArgumentError));
    expect(() => Device(name: ":"), throwsA(isArgumentError));
    expect(() => Device(name: "-a"), throwsA(isArgumentError));
    expect(() => Device(name: "a-"), throwsA(isArgumentError));
    expect(() => Device(name: "-a:b"), throwsA(isArgumentError));
    expect(() => Device(name: "a-:b"), throwsA(isArgumentError));
    expect(() => Device(name: "a:-b"), throwsA(isArgumentError));
    expect(() => Device(name: "a:b-"), throwsA(isArgumentError));
  });
}
