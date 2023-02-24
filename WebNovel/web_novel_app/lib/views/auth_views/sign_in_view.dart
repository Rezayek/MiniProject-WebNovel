
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/services/Auth/auth_bloc/auth_events.dart';
import 'package:web_novel_app/widgets/auth_widgets/auth_button.dart';
import 'package:web_novel_app/widgets/auth_widgets/forget_password.dart';
import 'package:web_novel_app/widgets/auth_widgets/input_widget.dart';
import 'package:web_novel_app/widgets/auth_widgets/other_auths.dart';

import '../../services/Auth/auth_bloc/auth_bloc.dart';
import '../../services/Auth/auth_bloc/auth_state.dart';
import '../../services/Auth/auth_exceptions.dart';
import '../../utilities/dialogs/error_dialog.dart';
import '../../utilities/dialogs/loading_dialog.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late TextEditingController _email;
  late TextEditingController _password;
  CloseDialog? _closeDialogHandle;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        final closeDialog = _closeDialogHandle;
        if (state is AuthStateLoggedOut) {
          if (!state.isLoading && closeDialog != null) {
            closeDialog();
            _closeDialogHandle = null;
          } else if (state.isLoading && closeDialog == null) {
            _closeDialogHandle =
                showLoadingDialog(context: context, text: state.loadingText);
          }
          if (state.exception is UserNotFoundAuthException) {
            await errorDialog('An Error has occurred',context, 'User not found');
          } else if (state.exception is WrongPasswordAuthException) {
            await errorDialog('An Error has occurred',context, 'Wrong email or password');
          } else if (state.exception is GenericAuthException) {
            await errorDialog('An Error has occurred',context, 'indentified Error try again');
          }
        } else if (state is AuthStateForgotPassword) {
          if (state.exception is InvalidEmailAuthException) {
            await errorDialog('An Error has occurred', context, 'Invalid email');
          } else if (state.exception is UserNotFoundAuthException) {
            await errorDialog('An Error has occurred', context, 'User not found');
          } else if (state.exception is GenericAuthException) {
            await errorDialog('An Error has occurred', context, 'indentified Error try again');
          } else if (state.exception == null && state.hasSentEmail) {
            await errorDialog('An Error has occurred', context, 'Areset Email has been sended');
          }
        } else if (state is AuthStateNeedsVerification) {
          if (!state.isLoading && closeDialog != null) {
            closeDialog();
            _closeDialogHandle = null;
            await errorDialog('An Error has occurred', context, 'Account is not verified');
          }
          
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                white,
                white,
                darkPurple.withOpacity(0.7),
                lightPurple.withOpacity(0.7),
                black
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 2.h),
                  child: Container(
                    height: 30.h,
                    width: 66.w,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/banner.png'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                InputWidget(
                    controller: _email,
                    inputLabel: "Email",
                    hintText: "Enter your email",
                    textColor: black,
                    fontZise: 15,
                    borderRadius: 15,
                    fontWeight: FontWeight.w500,
                    textType: TextInputType.emailAddress,
                    isObscured: false,
                    paddingValues: const [5, 10, 10, 5]),
                InputWidget(
                    controller: _password,
                    inputLabel: "Password",
                    hintText: "Enter your password",
                    textColor: black,
                    fontZise: 15,
                    borderRadius: 15,
                    fontWeight: FontWeight.w500,
                    textType: TextInputType.text,
                    isObscured: true,
                    paddingValues: const [5, 10, 10, 5]),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 0.5.h,
                  ),
                  child: ForgetPassword(email: _email.text),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () async {
                          if(_email.text.isNotEmpty && _password.text.isNotEmpty){
                            context
                              .read<AuthBloc>()
                              .add(AuthEventLogIn(_email.text, _password.text));
                          }else{
                            await errorDialog('Reminder', context, 'Fill all labels please');
                          }
                          
                        },
                        child: AuthButton(buttonText: "Login")),
                    InkWell(
                        onTap: () {
                          context
                              .read<AuthBloc>()
                              .add(const AuthEventShouldRegister());
                        },
                        child: AuthButton(buttonText: "SignUp")),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 1.h),
                  child: const OtherAuths(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
