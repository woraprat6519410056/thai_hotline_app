import 'package:flutter/material.dart';

class SubCIntroductionCallUI extends StatefulWidget {
  const SubCIntroductionCallUI({super.key});

  @override
  State<SubCIntroductionCallUI> createState() => _SubCIntroductionCallUIState();
}

class _SubCIntroductionCallUIState extends State<SubCIntroductionCallUI> {
  
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
                  'assets/images/subC.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text("เมื่อเงินคือสิ่งสำคัญสำหรับการดำเนินชีวิต",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  )),
              Text("กิน เที่ยว ซื้อสินค้า",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  )),
              Text("การเดินทาง การรักษาพยาบาล",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  )),
              Text("หรือโดนเหตุมิจฉาชีพ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  )),
              Text("แก๊งคอลเซ็นเตอร์หลอกลวง",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  )),
              Text("สามารถติดต่อธนาคารโดยตรง",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  )),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "ได้เลย ",
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
                "ธนาคาร",
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
