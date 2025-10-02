import 'package:clean_arch_books_app/Features/home/Data/Local_data_source/home_local_data_source.dart';
import 'package:clean_arch_books_app/Features/home/Data/Remote_data_source/home_remote_data_source.dart';
import 'package:clean_arch_books_app/Features/home/Domain/Entities/book_entity.dart';
import 'package:clean_arch_books_app/Features/home/Domain/Repos/home_repo.dart';
import 'package:clean_arch_books_app/core/Errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class  HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    List<BookEntity> bookList;

    bookList = homeLocalDataSource.fetchFeaturedBooks();

    try {
      if (bookList.isNotEmpty) {
        return right(bookList);
      } else {
        bookList = await homeRemoteDataSource.fetchFeaturedBooks();
        return right(bookList);
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    List<BookEntity> bookList;
    bookList = homeLocalDataSource.fetchNewestBooks();

    try {
      if (bookList.isNotEmpty) {
        return right(bookList);
      } else {
        bookList = await homeRemoteDataSource.fetchNewestBooks();
        return right(bookList);
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
