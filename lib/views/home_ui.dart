import 'package:flutter/material.dart';
import 'package:thai_hotline_app/views/about_ui.dart';
import 'package:thai_hotline_app/views/sub_a_home_ui.dart';
import 'package:thai_hotline_app/views/sub_b_home_ui.dart';
import 'package:thai_hotline_app/views/sub_c_home_ui.dart';
import 'package:thai_hotline_app/views/sub_d_home_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _selectedIndex = 0; // เก็บ index ของ tab ที่เลือก

  // **กำหนดหน้าที่จะสลับไป**
  final List<Widget> _pages = [
    SubAHomeUI(), // หน้า "การเดินทาง"
    SubBHomeUI(), // หน้า "อุบัติเหตุ-เหตุฉุกเฉิน"
    SubCHomeUI(), // หน้า "ธนาคาร"
    SubDHomeUI(), // หน้า "สาธารณูปโภค"
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // อัปเดตหน้าเมื่อกด
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Row(
          children: [
            Spacer(),
            Spacer(),
            Text(
              "สายด่วน THAILAND",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.info,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUI(),
                  ),
                );
              },
            ),
          ],
        ),
        centerTitle: false,
      ),

      body: IndexedStack(
        index: _selectedIndex, // เปลี่ยนหน้าโดยใช้ index
        children: _pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // กดแล้วเปลี่ยน index
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_car), label: 'การเดินทาง'),
          BottomNavigationBarItem(
              icon: Icon(Icons.warning), label: 'อุบัติเหตุ-เหตุฉุกเฉิน'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: 'ธนาคาร'),
          BottomNavigationBarItem(
              icon: Icon(Icons.public), label: 'สาธารณูปโภค'),
        ],
      ),
    );
  }
}
