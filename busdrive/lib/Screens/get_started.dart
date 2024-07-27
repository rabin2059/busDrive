import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          const Size(393, 852), // Using the design size for iPhone 15 Pro
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 10.h,
                  left: 0.w,
                  child: SizedBox(
                    height: 319.h,
                    width: 360.w,
                    child: Image.asset(
                      'assets/bustop.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 140.h,
                  right: 0.w,
                  child: SizedBox(
                    height: 381.75.h,
                    width: 360.w,
                    child: Image.asset(
                      'assets/bus.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 548,
                  child: SizedBox(
                    width: 393.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Find the exact ride for \n your destination',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5.h,),
                        Text(
                          "The location of the bus you want at \n your pocket",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0x82828282)),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 27.h,
                        ),
                        Container(
                          width: 329.w,
                          height: 55.h,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF725E),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            'Get Started',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                            textAlign: TextAlign.center,
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
