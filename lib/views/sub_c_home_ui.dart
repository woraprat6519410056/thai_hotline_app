import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubCHomeUI extends StatefulWidget {
  const SubCHomeUI({super.key});

  @override
  State<SubCHomeUI> createState() => _SubCHomeUIState();
}

class _SubCHomeUIState extends State<SubCHomeUI> {
  // รายการข้อมูลที่ต้องการแสดง
  final List<Map<String, String>> hotlineList = [
    {
      "title": "ธนาคารกรุงเทพ",
      "number": "1333",
      "image": "assets/images/C1.jpg"
    },
    {
      "title": "ธนาคารออมสิน",
      "number": "1115",
      "image": "assets/images/C2.jpg"
    },
    {
      "title": "ธนาคารกสิกรไทย",
      "number": "02 888 8888",
      "image": "assets/images/C3.jpg"
    },
    {
      "title": "ธนาคารกรุงไทย",
      "number": "02 111 1111",
      "image": "assets/images/C4.jpg"
    },
    {
      "title": "ธนาคารกรุงศรี",
      "number": "1572",
      "image": "assets/images/C5.jpg"
    },
    {
      "title": "ธนาคารทีเอ็มบีธนชาต",
      "number": "1428",
      "image": "assets/images/C6.jpg"
    },
    {
      "title": "ธนาคารซิตี้แบงก์",
      "number": "1588",
      "image": "assets/images/C7.jpg"
    },
    {
      "title": "ธนาคารแลนด์ แอนด์ เฮ้าส์",
      "number": "1327",
      "image": "assets/images/C8.jpg"
    },
    {
      "title": "ธนาคารอาคารสงเคราะห์",
      "number": "02 645 9000",
      "image": "assets/images/C9.jpg"
    },
    {
      "title": "ธนาคารไทยพาณิชย์",
      "number": "02 777 7777",
      "image": "assets/images/C10.jpg"
    },
    {
      "title": "ธนาคารเกียรตินาคิน",
      "number": "02 165 5555",
      "image": "assets/images/C11.jpg"
    },
    {
      "title": "ธนาคารไทยเครดิต",
      "number": "02 697 5454",
      "image": "assets/images/C12.jpg"
    },
    {
      "title": "ธนาคารยูโอบี",
      "number": "02 285 1555",
      "image": "assets/images/C13.jpg"
    },
    {
      "title": "ธนาคารทิสโก้",
      "number": "02 633 6000",
      "image": "assets/images/C14.png"
    },
    {
      "title": "ธนาคารอิสลามแห่งประเทศไทย",
      "number": "02 204 2766",
      "image": "assets/images/C15.jpg"
    },
    {
      "title": "ธนาคาร ซีไอเอ็มบี ไทย",
      "number": "02 626 7777",
      "image": "assets/images/C16.jpg"
    },
  ];

  // ฟังก์ชันโทรออก
  void _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        throw 'ไม่สามารถโทรไปที่ $phoneNumber ได้';
      }
    } catch (e) {
      // แสดงข้อความแสดงข้อผิดพลาดถ้าไม่สามารถโทรได้
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ไม่สามารถโทรได้: $e')),
      );
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
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "ธนาคาร",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            SizedBox(
              width: 175,
              height: 175,
              child: Image.asset('assets/images/subC.png', fit: BoxFit.cover),
            ),
            SizedBox(height: 20), // ระยะห่างระหว่างรูปกับรายการ
            Expanded(
              child: ListView.builder(
                itemCount: hotlineList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Image.asset(
                        hotlineList[index]["image"]!,
                        width: 40,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.image),
                      ),
                      title: Text(hotlineList[index]["title"]!),
                      subtitle: Text(hotlineList[index]["number"]!),
                      trailing: Icon(Icons.phone, color: Colors.green),
                      onTap: () =>
                          _makePhoneCall(hotlineList[index]["number"]!),
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
