import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login.dart'; // Import the LoginScreen

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h),
                buildTextFormField('Full Name'),
                SizedBox(height: 10.h),
                buildTextFormField('Email'),
                SizedBox(height: 10.h),
                buildTextFormField('Phone Number'),
                SizedBox(height: 10.h),
                buildTextFormField('Password', obscureText: true),
                SizedBox(height: 10.h),
                buildTextFormField('Confirm Password', obscureText: true),
                SizedBox(height: 40.h),
                SizedBox(
                  width: 315.w,
                  height: 55.h,
                  child: ElevatedButton(
                    onPressed: () {
                      // Sign up button pressed
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF725E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Or sign up with',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/google.png',
                        width: 40.w, // Adjust the size according to your needs
                        height: 40.h,
                      ),
                      onPressed: () {
                        // Handle Google sign up
                      },
                    ),
                    SizedBox(width: 20.w),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.facebook, color: Colors.blue,),
                      iconSize: 40.w,
                      onPressed: () {
                        // Handle Facebook login
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFFFF725E),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(String labelText, {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5.h),
        Container(
          height: 50.h,
          width: 315.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFD9D9D9),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              obscureText: obscureText,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}