import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubAHomeUI extends StatefulWidget {
  const SubAHomeUI({super.key});

  @override
  State<SubAHomeUI> createState() => _SubAHomeUIState();
}

class _SubAHomeUIState extends State<SubAHomeUI> {
  // รายการข้อมูลที่ต้องการแสดง
  final List<Map<String, String>> hotlineList = [
    {"title": "กรมทางหลวงชนบท", "number": "1146", "image": "assets/images/A1.jpg"},
    {"title": "ตำรวจท่องเที่ยว", "number": "1155", "image": "assets/images/A2.png"},
    {"title": "ตำรวจทางหลวง", "number": "1193", "image": "assets/images/A3.jpg"},
    {"title": "ข้อมูลจราจร", "number": "1197", "image": "assets/images/A4.jpg"},
    {"title": "ขสมก.", "number": "1348", "image": "assets/images/A5.jpg"},
    {"title": "บขส.", "number": "1490", "image": "assets/images/A6.jpg"},
    {"title": "เส้นทางบนทางด่วน", "number": "1543", "image": "assets/images/A7.png"},
    {"title": "กรมทางหลวง", "number": "1586", "image": "assets/images/A8.jpg"},
    {"title": "การรถไฟแห่งประเทศไทย", "number": "1690", "image": "assets/images/A9.jpg"},
  ];

  // ฟังก์ชันโทรออก
  void _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'ไม่สามารถโทรไปที่ $phoneNumber ได้';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              "สายด่วน",
              style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              "การเดินทาง",
              style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            SizedBox(
              width: 175,
              height: 175,
              child: Image.asset('assets/images/subA.png', fit: BoxFit.cover),
            ),
            SizedBox(height: 20), // ระยะห่างระหว่างรูปกับรายการ
            Expanded(
              child: ListView.builder(
                itemCount: hotlineList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Image.asset(
                        hotlineList[index]["image"]!,
                        width: 40,
                        errorBuilder: (context, error, stackTrace) => Icon(Icons.image),
                      ),
                      title: Text(hotlineList[index]["title"]!),
                      subtitle: Text(hotlineList[index]["number"]!),
                      trailing: Icon(Icons.phone, color: Colors.green),
                      onTap: () => _makePhoneCall(hotlineList[index]["number"]!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
