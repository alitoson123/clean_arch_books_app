import 'package:clean_arch_books_app/Features/home/Domain/Entities/book_entity.dart';
import 'package:clean_arch_books_app/Features/home/Domain/Repos/home_repo.dart';
import 'package:clean_arch_books_app/core/Errors/failure.dart';
import 'package:clean_arch_books_app/core/utils/general_user_case.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUserCase
    extends NonParameterUserCase<List<BookEntity>> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUserCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
