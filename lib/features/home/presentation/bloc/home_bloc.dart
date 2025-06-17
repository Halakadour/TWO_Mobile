import 'package:bloc/bloc.dart';
import 'package:two_mobile/core/network/enums.dart';
import 'package:two_mobile/core/services/shared_preferences_services.dart';
import 'package:two_mobile/features/team/data/model/add_member_response_model.dart';
import 'package:two_mobile/features/team/data/model/create_team_response_model.dart';
import 'package:two_mobile/features/team/domain/entity/team_entity.dart';
import 'package:two_mobile/features/team/domain/usecase/add_members_usecase.dart';
import 'package:two_mobile/features/team/domain/usecase/create_team_usecase.dart';
import 'package:two_mobile/features/team/domain/usecase/show_team_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CreateTeamUsecase createTeamUsecase;
  final AddMembersUsecase addMembersUsecase;
  final ShowTeamUsecase showTeamUsecase;
  HomeBloc(this.showTeamUsecase,
      {required this.createTeamUsecase, required this.addMembersUsecase})
      : super(HomeState()) {
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
  }
}
