import 'package:dartz/dartz.dart';
import 'package:git_locator/modules/search/domain/entities/result_search.dart';
import 'package:git_locator/modules/search/domain/errors/erros.dart';

abstract class SearchByTest {
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText);
}
