import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubDHomeUI extends StatefulWidget {
  const SubDHomeUI({super.key});

  @override
  State<SubDHomeUI> createState() => _SubDHomeUIState();
}

class _SubDHomeUIState extends State<SubDHomeUI> {
  // รายการข้อมูลที่ต้องการแสดง
  final List<Map<String, String>> hotlineList = [
    {"title": "ไฟฟ้านครหลวง", "number": "191", "image": "assets/images/D1.jpg"},
    {"title": "ไฟฟ้าส่วนภูมิภาค", "number": "199", "image": "assets/images/D2.jpg"},
    {"title": "ไฟฟ้าฝ่ายผลิต", "number": "1192", "image": "assets/images/D3.png"},
    {"title": "การประปานครหลวง", "number": "1196", "image": "assets/images/D4.jpg"},
    {"title": "การประปาส่วนภูมิภาค", "number": "1300", "image": "assets/images/D5.jpg"},
    {"title": "บริษัท True", "number": "1356", "image": "assets/images/D6.jpg"},
    {"title": "บริษัท dtac", "number": "1554", "image": "assets/images/D7.jpg"},
    {"title": "บริษัท AIS", "number": "1646", "image": "assets/images/D8.jpg"},
    {"title": "บริษัท TOT", "number": "1669", "image": "assets/images/D9.jpg"},
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
              "สาธารณูปโภค",
              style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            SizedBox(
              width: 175,
              height: 175,
              child: Image.asset('assets/images/subD.png', fit: BoxFit.cover),
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
