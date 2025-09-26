import 'package:clean_arch_books_app/Features/home/Domain/Entities/book_entity.dart';

abstract class HomeRemoteDataSource {
    Future<List<BookEntity>> fetchFeaturedBooks();

    Future<List<BookEntity>> fetchNewestBooks();
}