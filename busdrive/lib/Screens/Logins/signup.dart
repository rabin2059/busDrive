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
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 141.h,
            child: SizedBox(
              height: 495.h,
              width: 320.w,
              child: Image.asset('assets/Group 18.png'),
            ),
          ),
          Positioned(
            top: 337.h,
            right: 15.5.w,
            child: SizedBox(
              height: 314.11.h,
              width: 94.22.w,
              child: Image.asset('assets/Character.png'),
            ),
          ),
          Positioned(
            top: 164.h,
            child: SizedBox(
              height: 449.h,
              width: 244.w,
              child: Column(
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40.h,
                        width: 244.w,
                        child: buildTextFormField('Full Name'),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 40.h,
                        width: 244.w,
                        child: buildTextFormField('Email'),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 40.h,
                        width: 225.w,
                        child: buildTextFormField('Phone Number'),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 40.h,
                        width: 208.w,
                        child: buildTextFormField('Password'),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 40.h,
                        width: 221.w,
                        child: buildTextFormField('Confirm Password'),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      SizedBox(
                        height: 44.69.h,
                        width: 225.w,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF725E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
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
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 666.h,
            child: Text(
              'Or sign in with',
              style: TextStyle(fontSize: 15.sp, color: const Color(0xFFB2B2B2)),
            )),
        Positioned(
            top:711.h,
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
      ),
    );
  }

  TextFormField buildTextFormField(String hint) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      ),
      onChanged: (value) {
        // Handle input change
      },
    );
  }
}
