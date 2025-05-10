import 'package:flutter/material.dart';
import 'package:thai_hotline_app/views/sub_a_intriduction_call_ui.dart';
import 'package:thai_hotline_app/views/sub_b_intriduction_call_ui.dart';
import 'package:thai_hotline_app/views/sub_c_intriduction_call_ui.dart';
import 'package:thai_hotline_app/views/sub_d_intriduction_call_ui.dart';
import 'package:thai_hotline_app/views/home_ui.dart'; // นำเข้า HomeUI()

class IntroductionCallUI extends StatefulWidget {
  @override
  _IntroductionCallUIState createState() => _IntroductionCallUIState();
}

class _IntroductionCallUIState extends State<IntroductionCallUI> {
  final List<Widget> pages = [
    SubAIntroductionCallUI(), // หน้า 1
    SubBIntroductionCallUI(), // หน้า 2
    SubCIntroductionCallUI(), // หน้า 3
    SubDIntroductionCallUI(), // หน้า 4
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ปุ่ม "ข้าม" (ซ้ายสุด) สำหรับหน้าที่ 1-3
              if (currentPage < 3)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentPage = 3; // ข้ามไปหน้า 4
                    });
                  },
                  child: Text(
                    "ข้าม",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                )
              else
                // ปุ่ม "ข้าม" สีขาวและไม่สามารถกดได้ในหน้า 4
                Text(
                  "ข้าม",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),

              // จุด 4 จุด (ตรงกลาง) สำหรับหน้า 1-3
              if (currentPage != 3)
                Row(
                  children: List.generate(4, (index) {
                    return Icon(
                      Icons.circle,
                      size: 10,
                      color: currentPage == index ? Colors.blue : Colors.grey,
                    );
                  }),
                )
              else
                // ถ้าเป็นหน้าที่ 4 ให้จุดอยู่ชิดขวา
                Row(
                  mainAxisAlignment: MainAxisAlignment.end, // จุดชิดขวา
                  children: List.generate(4, (index) {
                    return Icon(
                      Icons.circle,
                      size: 10,
                      color: currentPage == index ? Colors.blue : Colors.grey,
                    );
                  }),
                ),

              // ปุ่ม "โทรเลย" หรือ ลูกศร (ขวาสุด)
              GestureDetector(
                onTap: () {
                  if (currentPage == 3) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeUI()), // ไปที่หน้า HomeUI
                    );
                  } else {
                    setState(() {
                      currentPage++; // ไปยังหน้าถัดไป
                    });
                  }
                },
                child: currentPage == 3
                    ? Text(
                        "โทรเลย",
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      )
                    : Icon(
                        Icons.arrow_forward, // ลูกศร
                        color: Colors.blue,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
