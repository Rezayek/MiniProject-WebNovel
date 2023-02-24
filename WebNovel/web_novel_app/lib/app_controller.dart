import 'package:flutter/material.dart';
import 'package:web_novel_app/utilities/singletons/user_singleton.dart';
import 'package:web_novel_app/views/auth_views/default_view.dart';
import 'package:web_novel_app/views/auth_views/sign_in_view.dart';
import 'package:web_novel_app/views/auth_views/sign_up_view.dart';

import 'services/Auth/auth_bloc/auth_bloc.dart';
import 'services/Auth/auth_bloc/auth_events.dart';
import 'services/Auth/auth_bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'views/navigation_views/main_navigation_view.dart';

class AppController extends StatefulWidget {
  const AppController({Key? key}) : super(key: key);

  @override
  State<AppController> createState() => _AppControllerState();
}

class _AppControllerState extends State<AppController> {
  UserSingleton user = UserSingleton();
  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthStateInitialized) {
          return const DefaultView();
        }
        if (state is AuthStateLoggedOut) {
          return const SignInView();
        } else if (state is AuthStateRegistering) {
          return const SignUpView();
        } else if (state is AuthStateLoggedIn) {
          return const MainNavigationView();
        } else if (state is AuthStateNeedsVerification) {
          return const SignInView();
        } else if (state is AuthStateForgotPassword) {
          return const SignInView();
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
