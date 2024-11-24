import 'package:project/provider/theme_provider.dart';
import 'package:project/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:project/shared/loading.dart';
import '../../services/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Register extends ConsumerStatefulWidget {
  final Function toggleView;
  const Register({super.key, required this.toggleView});

  @override
  ConsumerState<Register> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authService = ref.read(authServiceProvider.notifier);
    final isLoading = ref.watch(authServiceProvider); // Watch the loading state
    final themeNotifier = ref.read(themeNotifierProvider.notifier);
    final themeMode = ref.watch(themeNotifierProvider);
    return isLoading
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text('Register'),
              actions: [switchButton(themeMode, themeNotifier)],
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: userNameController,
                      decoration: textInputDecoration.copyWith(
                          prefixIcon: const Icon(Icons.person),
                          hintText: 'Enter your Username',
                          labelText: 'Username'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      decoration: textInputDecoration.copyWith(
                          prefixIcon: const Icon(Icons.email),
                          hintText: 'Enter your email address',
                          labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      decoration: textInputDecoration.copyWith(
                          prefixIcon: const Icon(Icons.lock),
                          hintText: 'Enter your password',
                          labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: confirmPasswordController,
                      decoration: textInputDecoration.copyWith(
                          prefixIcon: const Icon(Icons.lock),
                          hintText: 'Re-enter your password',
                          labelText: 'Confirm Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await authService.registerWithEmailAndPassword(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              userNameController.text.trim(),
                            );
                          }
                        },
                        child: const Text('Register'),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text('Already have an account?'),
                      TextButton(
                          onPressed: () {
                            widget.toggleView();
                          },
                          child: const Text("SIGN IN"))
                    ])
                  ],
                ),
              ),
            ),
          );
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
