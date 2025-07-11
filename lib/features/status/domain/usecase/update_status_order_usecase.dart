import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/param/status_param.dart';
import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/status/domain/repo/status_repo.dart';

class UpdateStatusOrderUsecase
    extends UseCase<Future<Either<Failure, Unit>>, UpdateStatusOrderParam> {
  final StatusRepo statusRepo;

  UpdateStatusOrderUsecase(this.statusRepo);

  @override
  Future<Either<Failure, Unit>> call(UpdateStatusOrderParam param) {
    return statusRepo.updateStatusOrder(param);
  }
}
