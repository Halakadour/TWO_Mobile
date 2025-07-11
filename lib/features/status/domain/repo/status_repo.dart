import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/error/handling_exception_manager.dart';
import 'package:two_mobile/core/param/casule_param.dart';
import 'package:two_mobile/core/param/status_param.dart';
import 'package:two_mobile/features/status/data/models/status_model.dart';

abstract class StatusRepo with HandlingExceptionManager {
  // craete status
  Future<Either<Failure, Unit>> createStatus(CreateStatusParam param);
  // delete status
  Future<Either<Failure, Unit>> deleteStatus(DeleteStatusParam param);
  // update order
  Future<Either<Failure, Unit>> updateStatusOrder(UpdateStatusOrderParam param);

  // get status
  Future<Either<Failure, List<StatusModel>>> showStatus(
    TokenWithIdParam project,
  );
}
