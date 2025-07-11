import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/error/failures.dart';
import 'package:two_mobile/core/error/handling_exception_manager.dart';
import 'package:two_mobile/core/param/casule_param.dart';
import 'package:two_mobile/core/param/task_param.dart';
import 'package:two_mobile/features/sprint/data/models/sprint.dart';
import 'package:two_mobile/features/status/data/models/status_model.dart';
import 'package:two_mobile/features/task/domain/entity/task_entity.dart';

abstract class TaskRepo with HandlingExceptionManager {
  Future<Either<Failure, Unit>> createTask(CreateOrUpdateTaskParam param);
  Future<Either<Failure, Unit>> updateTask(CreateOrUpdateTaskParam param);
  Future<Either<Failure, Unit>> deleteTask(TokenWithIdParam task);
  Future<Either<Failure, TaskEntity>> showTaskDetails(TokenWithIdParam task);
  Future<Either<Failure, List<TaskEntity>>> showProjectTasks(
    TokenWithIdParam project,
  );
  Future<Either<Failure, List<TaskEntity>>> showSprintTasks(
    TokenWithIdParam sprint,
  );
  Future<Either<Failure, List<TaskEntity>>> showMyProjectTasks(
    ShowMyProjectTasksParam param,
  );
  Future<Either<Failure, List<TaskEntity>>> showMySprintTasks(
    ShowMySprintTasksParam param,
  );

  Future<Either<Failure, List<StatusModel>>> showProjectBoard(
    ShowProjectBoardParam param,
  );
  Future<Either<Failure, List<Sprint>>> showPenedingSprintsTasks(
    TokenWithIdParam project,
  );
  Future<Either<Failure, List<TaskEntity>>> showProjectBackLogTasks(
    TokenWithIdParam project,
  );
  Future<Either<Failure, Unit>> createBacklogTasksSprint(
    CreateBacklogTasksSprintParam param,
  );
}
