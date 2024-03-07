import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:pizza/modules/register_page/home_page.dart';
import 'package:pizza/theme/app_colors.dart';
import 'package:pizza/theme/app_textstyle.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool? isChecked = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(children: [
            Container(
                child: Image.asset(
              'assets/cezar.webp',
              fit: BoxFit.fill,
            )),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 30),
              child: Row(
                children: [
                  Text(
                    "Регистрация",
                    style: AppTextStyle.bigTextStyle,
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(right: 30),
              child: Text(
                'Заполните данные и создайте новый аккаунт',
                style: AppTextStyle.smallTextStyle,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // USERNAME TEXTFIELD
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 370,
                child: TextFormField(
                  controller: emailController,

                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Password cannot be empty';
                  //   } else if (value != password) {
                  //     return 'Wrong password';
                  //   }
                  //   return null;
                  // },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.textFormFieldColor,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                    hintText: 'Введите имя пользователя',
                    hintStyle: const TextStyle(
                        color: AppColors.smallTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // EMAIL TEXTFIELD
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 370,
                child: TextFormField(
                  controller: emailController,

                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Password cannot be empty';
                  //   } else if (value != password) {
                  //     return 'Wrong password';
                  //   }
                  //   return null;
                  // },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.textFormFieldColor,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                    hintText: 'Введите электронную почту',
                    hintStyle: const TextStyle(
                        color: AppColors.smallTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //PASSWORD TEXTFIELD
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 370,
                child: TextFormField(
                  obscureText: _obscureText,
                  controller: passwordController,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Password cannot be empty';
                  //   } else if (value != password) {
                  //     return 'Wrong password';
                  //   }
                  //   return null;
                  // },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.textFormFieldColor,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText
                            ? Icons.remove_red_eye_outlined
                            : Icons.visibility_off_outlined,
                        // ignore: prefer_const_constructors
                        color: Color(0xff827777),
                      ),
                    ),
                    hintText: 'Введите пароль',
                    hintStyle: const TextStyle(
                        color: AppColors.smallTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      });
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text)
                      .then((value) {
                    print('Created New Account');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }).onError((error, stackTrace) {
                    print('Error ${error.toString()}');
                  });
                  Navigator.pop(context);
                  // if (_formKey.currentState!.validate()) {
                  //   _formKey.currentState!.save();
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const GooglePage()));
                  // }

                  // if (_formKey.currentState!.validate()) {
                  //   _formKey.currentState!.save();
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const GooglePage()));
                  // }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.elevatedButtonColor,
                    minimumSize: const Size(
                      370,
                      50,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Text(
                  'Зарегистрироваться',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
            const SizedBox(height: 30),
            // const Text(
            //   'Или войдите через',
            //   style: AppTextStyle.smallTextStyle,
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     InkWell(
            //       onTap: () {
            //         // setState(() {
            //         //   AuthService().signInWithGoogle();
            //         //   Navigator.push(
            //         //       context,
            //         //       MaterialPageRoute(
            //         //           builder: (context) => GooglePage()));
            //         // });
            //       },
            //       child: Image.asset(
            //         'assets/google.png',
            //         scale: 25,
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 40,
            //     ),
            //     InkWell(
            //       onTap: () {
            //         setState(() {
            //           // Navigator.push(
            //           //     context,
            //           //     MaterialPageRoute(
            //           //         builder: (context) => FacebookPage()));
            //         });
            //       },
            //       child: Image.asset(
            //         'assets/facebook.png',
            //         scale: 12,
            //       ),
            //     ),
            //   ],
            // ),
          ])),
    ));
  }
}
