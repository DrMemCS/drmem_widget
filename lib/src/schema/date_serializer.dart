import 'package:built_value/serializer.dart';

class DateSerializer implements PrimitiveSerializer<DateTime> {
  @override
  DateTime deserialize(
    Serializers serializers,
    covariant String serialized, {
    FullType specifiedType = FullType.unspecified,
  }) =>
      DateTime.parse(serialized);

  @override
  Object serialize(
    Serializers serializers,
    DateTime date, {
    FullType specifiedType = FullType.unspecified,
  }) =>
      date.toIso8601String();

  @override
  Iterable<Type> get types => [DateTime];

  @override
  String get wireName => "DateTimeUtc";
}
