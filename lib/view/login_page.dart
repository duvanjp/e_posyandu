import 'package:e_posyandu/app_color.dart';
import 'package:e_posyandu/widget/add_input.dart';
import 'package:e_posyandu/widget/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // late AuthCubit authCubit;
  final TextEditingController _emailInput = TextEditingController();
  final TextEditingController _passwordInput = TextEditingController();
  bool _ableToNext = false;

  @override
  void initState() {
    // authCubit = BlocProvider.of<AuthCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {
        // if (state is AuthInitial) {
        //   LoadingDialog(
        //           title: "Melakukan autentikasi ...",
        //           description: "Mohon tunggu beberapa saat.")
        //       .show(context);
        // } else if (state is AuthSuccessState) {
        //   Future.delayed(Duration(seconds: 2));
        //   Navigator.of(context).pop();
        //   Navigator.of(context)
        //       .push(MaterialPageRoute(builder: (context) => HomePage()));
        // } else if (state is AuthFailedState) {
        //   Navigator.of(context).pop();
        //   AppAlertDialog(
        //           title: "Autentikasi gagal",
        //           description: state.message ?? '',
        //           positiveButtonText: "Oke",
        //           positiveButtonOnTap: () => Navigator.of(context).pop())
        //       .show(context);
        // }
      },
      // bloc: authCubit,
      child: BlocBuilder(
        // bloc: authCubit,
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      alignment: Alignment.center,
                      child: Text(
                        "Masukkan akun anda",
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: AddInput(
                        controller: _emailInput,
                        label: "Email",
                        type: TextInputType.emailAddress,
                        hint: "Masukkan email akun anda",
                        validation: (val) {
                          // if (GlobalHelper.isEmpty(val)) {
                          //   return "Alamat email tidak boleh kosong";
                          // } else if (!val!.contains("@")) {
                          //   return "Format email harus sesuai";
                          // }

                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: AddInput(
                        controller: _passwordInput,
                        label: "Kata sandi",
                        hint: "Kata sandi akun anda",
                        passwordField: true,
                        onChanged: (val) {
                          setState(() {
                            _ableToNext = val.length >= 8;
                          });
                        },
                        validation: (val) {
                          // if (GlobalHelper.isEmpty(val)) {
                          //   return "Kata sandi tidak boleh kosong";
                          // } else if (val!.length < 8) {
                          //   return "Kata sandi harus lebih dari 8 karakter";
                          // }

                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomSheet: Container(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              width: double.infinity,
              child: BaseButton(
                style: AppButtonStyle.primary,
                radius: 8,
                padding: 16,
                isDisabled: !_ableToNext,
                text: "Masuk",
                onPressed: () {
                  // authCubit.auth(_emailInput.text, _passwordInput.text);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
