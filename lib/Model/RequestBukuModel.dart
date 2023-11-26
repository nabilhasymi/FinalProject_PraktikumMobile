import 'package:hive/hive.dart';

part 'RequestBukuModel.g.dart';

@HiveType(typeId: 0)
class RequestBuku extends HiveObject {
  @HiveField(0)
  final String Title;

  @HiveField(1)
  final String author;

  RequestBuku({required this.Title, required this.author});
}