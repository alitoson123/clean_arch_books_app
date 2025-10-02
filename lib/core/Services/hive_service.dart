import 'package:clean_arch_books_app/Features/home/Domain/Entities/book_entity.dart';
import 'package:hive/hive.dart';

class HiveService {
  var featuredBooksBox = Hive.box<BookEntity>('FeaturedBooksBox');
  var newestBooksBox = Hive.box<BookEntity>('NewestBooksBox');

  Future<void> addFeaturedBooksLocal({required List<BookEntity> bookEntityList}) async {
    await featuredBooksBox.addAll(bookEntityList);
  }

  Future<void> addNewestBooksLocal({required List<BookEntity> bookEntityList}) async {
    await newestBooksBox.addAll(bookEntityList);
  }
  List<BookEntity> getFeaturedBooksLocal() {
    return featuredBooksBox.values.toList();
  }
    List<BookEntity> getNewestBooksLocal() {
    return newestBooksBox.values.toList();
  }
}
