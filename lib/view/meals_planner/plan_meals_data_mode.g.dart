// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_meals_data_mode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SetMealsPlanAdapter extends TypeAdapter<SetMealsPlan> {
  @override
  final int typeId = 4;

  @override
  SetMealsPlan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SetMealsPlan(
      id: fields[0] as String,
      mealPlan: (fields[1] as List).cast<String>(),
      calorie: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SetMealsPlan obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.mealPlan)
      ..writeByte(2)
      ..write(obj.calorie);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SetMealsPlanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
