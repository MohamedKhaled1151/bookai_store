import 'package:bloc/bloc.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  login({required String email, required String pass}) async {
    emit(LoginLoadingState());
    final response = await AuthRepo.login(email: email, pass: pass);

    if (response != null) {
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState());
    }
  }

  register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(RegisterLoadingState());
    final response = await AuthRepo.register(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    if (response != null) {
      emit(RegisterSuccessState());
    } else {
      emit(RegisterErrorState());
    }
  }
}
