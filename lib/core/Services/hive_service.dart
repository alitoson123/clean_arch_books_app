import 'package:clean_arch_books_app/Features/home/Domain/Entities/book_entity.dart';
import 'package:hive/hive.dart';

class HiveService {
  var box = Hive.box<List<BookEntity>>('books_box');

  addDataLocal({
    required List<BookEntity> bookEntityList,
    required String key,
  }) async {
    await box.put(key, bookEntityList);
  }

  List<BookEntity>? getDataLocal({required String key}) {
    var data = box.get(key);

    return data;
  }
}
