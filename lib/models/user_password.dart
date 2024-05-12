class UserPassword {
  UserPassword({
    required this.user,
    required this.passWord,
  });

  final String user;
  final String passWord;
}

final List<UserPassword> userdata = [
  UserPassword(
    user: 'jack',
    passWord: '1234',
  ),
  UserPassword(
    user: 'sam',
    passWord: '2345',
  ),
];
