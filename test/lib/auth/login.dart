import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'register.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('lib/images/Brandicon.png'),
      ),
      body: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool showSpinner = false;
  final _authentication = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '이메일',
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: '비밀번호',
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      try {
                        final currentUser =
                            await _authentication.signInWithEmailAndPassword(
                                email: email, password: password);
                        if (currentUser.user != null) {
                          _formKey.currentState!.reset();
                          if (!mounted) return;
                          print("로그인 완료");
                        }
                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('이메일 또는 비밀번호를 다시 확인해주세요.'),
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.black45,
                        ));
                      }
                    },
                    child: const Text('로그인')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('계정이 없으신가요?'),
                    TextButton(
                      child: const Text('회원가입'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                      },
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
