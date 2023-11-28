/// Defines the [NodeInfo] type. This value is generated by the mDNS subsystem.
library;

import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

/// Information associated with DrMem nodes.
///
/// This information is obtained via the mDNS announcements and by querying the
/// node.

class NodeInfo {
  /// The name of the node. This name is not the network name but is the name
  /// the owner put in the configuration file.
  final String name;

  /// A string in the format "major.minor.patch" format indicating the version
  /// of the DrMem node. The app can use this to determine what features are
  /// supported by the node.
  final String version;

  /// This is the location of the node, as reported in the DrMem configuration
  /// file.
  final String location;

  /// A list of IP adresses / host names with which to use to connect. The mDNS
  /// announcement itself provides the location IP address. This address will
  /// always be the last entry in the list. The node is allowed to advertise
  /// a preferred address (in case the node is available from the general
  /// Internet.) If the node has a preferred address, it's prepended to the
  /// list. An application can try each of the addresses to connect to the node.
  final List<String> host;

  /// The port number used by the node.
  final int port;

  /// This is a placeholder for future security. It will contain the digital
  /// signature of the node's SSL certificate. If this field is `null`, then
  /// the DrMem node uses an unencrypted socket. If it is not `null`, a TLS
  /// socket should be used (i.e. https).
  final String? signature;

  /// Indicates when the node was started. If it's `null` then the entry was
  /// programmatically entered and the actual boot time is unknown.
  final DateTime? bootTime;

  /// Specifies the Graphql URL endpoint used for queries.
  final String queries;

  /// Specifies the Graphql URL endpoint used for mutations.
  final String mutations;

  /// Specifies the Graphql URL endpoint used for subscription.
  final String subscriptions;

  /// [NodeInfo] constructor.

  const NodeInfo(
      {required this.name,
      required this.version,
      required this.location,
      required this.host,
      required this.port,
      this.signature,
      required this.bootTime,
      required this.queries,
      required this.mutations,
      required this.subscriptions});

  /// Converts a [NodeInfo] object into a map which can be used to generate
  /// JSON values.

  Map<String, dynamic> toJson() {
    var v = {
      'name': name,
      'version': version,
      'location': location,
      'host': host,
      'port': port,
      'bootTime': bootTime,
      'queries': queries,
      'mutations': mutations,
      'subscriptions': subscriptions
    };

    if (signature != null) {
      v['signature'] = signature!;
    }

    return v;
  }

  /// Converts a map back into a [NodeInfo] object. If there are
  /// missing fields, or a field is of the incorrect type, this
  /// function returns `null`.

  static NodeInfo? fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'name': String name,
          'version': String version,
          'location': String location,
          'host': List<String> host,
          'port': int port,
          'bootTime': DateTime bootTime,
          'queries': String queries,
          'mutations': String mutations,
          'subscriptions': String subscriptions
        }) {
      final sig = json['signature'];

      if (sig == null || sig is String) {
        return NodeInfo(
            name: name,
            version: version,
            location: location,
            host: host,
            port: port,
            signature: sig,
            bootTime: bootTime,
            queries: queries,
            mutations: mutations,
            subscriptions: subscriptions);
      }
    }
    developer.log("couldn't restore node info for $json ... dropping from list",
        name: "NodeInfo.fromJson");
    return null;
  }

  /// Determines whether the [nodeInfo] argument is a valid update to the
  /// current object. If a DrMem node gets updated, its version number may
  /// change, or, the maintainer may change the preferred IP address (so it
  /// may be accessed outside their home, for instance.) But we must do some
  /// due diligence; we don't want someone's malicious, local node overwriting
  /// the config for a personal node.
  ///
  /// An update is considered acceptable if the names are the same and either
  /// the current node hasn't defined a digital signature or it has and the
  /// replacement info has the same signature.

  bool canUpdate(NodeInfo o) =>
      name == o.name && (signature == null || signature == o.signature);

  @override
  bool operator ==(Object other) =>
      other is NodeInfo &&
      name == other.name &&
      version == other.version &&
      location == other.location &&
      listEquals(host, other.host) &&
      port == other.port &&
      signature == other.signature &&
      bootTime == other.bootTime &&
      queries == other.queries &&
      mutations == other.mutations &&
      subscriptions == other.subscriptions;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() =>
      "{name: $name, version: $version, location: $location, host: $host, port: $port, bootTime: $bootTime, queries: $queries, mutations: $mutations, subscriptions: $subscriptions, signature: $signature }";
}
