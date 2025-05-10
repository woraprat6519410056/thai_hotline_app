import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubBHomeUI extends StatefulWidget {
  const SubBHomeUI({super.key});

  @override
  State<SubBHomeUI> createState() => _SubBHomeUIState();
}

class _SubBHomeUIState extends State<SubBHomeUI> {
  // รายการข้อมูลที่ต้องการแสดง
  final List<Map<String, String>> hotlineList = [
    {"title": "เหตุด่วนเหตุร้าย", "number": "191", "image": "assets/images/B1.jpg"},
    {"title": "แจ้งเหตุไฟไหม้สัตว์เข้าบ้าน", "number": "199", "image": "assets/images/B2.jpg"},
    {"title": "สายด่วนรถหาย(ตำรวจแห่งชาติ)", "number": "1192", "image": "assets/images/B3.jpg"},
    {"title": "อุบัติเหตุทางน้ำ", "number": "1196", "image": "assets/images/B4.jpg"},
    {"title": "แจ้งคนหาย", "number": "1300", "image": "assets/images/B5.jpg"},
    {"title": "ศูนย์ปลอดภัยคมนาคม", "number": "1356", "image": "assets/images/B6.jpg"},
    {"title": "หน่วยแพทย์กู้ชีพ", "number": "1554", "image": "assets/images/B7.jpg"},
    {"title": "ศูนย์เอราวัณ", "number": "1646", "image": "assets/images/B8.jpg"},
    {"title": "เจ็บป่วยฉุกเฉิน", "number": "1669", "image": "assets/images/B9.jpg"},
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
              "อุบัติเหตุ-เหตุฉุกเฉิน",
              style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            SizedBox(
              width: 175,
              height: 175,
              child: Image.asset('assets/images/subB.png', fit: BoxFit.cover),
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
