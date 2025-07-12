// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegisterAdapter extends TypeAdapter<Register> {
  @override
  final int typeId = 1;

  @override
  Register read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Register(
      token: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Register obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
