import 'package:bloc/bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState(email: '', password: ''));

  void updateEmail(String email) {
    state.email = email;
    emit(state);
  }

  void updatePassword(String password) {
    state.password = password;
    emit(state);
  }
}
