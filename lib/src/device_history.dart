library;

import "reading.dart";

/// Represents the history associated with a device.
///
/// This is a snapshot of the history, at the time of the query. There's no
/// guarantee how long this information will remain accurate.

class DeviceHistory {
  /// Indicates how many data points were in the device's history at the time
  /// of the query.
  final int totalPoints;

  /// The oldest reading, at the time of the query. It is possible that, after
  /// this query returns, the oldest point is dropped due to new points being
  /// added.
  final Reading oldest;

  /// The most recent reading, at the time of the query. It is possible that,
  /// after this query returns, a newer point gets added to the history.
  final Reading newest;

  const DeviceHistory(this.totalPoints, this.oldest, this.newest);
}
