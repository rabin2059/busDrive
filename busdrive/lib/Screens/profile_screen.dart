import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 77.h,
            left: 168.w,
            right: 168.w,
            child: Text(
              "Profile",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            top: 146.h,
            left: 140.w,
            right: 140.w,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 110.h,
                  width: 110.h,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/user.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF725E),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 1.w,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 19,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 271.h,
              child: Container(
                height: 70.h,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Rabin Rai',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w700)),
                      ),
                      Text('rai2059rabin@gmail.com',
                          style: TextStyle(
                            fontSize: 15.sp,
                          )),
                    ],
                  ),
                ),
              )),
          Positioned(
            bottom: 0,
            right: 17.w,
            left: 17.w,
            child: Container(
              height: 455.h,
              width: 360.w,
              decoration: const BoxDecoration(
                color: Color(0xFFFF725E),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
