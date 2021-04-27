import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_locator/modules/search/domain/entities/result_search.dart';
import 'package:git_locator/modules/search/domain/errors/erros.dart';
import 'package:git_locator/modules/search/domain/repositories/search_repository.dart';
import 'package:git_locator/modules/search/domain/usecases/search_by_text_impl.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByTextImpl(repository);

  test("should return  a list of ResultSearch", () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));
    final result = await usecase("eric");
    expect(result | null, isA<List<ResultSearch>>());
  });

  test("should return  a exception if invalid text", () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));
    var result = await usecase(null);

    expect(result.fold(id, id), isA<InvalidTextError>());
    result = await usecase("");
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
