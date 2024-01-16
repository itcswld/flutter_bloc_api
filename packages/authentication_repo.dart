import 'dart:async';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthRepo {
  final _ctrl = StreamController<AuthStatus>();
}
