library;

/// The result type for the [DrMem.getDriverInfo] query.

class DriverInfo {
  final String name;
  final String summary;
  final String description;

  const DriverInfo(this.name, this.summary, this.description);
}
