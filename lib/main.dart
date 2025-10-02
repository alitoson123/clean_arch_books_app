import 'package:clean_arch_books_app/Features/home/Domain/Entities/book_entity.dart';
import 'package:clean_arch_books_app/Features/home/Domain/Use_cases/fetch_featured_books_user_case.dart';
import 'package:clean_arch_books_app/Features/home/Domain/Use_cases/fetch_newest_books_user_case.dart';
import 'package:clean_arch_books_app/Features/home/presentation/View_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_books_app/Features/home/presentation/View_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_arch_books_app/constants.dart';
import 'package:clean_arch_books_app/core/Services/bloc_observer_service.dart';
import 'package:clean_arch_books_app/core/Services/locator_service.dart';
import 'package:clean_arch_books_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(BookEntityAdapter());

  await Hive.openBox<BookEntity>('FeaturedBooksBox');
  await Hive.openBox<BookEntity>('NewestBooksBox');

  setup();
  Bloc.observer = BlocObserverService();

  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(getIt<FetchFeaturedBooksUserCase>())
              ..fetchFeaturedBooksMethod();
          },
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt<FetchNewestBooksUserCase>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
