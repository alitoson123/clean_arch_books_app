import 'package:clean_arch_books_app/Features/home/Data/Models/book_model/book_model.dart';
import 'package:clean_arch_books_app/Features/home/Data/Remote_data_source/home_remote_data_source.dart';
import 'package:clean_arch_books_app/Features/home/Domain/Entities/book_entity.dart';
import 'package:clean_arch_books_app/core/Services/api_service.dart';
import 'package:clean_arch_books_app/core/Services/hive_service.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  final HiveService hiveService;

  HomeRemoteDataSourceImpl({
    required this.hiveService,
    required this.apiService,
  });
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    Map<String, dynamic> data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming',
    );

    List<BookEntity> bookEntityList = fetch_book_entity_list(data);

    await hiveService.addFeaturedBooksLocal(
      bookEntityList: bookEntityList,
    );

    return bookEntityList;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    Map<String, dynamic> data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:programming',
    );

    List<BookEntity> bookEntityList = fetch_book_entity_list(data);

    await hiveService.addNewestBooksLocal(
      bookEntityList: bookEntityList,
    );

    return bookEntityList;
  }

  List<BookEntity> fetch_book_entity_list(Map<String, dynamic> data) {
    List<BookEntity> bookEntityList = [];

    for (var item in data['items']) {
      bookEntityList.add(BookModel.fromJson(item));
    }
    return bookEntityList;
  }
}
