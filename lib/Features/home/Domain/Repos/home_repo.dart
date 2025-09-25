import 'package:clean_arch_books_app/Features/home/Domain/Entities/book_entity.dart';
import 'package:clean_arch_books_app/core/Errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks();

  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
}
