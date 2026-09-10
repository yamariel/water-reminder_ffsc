// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hydration_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HydrationRecordAdapter extends TypeAdapter<HydrationRecord> {
  @override
  final int typeId = 0;

  @override
  HydrationRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HydrationRecord(
      date: fields[0] as DateTime,
      amountM1: fields[1] as int,
      type: fields[2] as DrinkType,
    );
  }

  @override
  void write(BinaryWriter writer, HydrationRecord obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.amountM1)
      ..writeByte(2)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HydrationRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DrinkTypeAdapter extends TypeAdapter<DrinkType> {
  @override
  final int typeId = 1;

  @override
  DrinkType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DrinkType.water;

      default:
        return DrinkType.water;
    }
  }

  @override
  void write(BinaryWriter writer, DrinkType obj) {
    switch (obj) {
      case DrinkType.water:
        writer.writeByte(0);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrinkTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
