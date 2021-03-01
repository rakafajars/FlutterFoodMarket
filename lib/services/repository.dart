abstract class Repository {
  Future<String> loginUser(
    String email,
    String password,
  );
}
