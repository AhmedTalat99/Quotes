import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/core/usecases/usecase.dart';
import 'package:quotes/features/splash/domain/repositories/lang_repository.dart';

class GetSavedLangUseCase implements UseCase {
  final LangRepository langRepository;

  GetSavedLangUseCase({required this.langRepository});
  @override
  Future<Either<Failure, dynamic>> call(params) async{
    return await langRepository.getSavedLang();
  }
}
