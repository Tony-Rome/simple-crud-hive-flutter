// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cookies_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CookiesBoxAdapter extends TypeAdapter<CookiesBox> {
  @override
  final int typeId = 1;

  @override
  CookiesBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CookiesBox(
      fields[0] as double,
      fields[1] as String,
      (fields[2] as List)?.cast<Cookies>(),
    );
  }

  @override
  void write(BinaryWriter writer, CookiesBox obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.price)
      ..writeByte(1)
      ..write(obj.color)
      ..writeByte(2)
      ..write(obj.cookiesList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CookiesBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
