// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyAdapter extends TypeAdapter<Currency> {
  @override
  final int typeId = 4;

  @override
  Currency read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Currency(
      items: (fields[0] as List).cast<CurrencyDocs>(),
    );
  }

  @override
  void write(BinaryWriter writer, Currency obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CurrencyDocsAdapter extends TypeAdapter<CurrencyDocs> {
  @override
  final int typeId = 5;

  @override
  CurrencyDocs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyDocs(
      code: fields[0] as String?,
      name: fields[2] as String?,
      symbol: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyDocs obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.symbol);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyDocsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
