import 'package:bloc/bloc.dart';
import 'package:two_mobile/core/network/enums.dart';
import 'package:two_mobile/core/services/shared_preferences_services.dart';
import 'package:two_mobile/features/projects/data/model/show_all_project-response_model.dart';
import 'package:two_mobile/features/projects/domain/usecase/show_all_project_.dart';
import 'package:two_mobile/features/projects/domain/usecase/specify_project_team_usecase.dart';
import 'package:two_mobile/features/projects/domain/usecase/update_project_usecase.dart';
import 'package:two_mobile/features/team/data/model/add_member_response_model.dart';
import 'package:two_mobile/features/team/data/model/create_team_response_model.dart';
import 'package:two_mobile/features/team/data/model/team_model.dart';
import 'package:two_mobile/features/team/domain/usecase/add_members_usecase.dart';
import 'package:two_mobile/features/team/domain/usecase/create_team_usecase.dart';
import 'package:two_mobile/features/team/domain/usecase/show_team_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

//////////////////////////////// team & project bloc ////////////////////////////
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // team object from usecase
  final CreateTeamUsecase createTeamUsecase;
  final AddMembersUsecase addMembersUsecase;
  final ShowTeamUsecase showTeamUsecase;

  // porject object from usecase
  final UpdateProjectUsecase updateProjectUsecase;
  final SpecifyProjectTeamUsecase specifyProjectTeamUsecase;
  final ShowAllProjectUsecase showAllProjectUsecase;
  HomeBloc({
    required this.showAllProjectUsecase,
    required this.specifyProjectTeamUsecase,
    required this.updateProjectUsecase,
    required this.createTeamUsecase,
    required this.addMembersUsecase,
    required this.showTeamUsecase,
  }) : super(HomeState()) {
//------------------team bloc ---------------------//

    // create team
    on<CreateTeamEvent>((event, emit) async {
      emit(state.copyWith(createTeamStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await createTeamUsecase.call(CreateTeamParams(
            name: event.name,
            teamManager: event.teamManager,
            treamMember: event.teamMember,
            token: token));
        result.fold((left) {
          emit(
            state.copyWith(
                createTeamStatus: CasualStatus.failure, message: left.message),
          );
        }, (right) {
          emit(
            state.copyWith(createTeamStatus: CasualStatus.success),
          );
        });
      } else {
        emit(state.copyWith(createTeamStatus: CasualStatus.noToken));
      }
    });

    // add members
    on<AddMemberEvent>((event, emit) async {
      emit(state.copyWith(addMemberStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await addMembersUsecase.call(AddMemberParams(
            teamId: event.teamId,
            teamMembers: event.teamMembers,
            token: token));
        result.fold((left) {
          emit(
            state.copyWith(
                addMemberStatus: CasualStatus.failure,
                messageAddMember: left.message),
          );
        }, (right) {
          emit(
            state.copyWith(addMemberStatus: CasualStatus.success),
          );
        });
      } else {
        emit(state.copyWith(addMemberStatus: CasualStatus.noToken));
      }
    });

    // show team
    on<ShowTeamEvent>((event, emit) async {
      emit(state.copyWith(showTeamStatus: CasualStatus.loading));
      final result = await showTeamUsecase.call();
      result.fold(
          (l) => emit(
                state.copyWith(
                  showTeamStatus: CasualStatus.failure,
                  messageShowTeam: l.message,
                ),
              ),
          (r) => emit(
                state.copyWith(
                  showTeamStatus: CasualStatus.success,
                  listTeam: r,
                ),
              ));
    });

    // --------------- project bloc ----------------//

    // update project
    on<UpdateProjectEvent>((event, emit) async {
      emit(state.copyWith(updateProjectStatus: CasualStatus.loading));
      final result = await updateProjectUsecase.call(UpdateParameters(
          flullName: event.flullName,
          companyName: event.companyName,
          email: event.email,
          phone: event.phone,
          projectType: event.projectType,
          projectDescraption: event.projectDescraption,
          cost: event.cost,
          duration: event.duration,
          document: event.document,
          requirements: event.requirements,
          cooperationType: event.cooperationType,
          contactTime: event.contactTime,
          private: event.private,
          projectId: event.projectId,
          token: event.token));
      result.fold(
          (l) => emit(
                state.copyWith(
                  updateProjectStatus: CasualStatus.failure,
                  messageUpdateProject: l.message,
                ),
              ),
          (r) => emit(
                state.copyWith(
                  updateProjectStatus: CasualStatus.success,
                ),
              ));
    });

    // Specify Project Team
    on<SpecifyProjectTeamEvent>((event, emit) async {
      emit(state.copyWith(specifyProjectTeamStatus: CasualStatus.loading));
      final result = await specifyProjectTeamUsecase.call(
          SpecifyProjectTeamParameters(
              projectId: event.projectId,
              teamId: event.teamId,
              token: event.token));
      result.fold(
          (l) => emit(
                state.copyWith(
                  specifyProjectTeamStatus: CasualStatus.failure,
                  messageSpecifyProjectTeam: l.message,
                ),
              ),
          (r) => emit(
                state.copyWith(
                  specifyProjectTeamStatus: CasualStatus.success,
                ),
              ));
    });

    // show all project
    on<ShowAllProjectEvent>((event, emit) async {
      emit(state.copyWith(specifyProjectTeamStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showAllProjectUsecase.call(token);
        result.fold(
          (l) => emit(
            state.copyWith(
              showAllProjectStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              showAllProjectStatus: CasualStatus.success,
              allProjectList: r,
            ),
          ),
        );
      } else {
        emit(state.copyWith(showAllProjectStatus: CasualStatus.notAuthorized));
      }
    });
  }
}
