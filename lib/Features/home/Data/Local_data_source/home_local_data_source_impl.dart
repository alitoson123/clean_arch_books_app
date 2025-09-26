import 'package:clean_arch_books_app/Features/home/Data/Local_data_source/home_local_data_source.dart';
import 'package:clean_arch_books_app/Features/home/Domain/Entities/book_entity.dart';
import 'package:clean_arch_books_app/core/Services/hive_service.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  final HiveService hiveService;

  HomeLocalDataSourceImpl({required this.hiveService});
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var result = hiveService.getDataLocal(key: 'featured');
    return result!;
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var result = hiveService.getDataLocal(key: 'newest');
    return result!;
  }
}
