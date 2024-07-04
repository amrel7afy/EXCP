abstract class AuthStates{}

class AuthInitial extends AuthStates {}
class AuthLoading extends AuthStates {}
class AuthSuccess extends AuthStates {}
class AuthCreateUserSuccess extends AuthStates {}
class AuthUserIsExists extends AuthStates {}
class AuthFailure extends AuthStates {}
class AuthUserNotExists extends AuthStates {}