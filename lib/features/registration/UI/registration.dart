import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sos/features/login/UI/login.dart';
import 'package:sos/features/registration/bloc/registration_bloc.dart';
import 'package:sos/widgets/email_field.dart';
import 'package:sos/widgets/name_field.dart';
import 'package:sos/widgets/number_field.dart';
import 'package:sos/widgets/password_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final RegistrationBloc regBloc = RegistrationBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      bloc: regBloc,
      listenWhen: (previous, current) => current is RegistrationActionState,
      buildWhen: (previous, current) => current is !RegistrationActionState,
      listener: (context, state) {
        if (state is NavigateToLoginPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LogIn()));
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
                    'Register',
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
                            NameField(
                              // erroFunc: (value) => {
                              //   setState(() {
                              //     if(value.contains(' ')) {
                              //       errorTextVal:  "Please don't give space";
                              //     } else {
                              //       errorTextVal: '';
                              //     }
                              //   })
                              // },
                              label: 'Full Name',
                              iconName: Icons.person,
                              inputType: TextInputType.text,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            NumberField(
                              label: 'Phone',
                              iconName: Icons.phone,
                              inputType: const TextInputType.numberWithOptions(
                                  signed: true, decimal: false),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
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
                              suffixIcon2: Icons.visibility_outlined,
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
                                          'REGISTER',
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
                          const Text('Have An Account Already?'),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/');
                              },
                              child: const Text(
                                'Login',
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
