import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/provider/theme_provider.dart';
import 'package:project/shared/loading.dart';
import '../../services/auth.dart';
import '../../shared/constants.dart';

class SignIn extends ConsumerStatefulWidget {
  final Function toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              elevation: 0.0,
              title: const Text('Sign in'),
              actions: [
                ElevatedButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: const Icon(Icons.person),
                  label: const Text('Register'),
                ),
                switchButton(themeMode, themeNotifier)
              ],
            ),
            body: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Forget Password?',
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await authService.signInWithEmailAndPassword(
                                    emailController.text.trim(),
                                    passwordController.text.trim());
                              }
                            },
                            child: const Text('Sign in')),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: authService.signInWithFacebook,
                            child: Image.asset(
                              'assets/signin/facebook.png',
                              width: 50, // Adjust the size as needed
                              height: 50,
                            ),
                          ),
                          InkWell(
                            onTap: authService.signInWithGoogle,
                            child: Image.asset(
                              'assets/signin/google.png',
                              width: 50, // Adjust the size as needed
                              height: 50,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
