import 'package:bloc/bloc.dart';

import '../../../utilities/singletons/user_singleton.dart';
import '../auth_provider.dart';

import '../user_cloud/user_data_firebase.dart';
import 'auth_events.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthProvider provider)
      : super(const AuthStateUnInitialized(isLoading: true)) {
    //send verification

    on<AuthEventSendEmailVerification>(
      ((event, emit) async {
        await provider.sendEmailVerification();
        emit(state);
      }),
    );
    on<AuthEventShouldRegister>(
      ((event, emit) {
        emit(const AuthStateRegistering(exception: null, isLoading: false));
      }),
    );

    //register

    on<AuthEventRegister>(
      (event, emit) async {
        final email = event.email;
        final password = event.password;
        final name = event.name;

        try {
          emit(const AuthStateRegistering(exception: null, isLoading: true));
          final user =
              await provider.creatUser(email: email, password: password);
          UserDataFirebase userDataStorage = UserDataFirebase();
          await userDataStorage.creatNewUserData(
            userId: user.id,
            email: email,
            name: name,
          );
          emit(const AuthStateRegistering(exception: null, isLoading: false));
          emit(const AuthStateNeedsVerification(isLoading: false));
          await provider.sendEmailVerification();
        } on Exception catch (e) {
          emit(AuthStateRegistering(exception: e, isLoading: false));
        }
      },
    );

    //initialize
    on<AuthEventInitialize>(
      ((event, emit) async {
        emit(const AuthStateInitialized(isLoading: false));
        try {
          await provider.initialize();
          final user = provider.currentUser;
          final token = await provider.token();
          
          if (user == null) {
            emit(const AuthStateLoggedOut(exception: null, isLoading: false));
          } else if (!user.isEmailVerified) {
            emit(const AuthStateNeedsVerification(isLoading: false));
          } else {
            final userData = UserSingleton();
            final data = await UserDataFirebase().getUserData(userAcountId: user.id, token: token);
            userData.setUser(data[0]);
            emit(AuthStateLoggedIn(user: user, isLoading: false));
          }
        } on Exception catch (e) {
          emit(AuthStateLoggedOut(exception: e, isLoading: false));
        }
      }),
    );

    on<AuthEventLogIn>(
      ((event, emit) async {
        final email = event.email;
        final password = event.password;
        try {
          emit(const AuthStateLoggedOut(exception: null, isLoading: true));
          final user = await provider.logIn(email: email, password: password);
          final token = await provider.token();
          final userData = UserSingleton();
          final data = await UserDataFirebase().getUserData(userAcountId: user.id, token: token);
          userData.setUser(data[0]);

          emit(const AuthStateLoggedOut(exception: null, isLoading: false));
          if (!user.isEmailVerified) {
            emit(const AuthStateNeedsVerification(isLoading: false));
          } else {
            emit(AuthStateLoggedIn(user: user, isLoading: false));
          }
        } on Exception catch (e) {
          emit(AuthStateLoggedOut(exception: e, isLoading: false));
        }
      }),
    );

    on<AuthEventLogOut>(
      ((event, emit) async {
        try {
          emit(const AuthStateLoggedOut(exception: null, isLoading: true));
          await provider.logOut();
          emit(const AuthStateLoggedOut(exception: null, isLoading: false));
        } on Exception catch (e) {
          emit(AuthStateLoggedOut(exception: e, isLoading: false));
        }
      }),
    );

    on<AuthEventForgotPassword>(((event, emit) async {
      final email = event.email;
      bool hasSendEmail;
      Exception? exception;

      if (email == null) {
        return;
      }

      try {
        await provider.sendPasswordReset(toEmail: email);
        hasSendEmail = true;
        exception = null;
      } on Exception catch (e) {
        hasSendEmail = false;
        exception = e;
      }
      emit(
        AuthStateForgotPassword(
            exception: exception, hasSentEmail: hasSendEmail, isLoading: false),
      );
    }));
  }
}
