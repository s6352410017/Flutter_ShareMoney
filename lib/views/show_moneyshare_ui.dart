import 'package:flutter/material.dart';

class ShowMoneyShareUi extends StatefulWidget {
  double? money;
  int? person;
  double? tip;
  double? moneyshare;

  ShowMoneyShareUi({
    Key? key,
    this.money,
    this.person,
    this.tip,
    this.moneyshare,
  }) : super(key: key);

  @override
  _ShowMoneyShareUiState createState() => _ShowMoneyShareUiState();
}

class _ShowMoneyShareUiState extends State<ShowMoneyShareUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF98DBEE),
      appBar: AppBar(
        title: Text(
          'ResultMoneyShare',
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF25BCE5),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 100.0,
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                'จำนวนเงินที่จะหาร',
              ),
              SizedBox(
                height: 20.0,
              ),  
              Text(
                widget.money.toString(),
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'บาท',
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                'จำนวนคนที่จะหาร',
              ),
              SizedBox(
                height: 20.0,
              ),  
              Text(
                widget.person.toString(),
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'คน',
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                'จำนวนเงินทิป',
              ),
              SizedBox(
                height: 20.0,
              ),  
              Text(
                widget.tip.toString(),
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'บาท',
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                'สรุปหารกันคนละ',
              ),
              SizedBox(
                height: 20.0,
              ),  
              Container(
                width: MediaQuery.of(context).size.width- 50.0,
                height: 100.0,
                color: Colors.yellow,
                alignment: Alignment.center,
                child: Text(
                  widget.moneyshare.toString(),
                  style: TextStyle(
                    color: Colors.red[900],
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'บาท',
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
