library;

/// The result type for the [DrMem.getDriverInfo] query.

class DriverInfo {
  /// The name of the driver.
  final String name;

  /// A short summary of the driver.
  final String summary;

  /// A full description of the driver.
  ///
  /// This information includes configurations settings, what devices are
  /// created, how to set up the device, and any other information the driver
  /// author wishes to express. The format of this string is Markdown.
  final String description;

  const DriverInfo(this.name, this.summary, this.description);
}
