// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutHistoryAdapter extends TypeAdapter<WorkoutHistory> {
  @override
  final int typeId = 5;

  @override
  WorkoutHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutHistory(
      id: fields[0] as String,
      dailyWokout: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutHistory obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dailyWokout);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
