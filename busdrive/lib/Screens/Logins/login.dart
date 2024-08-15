import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 179.5.h,
          child: SizedBox(
            height: 309.49.h,
            width: 362.w,
            child: Image.asset('assets/Group 12.png')),
        ),
        Positioned(
            top: 144.h,
            child: Row(
              children: [
                Container(
                  height: 62.h,
                  width: 62.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ],
            )),
        Positioned(
            top: 144.h,
            child: Icon(
              CupertinoIcons.person_crop_circle_fill,
              size: 71.h,
            )),
        Positioned(
          top: 212.h,
          child: SizedBox(
            height: 204.h,
            width: 275.w,
            child: Column(
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 14.h),
                buildForm('Email or Phone Number'),
                SizedBox(height: 14.h),
                buildForm('Password'),
                SizedBox(height: 14.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgotten password?',
                    style: TextStyle(
                      color: const Color(0xffF40000),
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 405.5.h,
            child: SizedBox(
              height: 158.92.h,
              width: 224.91.w,
              child: Image.asset('assets/Group 8.png'),
            )),
        Positioned(
          top: 564.5.h,
          child: SizedBox(
            height: 55.h,
            width: 315.w,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF725E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        Positioned(
          top: 622.5.h,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don’t have an account, ',
                style: TextStyle(fontSize: 14.sp),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFFFF725E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: 656.5.h,
            child: Text(
              'Or login with',
              style: TextStyle(fontSize: 15.sp, color: const Color(0xFFB2B2B2)),
            )),
        Positioned(
            top: 697.5.h,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                  ),
                  iconSize: 30.w,
                  onPressed: () {
                    // Handle Facebook login
                  },
                ),
                SizedBox(
                  width: 39.w,
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/google.png',
                    width: 30.w, // Adjust the size according to your needs
                    height: 30.h,
                  ),
                  onPressed: () {
                    // Handle Google sign up
                  },
                ),
              ],
            ))
      ],
    ));
  }

  SizedBox buildForm(String hnt) {
    return SizedBox(
                height: 45.h,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: hnt,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
                  ),
                  onChanged: (value) {
                    // Handle input change
                  },
                ),
              );
  }
}
