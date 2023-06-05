import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sos/features/login/bloc/login_bloc.dart';
import 'package:sos/features/registration/UI/registration.dart';
import 'package:sos/widgets/email_field.dart';
import 'package:sos/widgets/password_field.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final LoginBloc loginBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: loginBloc,
      listenWhen: (previous, current) => current is LoginActionState,
      buildWhen: (previous, current) => current is !LoginActionState,
      listener: (context, state) {
        if (state is NavigateToRegisterPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RegistrationPage()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  padding: const EdgeInsets.all(30),
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          stops: [0.6, 1],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 179, 14, 11),
                            Color.fromARGB(255, 218, 40, 17)
                          ]),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                          bottomRight: Radius.circular(80))),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                // const SizedBox(height: 50,),
                Container(
                  padding: const EdgeInsets.fromLTRB(18.0, 60.0, 18.0, 40.0),
                  child: Column(
                    children: [
                      Form(
                        child: Column(
                          children: [
                            EmailField(
                              label: 'Email',
                              iconName: Icons.email,
                              inputType: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            PasswordField(
                              obscure: true,
                              label: 'Password',
                              iconName: Icons.key,
                              inputType: TextInputType.visiblePassword,
                              suffixIcon: Icons.visibility_off_outlined,
                              suffixIcon2: Icons.visibility_off_outlined,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          gradient: const LinearGradient(
                                              stops: [0.6, 1],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color.fromARGB(
                                                    255, 179, 14, 11),
                                                Color.fromARGB(255, 218, 40, 17)
                                              ])),
                                      child: ElevatedButton(
                                        onPressed: null,
                                        style: ButtonStyle(
                                          backgroundColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.transparent),
                                          shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                          ),
                                          // padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
                                        ),
                                        child: const Text(
                                          'LOGIN',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  198, 255, 255, 255),
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't Have An Account?"),
                          TextButton(
                              // onPressed: () {
                              //   Navigator.pushNamed(context, '/registration');
                              // },
                              onPressed: () {
                                loginBloc.add(RegisterNavigateEvent());
                              },
                              child: const Text(
                                'Register Now',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 179, 14, 11)),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
