import 'package:clean_arch_books_app/Features/home/Domain/Entities/book_entity.dart';

class NewestBooksStates {}

class NewestBooksInitial extends NewestBooksStates {}

class NewestBooksLoading extends NewestBooksStates {}

class NewestBooksSuccess extends NewestBooksStates {
  final List<BookEntity> books;

  NewestBooksSuccess({required this.books});
}

class NewestBooksFailure extends NewestBooksStates {
  final String errorMessage;

  NewestBooksFailure({required this.errorMessage});
}
