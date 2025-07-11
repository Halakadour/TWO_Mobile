import 'package:two_mobile/core/usecases/usecase.dart';
import 'package:two_mobile/features/task/domain/repos/task_repo.dart';

class ShowProjectBacklogTasksUsecase extends UseCase {
  final TaskRepo taskRepo;

  ShowProjectBacklogTasksUsecase(this.taskRepo);

  @override
  call(param) {
    return taskRepo.showProjectBackLogTasks(param);
  }
}
