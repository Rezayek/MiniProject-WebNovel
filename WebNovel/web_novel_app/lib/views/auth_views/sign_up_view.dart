import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/Auth/auth_bloc/auth_events.dart';
import 'package:web_novel_app/widgets/auth_widgets/user_terms_line.dart';

import '../../constants/colors.dart';
import '../../services/Auth/auth_bloc/auth_bloc.dart';
import '../../services/Auth/auth_bloc/auth_state.dart';
import '../../services/Auth/auth_exceptions.dart';
import '../../utilities/dialogs/error_dialog.dart';
import '../../utilities/dialogs/loading_dialog.dart';
import '../../widgets/auth_widgets/auth_button.dart';
import '../../widgets/auth_widgets/input_widget.dart';

import 'dart:developer' as debug;

class SignUpView extends StatefulWidget {
  static bool isChecked = false;
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late TextEditingController _name, _email, _password, _passwordConf;
  CloseDialog? _closeDialogHandle;
  @override
  void initState() {
    _name = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _passwordConf = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _passwordConf.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        final closeDialog = _closeDialogHandle;
        if (state is AuthStateRegistering) {
          if (!state.isLoading && closeDialog != null) {
            closeDialog();
            _closeDialogHandle = null;
          } else if (state.isLoading && closeDialog == null) {
            _closeDialogHandle =
                showLoadingDialog(context: context, text:'Loading');
          }

          if (state.exception is WeakPasswordAuthException) {
            await errorDialog('An Error has occurred',context, 'Weak password');
          } else if (state.exception is EmailAlreadyInUseAuthException) {
            await errorDialog('An Error has occurred',context, 'Email is already used');
          } else if (state.exception is InvalidEmailAuthException) {
            await errorDialog('An Error has occurred',context, 'Invalid email');
          } else if (state.exception is GenericAuthException) {
            await errorDialog('An Error has occurred',context, 'please check your given infos');
          }
        }
        else if(state is AuthStateNeedsVerification){
          await errorDialog('Notification',context, 'A Verification email has been sended to your email');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white.withOpacity(0.1),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: InkWell(
                    onTap: () {
                      context.read<AuthBloc>().add(const AuthEventLogOut());
                    },
                    child: const FaIcon(Icons.arrow_back_ios_new_outlined,
                        color: black, size: 30)),
              ),
              const Text(
                "SignUp",
                style: TextStyle(
                    color: black, fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
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
                    height: 20.h,
                    width: 45.w,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/banner.png'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                InputWidget(
                    controller: _name,
                    inputLabel: "Name",
                    hintText: "Enter your name",
                    textColor: black,
                    fontZise: 15,
                    borderRadius: 15,
                    fontWeight: FontWeight.w500,
                    textType: TextInputType.emailAddress,
                    isObscured: false,
                    paddingValues: const [5, 10, 10, 5]),
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
                    hintText: "Enter password",
                    textColor: black,
                    fontZise: 15,
                    borderRadius: 15,
                    fontWeight: FontWeight.w500,
                    textType: TextInputType.text,
                    isObscured: true,
                    paddingValues: const [5, 10, 10, 5]),
                InputWidget(
                    controller: _passwordConf,
                    inputLabel: "Configure Password",
                    hintText: "Configure your Password",
                    textColor: black,
                    fontZise: 15,
                    borderRadius: 15,
                    fontWeight: FontWeight.w500,
                    textType: TextInputType.text,
                    isObscured: true,
                    paddingValues: const [5, 10, 10, 5]),
                const UserTermsLine(),
                InkWell(
                    onTap: () async {
                      debug.log(SignUpView.isChecked.toString());
                      if (_email.text.isNotEmpty && _password.text.isNotEmpty && _name.text.isNotEmpty && _passwordConf.text.isNotEmpty) {
                        if(_password.text != _passwordConf.text)
                        {
                          await errorDialog('An Error has occurred',context, 'Recheck your Password');
                        }else{
                          if (SignUpView.isChecked) {
                            context.read<AuthBloc>().add(AuthEventRegister(
                                _email.text, _password.text, _name.text));
                          } else {
                            await errorDialog('Reminder',context, 'Check User Terms.');
                          }
                        }
                        
                      }else {
                        await errorDialog(
                            'Reminder',context, 'Fill all labels please');
                      }
                    },
                    child: AuthButton(buttonText: "SignUp")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
