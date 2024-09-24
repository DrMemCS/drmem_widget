import "package:drmem_provider/drmem_provider.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  test("... Reading", () {
    final ts = DateTime.now();

    expect(() => Reading.fromParams(ts, null, null, null, null, null),
        throwsA(isArgumentError));
    expect(() => Reading.fromParams(ts, true, 1, null, null, null),
        throwsA(isArgumentError));
    expect(() => Reading.fromParams(ts, true, null, 1.0, null, null),
        throwsA(isArgumentError));
    expect(() => Reading.fromParams(ts, true, null, null, "abc", null),
        throwsA(isArgumentError));
    expect(() => Reading.fromParams(ts, true, null, null, null, [1, 2, 3]),
        throwsA(isArgumentError));
    expect(() => Reading.fromParams(ts, null, 1, 1.0, null, null),
        throwsA(isArgumentError));
    expect(() => Reading.fromParams(ts, null, 1, null, "abc", null),
        throwsA(isArgumentError));
    expect(() => Reading.fromParams(ts, null, 1, null, null, [1, 2, 3]),
        throwsA(isArgumentError));
    expect(() => Reading.fromParams(ts, null, null, 1.0, "abc", null),
        throwsA(isArgumentError));
    expect(() => Reading.fromParams(ts, null, null, 1.0, null, [1, 2, 3]),
        throwsA(isArgumentError));
    expect(() => Reading.fromParams(ts, null, null, null, "abc", [1, 2, 3]),
        throwsA(isArgumentError));
    expect(() => Reading.fromParams(ts, null, null, null, "abc", [1, 2]),
        throwsA(isArgumentError));
    expect(
        () => Reading.fromParams(ts, null, null, null, "abc", [1, 2, 3, 4, 5]),
        throwsA(isArgumentError));

    expect(
        (Reading.fromParams(ts, false, null, null, null, null).value as DevBool)
            .compareTo(const DevBool(value: false)),
        equals(0));
    expect(
        (Reading.fromParams(ts, true, null, null, null, null).value as DevBool)
            .compareTo(const DevBool(value: true)),
        equals(0));

    expect(
        (Reading.fromParams(ts, null, 100, null, null, null).value as DevInt)
            .compareTo(const DevInt(value: 100)),
        equals(0));

    expect(
        (Reading.fromParams(ts, null, null, 100.0, null, null).value as DevFlt)
            .compareTo(const DevFlt(value: 100.0)),
        equals(0));

    expect(
        (Reading.fromParams(ts, null, null, null, "abc", null).value as DevStr)
            .compareTo(const DevStr(value: "abc")),
        equals(0));

    expect(
        (Reading.fromParams(ts, null, null, null, null, [1, 2, 3]).value
                as DevColor)
            .compareTo(DevColor(red: 1, green: 2, blue: 3)),
        equals(0));
    expect(
        (Reading.fromParams(ts, null, null, null, null, [1, 2, 3, 4]).value
                as DevColor)
            .compareTo(DevColor(red: 1, green: 2, blue: 3, alpha: 4)),
        equals(0));
  });
}
