class MemberEntity {
  final int mId;
  final String mName;
  final String mEmail;
  final String? mImage;
  final String mRole;
  final String? mCv;

  MemberEntity({
    required this.mId,
    required this.mName,
    required this.mEmail,
    this.mImage,
    required this.mRole,
    this.mCv,
  });
}
