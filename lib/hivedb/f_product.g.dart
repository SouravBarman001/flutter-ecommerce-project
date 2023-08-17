// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'f_product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FProductAdapter extends TypeAdapter<FProduct> {
  @override
  final int typeId = 2;

  @override
  FProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FProduct(
      name: fields[0] as String,
      price: fields[1] as double,
      imageUrl: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FProduct obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FyProductAdapter extends TypeAdapter<FyProduct> {
  @override
  final int typeId = 3;

  @override
  FyProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FyProduct(
      name: fields[0] as String,
      price: fields[1] as double,
      imageUrl: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FyProduct obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FyProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BannerModelAdapter extends TypeAdapter<BannerModel> {
  @override
  final int typeId = 5;

  @override
  BannerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BannerModel(
      imageUrl: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BannerModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BannerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}