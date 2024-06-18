import "package:drmem_provider/drmem_provider.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  final DateTime boot = DateTime.now();

  test("... NodeInfo", () {
    final NodeInfo ni = NodeInfo(
        name: 'Name',
        version: '1.0',
        location: 'n/a',
        addr: HostInfo('example', 1000),
        bootTime: boot,
        queries: 'q',
        mutations: 'm',
        subscriptions: 's');

    final json = ni.toJson();

    var tmp = {
      'name': 'Name',
      'version': '1.0',
      'location': 'n/a',
      'addr': {'host': 'example', 'port': 1000},
      'bootTime': boot.toIso8601String(),
      'queries': 'q',
      'mutations': 'm',
      'subscriptions': 's'
    };

    // Did it encode correctly?

    expect(json, equals(tmp));

    // Can we decode it back to the original?

    expect(NodeInfo.fromJson(json), allOf(isNotNull, equals(ni)));

    // Now make sure we can't decode it if it's missing a field or a field is
    // of the incorrect type.

    tmp.remove('name');
    expect(NodeInfo.fromJson(tmp), isNull);
    tmp['name'] = 'hello';
    expect(NodeInfo.fromJson(tmp), allOf(isNotNull, isNot(equals(ni))));
    tmp['name'] = 1;
    expect(NodeInfo.fromJson(tmp), isNull);
    tmp['name'] = 'Name';
    expect(NodeInfo.fromJson(tmp), allOf(isNotNull, equals(ni)));

    tmp.remove('version');
    expect(NodeInfo.fromJson(tmp), isNull);
    tmp['version'] = 'hello';
    expect(NodeInfo.fromJson(tmp), allOf(isNotNull, isNot(equals(ni))));
    tmp['version'] = 1;
    expect(NodeInfo.fromJson(tmp), isNull);
    tmp['version'] = '1.0';
    expect(NodeInfo.fromJson(tmp), allOf(isNotNull, equals(ni)));

    tmp.remove('location');
    expect(NodeInfo.fromJson(tmp), isNull);
    tmp['location'] = 'hello';
    expect(NodeInfo.fromJson(tmp), allOf(isNotNull, isNot(equals(ni))));
    tmp['location'] = 1;
    expect(NodeInfo.fromJson(tmp), isNull);
    tmp['location'] = 'n/a';
    expect(NodeInfo.fromJson(tmp), allOf(isNotNull, equals(ni)));

    tmp.remove('addr');
    expect(NodeInfo.fromJson(tmp), isNull);
    tmp['addr'] = 1;
    expect(NodeInfo.fromJson(tmp), isNull);
    tmp['addr'] = <HostInfo>[];
    expect(NodeInfo.fromJson(tmp), isNull);
    tmp['addr'] = {'host': 'another', 'port': 1000};
    expect(NodeInfo.fromJson(tmp), allOf(isNotNull, isNot(equals(ni))));
    tmp['addr'] = {'host': 'example', 'port': 2000};
    expect(NodeInfo.fromJson(tmp), allOf(isNotNull, isNot(equals(ni))));
    tmp['addr'] = {'host': 'example', 'port': 1000};
    expect(NodeInfo.fromJson(tmp), allOf(isNotNull, equals(ni)));

    tmp['signature'] = 'hello';
    expect(NodeInfo.fromJson(tmp), allOf(isNotNull, isNot(equals(ni))));
    tmp['signature'] = 1;
    expect(NodeInfo.fromJson(tmp), isNull);
    tmp.remove('signature');
    expect(NodeInfo.fromJson(tmp), allOf(isNotNull, equals(ni)));

    tmp.remove('queries');
    expect(NodeInfo.fromJson(tmp), isNull);
    tmp['queries'] = 'hello';
    expect(NodeInfo.fromJson(tmp), allOf(isNotNull, isNot(equals(ni))));
    tmp['queries'] = 1;
    expect(NodeInfo.fromJson(tmp), isNull);
    tmp['queries'] = 'q';
    expect(NodeInfo.fromJson(tmp), allOf(isNotNull, equals(ni)));

    tmp.remove('mutations');
    expect(NodeInfo.fromJson(tmp), isNull);
    tmp['mutations'] = 'hello';
    expect(NodeInfo.fromJson(tmp), allOf(isNotNull, isNot(equals(ni))));
    tmp['mutations'] = 1;
    expect(NodeInfo.fromJson(tmp), isNull);
    tmp['mutations'] = 'm';
    expect(NodeInfo.fromJson(tmp), allOf(isNotNull, equals(ni)));

    tmp.remove('subscriptions');
    expect(NodeInfo.fromJson(tmp), isNull);
    tmp['subscriptions'] = 'hello';
    expect(NodeInfo.fromJson(tmp), allOf(isNotNull, isNot(equals(ni))));
    tmp['subscriptions'] = 1;
    expect(NodeInfo.fromJson(tmp), isNull);
    tmp['subscriptions'] = 's';
    expect(NodeInfo.fromJson(tmp), allOf(isNotNull, equals(ni)));
  });
}
