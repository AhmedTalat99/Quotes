import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/exceptions.dart';

import 'package:quotes/core/error/failures.dart';
import 'package:quotes/features/splash/data/datasources/lang_local_data_source.dart';

import '../../domain/repositories/lang_repository.dart';

class LangRepositoryImpl implements LangRepository {
  final LangLocalDataSource langLocalDataSource;

  LangRepositoryImpl({required this.langLocalDataSource});
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final langIsChanged =
          await langLocalDataSource.changeLang(langCode: langCode);
      return right(langIsChanged);
    } on CacheException {
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> getSavedLang() async {
    try {
      final langCode = await langLocalDataSource.getSavedLang();
      return right(langCode);
    } on CacheException {
      return left(CacheFailure());
    }
  }
}
