import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity  extends HiveObject {
  @HiveField(0)
  final String? imageUrl;
   @HiveField(1)
  final String? title;
   @HiveField(2)
  final String? authorName;
   @HiveField(3)
  final num? price;
   @HiveField(4)
  final num rating;

  BookEntity({
    required this.imageUrl,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
  });
}
