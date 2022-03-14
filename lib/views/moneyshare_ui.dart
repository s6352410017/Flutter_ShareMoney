import 'package:flutter/material.dart';
import 'package:flutter_app_moneyshare_sau/views/show_moneyshare_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoneyShareUi extends StatefulWidget {
  const MoneyShareUi({Key? key}) : super(key: key);

  @override
  _MoneyShareUiState createState() => _MoneyShareUiState();
}

class _MoneyShareUiState extends State<MoneyShareUi> {
  bool? check_tip = false;

  TextEditingController money_ctrl = TextEditingController();
  TextEditingController person_crtl = TextEditingController();
  TextEditingController tip_ctrl = TextEditingController();

  showWarningDialog(context, msg) {
//เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF98DBEE),
      appBar: AppBar(
        title: Text(
          'MoneyShare',
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF25BCE5),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 200.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 28.0,
                ),
                child: TextField(
                  controller: money_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '    ป้อนจำนวนเงิน   (บาท)',
                    hintStyle: TextStyle(
                      color: Color(0xFFECF4F6),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyBillWave,
                      color: Color(0xFF2DBF48),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF37A7BB),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF37A7BB),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 20.0,
                ),
                child: TextField(
                  controller: person_crtl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '    ป้อนจำนวนคน   (คน)',
                    hintStyle: TextStyle(
                      color: Color(0xFFECF4F6),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF99A3A4),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF37A7BB),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF37A7BB),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (checked) {
                      setState(() {
                        check_tip = checked;
                      });
                    },
                    value: check_tip,
                    activeColor: Color(0xFF1EA8C3),
                    side: BorderSide(
                      color: Color(0xFF1EA8C3),
                    ),
                  ),
                  Text('  ทิบให้พนักงานเสริฟ  '),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 15.0,
                ),
                child: TextField(
                  controller: tip_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '    ป้อนจำนวนเงินทิบ   (บาท)',
                    hintStyle: TextStyle(
                      color: Color(0xFFECF4F6),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.coins,
                      color: Color(0xFFD1B43C),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF37A7BB),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF37A7BB),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () {
                  double moneyshare = 0;

                  if (money_ctrl.text.length == 0) {
                    showWarningDialog(context, 'ป้อนเงินด้วย...');
                    return;
                  } else if (person_crtl.text.length == 0) {
                    showWarningDialog(context, 'ป้อนจำนวนคนด้วย...');
                    return;
                  } else if (check_tip == false) {
                    double? money = double.parse(money_ctrl.text);
                    int? person = int.parse(person_crtl.text);
                    moneyshare = money / person;
                  } else {
                    if (tip_ctrl.text.isEmpty) {
                      showWarningDialog(context, 'ป้อนทิปด้วย...');
                      return;
                    } else {
                      double? money = double.parse(money_ctrl.text);
                      int? person = int.parse(person_crtl.text);
                      double? tip = double.parse(tip_ctrl.text);
                      moneyshare = (money + tip) / person;
                    }
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowMoneyShareUi(
                        money: double.parse(money_ctrl.text),
                        person: int.parse(person_crtl.text),
                        tip: double.parse(tip_ctrl.text.isEmpty ? '0' : tip_ctrl.text),
                        moneyshare: moneyshare,
                      ),
                    ),
                  );
                },
                child: Text('คำนวณ'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0,
                    50.0,
                  ),
                  primary: Color(0xFF29C1E6),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    money_ctrl.text = '';
                    person_crtl.text = '';
                    tip_ctrl.text = '';
                    check_tip = false;
                  });
                },
                icon: Icon(
                  FontAwesomeIcons.sync,
                ),
                label: Text(
                  'ยกเลิก',
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0,
                    50.0,
                  ),
                  primary: Color(0xFFC61714),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'Created by Natthawat SAU',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
