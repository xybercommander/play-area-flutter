import 'package:flutter/material.dart';
import 'package:flutter_assignment/helper/constants.dart';
import 'package:flutter_assignment/widgets/play_area_widgets.dart';
import 'package:flutter_assignment/widgets/theme_widgets.dart';

class Area extends StatefulWidget {

  final int index;
  final bool theme;
  Area({this.index, this.theme});

  @override
  _AreaState createState() => _AreaState();
}

class _AreaState extends State<Area> {

  bool findDay(List<String> days, String day) {    
    return days.contains(day);
  }


  String img = '';
  void setImg() {
    if(Constants.sports[widget.index]['name'] == 'Basketball') {
      setState(() {
        img = Constants.imgBasketBall;
      });
    } else if(Constants.sports[widget.index]['name'] == 'Badminton') {
      setState(() {
        img = Constants.imgBadminton;
      });
    } else {
      setState(() {
        img = Constants.imgFootball;
      });
    }
  }


  @override
  void initState() {  
    setImg();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: themeColorBg(widget.theme),

      appBar: AppBar(
        title: Text("Area Page", style: TextStyle(color: themeColorText(widget.theme)),),
        centerTitle: true,
        backgroundColor: themeColorBg(widget.theme),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left_outlined),
          color: themeColorText(widget.theme),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Center(
        child: Column(          
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              height: 300,
              width: double.infinity,        
              child: Card(
                color: themeColorCard(widget.theme),
                elevation: 10,                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Play Area",
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                      Text(
                        '${Constants.playAreaName[widget.index]}',
                        style: TextStyle(
                          fontSize: 20,
                          color: themeColorText(widget.theme)
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        width: double.infinity - 16,
                        height: 0.3,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          smallColumnTextWidget("Open Time", Constants.openTime[widget.index], widget.theme),
                          smallColumnTextWidget("Close Time", Constants.closeTime[widget.index], widget.theme),
                          SizedBox()
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        width: double.infinity - 16,
                        height: 0.3,
                        color: Colors.grey,
                      ),
                      Text(
                        "Days Open",
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                      SizedBox(height: 8),
                      weekDays(),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        width: double.infinity - 16,
                        height: 0.3,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          smallColumnTextWidget("Cost Per Slot", '₹'+Constants.costPerSlot[widget.index].toString(), widget.theme),
                          smallColumnTextWidget("Slot Time Size", Constants.slotTimeSize[widget.index].toString()+'mins', widget.theme),
                          SizedBox()
                        ],
                      ),
                    ],
                  ),
                )
              ),
            ),
            Container(              
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 14),              
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                elevation: 10,
                child: ClipRRect(                
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network('$img')
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton.extended(        
          label: Row(
            children: [
              Icon(Icons.add, color: themeColorText(widget.theme),),
              SizedBox(width: 10,),
              Text("Book Slots", style: TextStyle(fontSize: 16, color: themeColorText(widget.theme)),)
            ],
          ),
          onPressed: () {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('Slot Booking Button Pressed')));
          },
          elevation: 10,
          backgroundColor: widget.theme ? Colors.blueGrey[800] : Colors.blueGrey[100],
        ),
      ),
    );
  }

  

  Widget weekDays() {
   return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        dayContainer('M', findDay(Constants.daysOpen[widget.index], "Mon")),
        dayContainer('T', findDay(Constants.daysOpen[widget.index], "Tue")),
        dayContainer('W', findDay(Constants.daysOpen[widget.index], "Wed")),
        dayContainer('T', findDay(Constants.daysOpen[widget.index], "Thu")),
        dayContainer('F', findDay(Constants.daysOpen[widget.index], "Fri")),
        dayContainer('S', findDay(Constants.daysOpen[widget.index], "Sat")),
        dayContainer('S', findDay(Constants.daysOpen[widget.index], "Sun")),
      ],
    );
  }
  
}