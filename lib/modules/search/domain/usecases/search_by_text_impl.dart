import 'package:dartz/dartz.dart';
import 'package:git_locator/modules/search/domain/entities/result_search.dart';
import 'package:git_locator/modules/search/domain/errors/erros.dart';
import 'package:git_locator/modules/search/domain/repositories/search_repository.dart';
import 'package:git_locator/modules/search/domain/usecases/search_by_text.dart';

class SearchByTextImpl implements SearchByTest {
  //first create and instantiate the repository abstract class
  final SearchRepository repository;
  SearchByTextImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(
      String searchText) async {
    if (searchText == null || searchText.isEmpty) {
      return Left(InvalidTextError());
    }
    return repository.search(searchText);
  }
}
