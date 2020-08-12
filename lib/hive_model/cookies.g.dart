// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cookies.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CookiesAdapter extends TypeAdapter<Cookies> {
  @override
  final int typeId = 0;

  @override
  Cookies read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cookies(
      flavour: fields[0] as String,
      chips: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Cookies obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.flavour)
      ..writeByte(1)
      ..write(obj.chips);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CookiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
