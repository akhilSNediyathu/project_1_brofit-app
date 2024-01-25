// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutPlanAdapter extends TypeAdapter<WorkoutPlan> {
  @override
  final int typeId = 0;

  @override
  WorkoutPlan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutPlan(
      name: fields[7] as String,
      dailyWorkoutTime: fields[1] as String,
      dailyWakeUpTime: fields[2] as String,
      dailyBreakfastTime: fields[3] as String,
      dailyLunchTime: fields[4] as String,
      dailyDinnerTime: fields[5] as String,
      dailyBedTime: fields[6] as String,
      id: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutPlan obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dailyWorkoutTime)
      ..writeByte(2)
      ..write(obj.dailyWakeUpTime)
      ..writeByte(3)
      ..write(obj.dailyBreakfastTime)
      ..writeByte(4)
      ..write(obj.dailyLunchTime)
      ..writeByte(5)
      ..write(obj.dailyDinnerTime)
      ..writeByte(6)
      ..write(obj.dailyBedTime)
      ..writeByte(7)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutPlanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
