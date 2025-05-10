import 'package:flutter/material.dart';

class SubAIntroductionCallUI extends StatefulWidget {
  const SubAIntroductionCallUI({super.key});

  @override
  State<SubAIntroductionCallUI> createState() => _SubAIntroductionCallUIState();
}

class _SubAIntroductionCallUIState extends State<SubAIntroductionCallUI> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: Image.asset(
                  'assets/images/subA.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text("เมื่อต้องการเดินทางทั้งในเมือง ออกต่างจังหวัด",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              Text("จะใกล้หรือไกลเพียงใด",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              Text("สอบถามข้อมูลการเดินทาง การจราจร",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              Text("ทางด่วน ทางหลัก ทางรอง",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              Text("เส้นทางเลี่ยงการจราจรติดขัด",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              Text("ข้อมูลรถทัวร์ รถไฟ ขสมก. BTS MRT",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "ชักช้าอยู่ใย ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "โทรเลย!!!",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                "สายด่วน",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "การเดินทาง",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
