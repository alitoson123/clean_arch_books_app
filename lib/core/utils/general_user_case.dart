import 'package:clean_arch_books_app/core/Errors/failure.dart';
import 'package:dartz/dartz.dart';


abstract class ParameterUserCase<T,Parameters>{
    Future<Either<Failure,T>> call(Parameters parameters);
}
abstract class NonParameterUserCase<T> {
    Future<Either<Failure,T>> call();

}