import 'package:two_mobile/features/team/domain/entity/member_entity.dart';

class TeamEntity {
  final int id;
  final String name;
  final List<MemberEntity> membersList;

  TeamEntity({required this.id, required this.name, required this.membersList});
}
