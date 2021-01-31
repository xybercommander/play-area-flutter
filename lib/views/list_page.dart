import 'package:flutter/material.dart';
import 'package:flutter_assignment/helper/constants.dart';
import 'package:flutter_assignment/widgets/theme_widgets.dart';
import 'package:flutter_assignment/views/play_area.dart';
import 'package:page_transition/page_transition.dart';

class ListPage extends StatefulWidget {

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {    
  bool theme = false;  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Play Areas", style: TextStyle(          
          color: themeColorText(theme)
        ),),
        centerTitle: true,
        backgroundColor: themeColorBg(theme),
        elevation: 0,
        actions: [
          Icon(theme ? Icons.wb_sunny_outlined : Icons.wb_sunny, color: themeColorText(theme),),
          Switch(value: theme, onChanged: (_) {
            setState(() {
              theme = !theme;
            });
          })
        ],
      ),

      body: Container(
        color: themeColorBg(theme),
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: double.infinity,        
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: Constants.datalen,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.push(context, PageTransition(
                child: Area(index: index, theme: theme,),
                type: PageTransitionType.rightToLeftWithFade,
                duration: Duration(milliseconds: 200)
              )),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),                
                child: Card(
                  color: themeColorCard(theme),
                  margin: EdgeInsets.symmetric(vertical: 10),                              
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(                    
                    height: 70,                  
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${Constants.sports[index]['name']}',
                              style: TextStyle(
                                color: themeColorText(theme),
                                fontSize: 22
                              ),
                            ),
                            Text(
                              '${Constants.playAreaName[index]}',
                              style: TextStyle(
                                color: themeColorSmallText(theme),
                                fontSize: 12
                              ),
                            ),
                          ],
                        ),
                        Image.network(
                          theme ? 
                            '${Constants.sports[index]["iconWhiteUrl"]}' : 
                            '${Constants.sports[index]["iconBlackUrl"]}',
                          height: 50,
                          width: 50,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}