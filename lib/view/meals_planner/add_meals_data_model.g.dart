// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_meals_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealPlannerAdapter extends TypeAdapter<MealPlanner> {
  @override
  final int typeId = 3;

  @override
  MealPlanner read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealPlanner(
      mealList: (fields[1] as Map).cast<String, num>(),
      id: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MealPlanner obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.mealList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealPlannerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
