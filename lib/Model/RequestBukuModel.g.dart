// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestBukuModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RequestBukuAdapter extends TypeAdapter<RequestBuku> {
  @override
  final int typeId = 0;

  @override
  RequestBuku read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RequestBuku(
      Title: fields[0] as String,
      author: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RequestBuku obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.Title)
      ..writeByte(1)
      ..write(obj.author);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is RequestBukuAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}