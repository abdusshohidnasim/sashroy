abstract interface class ResetVerificationRepository {
  const ResetVerificationRepository();

  Future<void> verifyResetCode({
    required String code,
    String? email,
  });

  Future<void> resendResetCode({
    String? email,
  });
}

class StubResetVerificationRepository implements ResetVerificationRepository {
  const StubResetVerificationRepository();

  @override
  Future<void> verifyResetCode({required String code, String? email}) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));

    if (code.length != 6) {
      throw const FormatException('Invalid code length');
    }
  }

  @override
  Future<void> resendResetCode({String? email}) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
  }
}