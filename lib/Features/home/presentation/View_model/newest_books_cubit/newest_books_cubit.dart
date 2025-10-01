import 'package:clean_arch_books_app/Features/home/Domain/Use_cases/fetch_newest_books_user_case.dart';
import 'package:clean_arch_books_app/Features/home/presentation/View_model/newest_books_cubit/newest_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates> {
  NewestBooksCubit(this.fetchNewestBooksUserCase) : super(NewestBooksInitial());

  final FetchNewestBooksUserCase fetchNewestBooksUserCase;

  Future<void> fetchNewestBooksMethod() async {
    emit(NewestBooksLoading());

    var result = await fetchNewestBooksUserCase.call();

    result.fold(
      (failure) => emit(NewestBooksFailure(errorMessage: failure.errorMessage)),
      (success) => emit(NewestBooksSuccess(books: success)),
    );
  }
}
