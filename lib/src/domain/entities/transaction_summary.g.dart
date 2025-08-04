// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_summary.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionSummaryAdapter extends TypeAdapter<TransactionSummary> {
  @override
  final int typeId = 7;

  @override
  TransactionSummary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionSummary(
      items: (fields[0] as List).cast<TransactionSummaryDocs?>(),
    );
  }

  @override
  void write(BinaryWriter writer, TransactionSummary obj) {
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
      other is TransactionSummaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionSummaryDocsAdapter
    extends TypeAdapter<TransactionSummaryDocs> {
  @override
  final int typeId = 8;

  @override
  TransactionSummaryDocs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionSummaryDocs(
      date: fields[0] as String?,
      totalExpense: fields[1] as double?,
      totalIncome: fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionSummaryDocs obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.totalExpense)
      ..writeByte(2)
      ..write(obj.totalIncome);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionSummaryDocsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
