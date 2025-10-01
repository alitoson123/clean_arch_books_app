import 'package:clean_arch_books_app/Features/home/Data/Local_data_source/home_local_data_source_impl.dart';
import 'package:clean_arch_books_app/Features/home/Data/Remote_data_source/home_remote_data_source_impl.dart';
import 'package:clean_arch_books_app/Features/home/Data/home_repo_impl/home_repo_impl.dart';
import 'package:clean_arch_books_app/Features/home/Domain/Use_cases/fetch_featured_books_user_case.dart';
import 'package:clean_arch_books_app/Features/home/Domain/Use_cases/fetch_newest_books_user_case.dart';
import 'package:clean_arch_books_app/core/Services/api_service.dart';
import 'package:clean_arch_books_app/core/Services/hive_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FetchFeaturedBooksUserCase>(
    FetchFeaturedBooksUserCase(homeRepo: getIt.get<HomeRepoImpl>()),
  );
  getIt.registerSingleton<FetchNewestBooksUserCase>(
    FetchNewestBooksUserCase(homeRepo: getIt.get<HomeRepoImpl>()),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        hiveService: HiveService(),
        apiService: ApiService(dio: Dio()),
      ),
      homeLocalDataSource: HomeLocalDataSourceImpl(hiveService: HiveService()),
    ),
  );
}
