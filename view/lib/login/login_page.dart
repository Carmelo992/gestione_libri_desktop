import 'package:flutter/material.dart';
import 'package:view/injectable.dart';
import 'package:view/login/login_strings.dart';
import 'package:view_model/view_model.dart';

class LoginPage extends InjectableStateful {
  const LoginPage(super.inject, {super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginViewModel get vm => widget.inject();

  LoginStrings get strings => widget.inject();

  @override
  void initState() {
    vm.loginError.addListener(loginErrorHandler);
    super.initState();
  }

  void loginErrorHandler() {
    if (vm.loginError.value == null) return;
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(strings.loginError(vm.loginError.value!.name))));
  }

  @override
  void dispose() {
    vm.loginError.removeListener(loginErrorHandler);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: vm.isLoading,
          builder: (context, value, child) {
            if (value) return CircularProgressIndicator();
            return Card(
              child: Container(
                constraints: BoxConstraints(maxWidth: 600),
                margin: EdgeInsets.all(20),
                child: Column(
                  spacing: 20,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: vm.emailController,
                      decoration: InputDecoration(hintText: strings.email),
                    ),
                    TextField(
                      controller: vm.passwordController,
                      decoration: InputDecoration(hintText: strings.password),
                      obscureText: true,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          vm.login();
                        },
                        child: Text(strings.login),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
