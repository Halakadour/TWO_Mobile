import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:two_mobile/core/network/enums.dart';
import 'package:two_mobile/core/services/shared_preferences_services.dart';
import 'package:two_mobile/features/team/data/model/team_response_model.dart';
import 'package:two_mobile/features/team/domain/usecase/create_team_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // create team
  final CreateTeamUsecase createTeamUsecase;
  HomeBloc({
    required this.createTeamUsecase,
  }) : super(HomeState()) {
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
  }
}
