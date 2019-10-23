Future<void> getUserOrder() {
// Imagine that this function is fetching user info but encounters a bug
  return Future.delayed(Duration(seconds: 3),
      () => throw Exception('Logout failed: user ID is invalid'));
}

main() {
  getUserOrder();
  print('Fetching user order...');
}
