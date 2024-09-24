import "package:drmem_provider/drmem_provider.dart";
import "package:flutter_test/flutter_test.dart";

DevBool mkBool(bool v) => DevBool(value: v);
DevInt mkInt(int v) => DevInt(value: v);
DevFlt mkFlt(double v) => DevFlt(value: v);
DevStr mkStr(String v) => DevStr(value: v);

void main() {
  test("... Device value comparisons", () {
    // Test booleans

    expect(mkBool(false).compareTo(const DevBool(value: false)), equals(0));
    expect(mkBool(false).compareTo(const DevBool(value: true)), equals(-1));
    expect(mkBool(true).compareTo(const DevBool(value: false)), equals(1));
    expect(mkBool(true).compareTo(const DevBool(value: true)), equals(0));

    // Test integers

    expect(mkInt(10).compareTo(const DevInt(value: 10)), equals(0));
    expect(mkInt(9).compareTo(const DevInt(value: 10)), equals(-1));
    expect(mkInt(11).compareTo(const DevInt(value: 10)), equals(1));

    // Test floats

    expect(mkFlt(10.0).compareTo(const DevFlt(value: 10.0)), equals(0));
    expect(mkFlt(9.0).compareTo(const DevFlt(value: 10.0)), equals(-1));
    expect(mkFlt(11.0).compareTo(const DevFlt(value: 10.0)), equals(1));

    // Test strings

    expect(mkStr("B").compareTo(const DevStr(value: "B")), equals(0));
    expect(mkStr("A").compareTo(const DevStr(value: "B")), equals(-1));
    expect(mkStr("C").compareTo(const DevStr(value: "B")), equals(1));
  });
}
