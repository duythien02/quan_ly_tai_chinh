// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountAdapter extends TypeAdapter<Account> {
  @override
  final int typeId = 2;

  @override
  Account read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Account(
      items: (fields[0] as List).cast<AccountDocs?>(),
      currentPage: fields[1] as int?,
      pageSize: fields[2] as int?,
      totalPages: fields[3] as int?,
      totalItems: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Account obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.items)
      ..writeByte(1)
      ..write(obj.currentPage)
      ..writeByte(2)
      ..write(obj.pageSize)
      ..writeByte(3)
      ..write(obj.totalPages)
      ..writeByte(4)
      ..write(obj.totalItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AccountDocsAdapter extends TypeAdapter<AccountDocs> {
  @override
  final int typeId = 3;

  @override
  AccountDocs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountDocs(
      id: fields[0] as int?,
      accountName: fields[1] as String?,
      currencyCode: fields[2] as String?,
      initialBalance: fields[3] as double?,
      currentBalance: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, AccountDocs obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.accountName)
      ..writeByte(2)
      ..write(obj.currencyCode)
      ..writeByte(3)
      ..write(obj.initialBalance)
      ..writeByte(4)
      ..write(obj.currentBalance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountDocsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
