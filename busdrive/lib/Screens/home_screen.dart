import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.h,
            child: SizedBox(
              height: 443.h,
              width: 393.w,
              child: Image.asset('assets/map.png'),
            ),
          ),
          Positioned(
            top: 47.h,
            left: 39.w,
            child: Container(
              height: 40.h,
              width: 315.w,
              decoration: BoxDecoration(
                color: const Color(0xB3F9F9F9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trevo",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.bell_fill,
                          color: Color(0xFFFF725E),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.h,
            child: Container(
              height: 467.h,
              width: 393.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 20.h, left: 39.w, right: 39.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        'Search For Your',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 32.sp, fontWeight: FontWeight.w600)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        'Route',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 36.sp,
                                fontWeight: FontWeight.w900,
                                color: const Color(0xFFFF725E))),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 159.h,
                      width: 315.w,
                      decoration: BoxDecoration(
                          color: const Color(0xDBDBDBEC),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 13.h, left: 8.w),
                              child: Column(
                                children: [
                                  Image.asset('assets/location.png'),
                                  Image.asset('assets/-----.png'),
                                  Icon(
                                    Icons.location_on,
                                    color: const Color(0xFFFF725E),
                                    size: 28.h,
                                  )
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 216.w,
                                  height: 48.h,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: 'Your Location',
                                      hintStyle: const TextStyle(
                                          color: Color(0xFFFF725E)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 14.h,
                                ),
                                SizedBox(
                                  width: 216.w,
                                  height: 48.h,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: 'Destination',
                                      hintStyle: const TextStyle(
                                          color: Color(0xFFFF725E)),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 329.w,
                        height: 55.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF725E),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            Text(
                              'Search',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
