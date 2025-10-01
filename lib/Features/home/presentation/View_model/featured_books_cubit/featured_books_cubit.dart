import 'package:clean_arch_books_app/Features/home/Domain/Use_cases/fetch_featured_books_user_case.dart';
import 'package:clean_arch_books_app/Features/home/presentation/View_model/featured_books_cubit/featured_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUserCase)
    : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUserCase fetchFeaturedBooksUserCase;

  Future<void> fetchFeaturedBooksMethod() async {
    emit(FeaturedBooksLoading());

    var result = await fetchFeaturedBooksUserCase.call();

    result.fold(
      (failure) =>
          emit(FeaturedBooksFailure(errorMessage: failure.errorMessage)),
      (success) => emit(FeaturedBooksSuccess(books: success)),
    );
  }
}
