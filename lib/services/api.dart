import 'dart:convert';
import 'package:flutter_assignment/helper/constants.dart';
import 'package:http/http.dart';

class PlayArea {

  // String image1 = '';
  // String image2 = '';
  // String image3 = '';

  Future<void> callData() async {
    try {

      Response response = await get("http://playonnuat-env.eba-ernpdw3w.ap-south-1.elasticbeanstalk.com/api/v1/establishment/test/list?offset=0&limit=10");
      List data = jsonDecode(response.body);      
      Constants.datalen = data.length;
      print(Constants.datalen);
            
      Constants.imgFootball = data[0]['images'][0];
      Constants.imgBasketBall = data[0]['images'][1];
      Constants.imgBadminton = data[0]['images'][2];

      for(int i = 0; i < Constants.datalen; i++) {        
        Constants.playAreaName.add(data[i]['name']);
        

        Constants.sports.add(data[i]['sports']);

        Constants.openTime.add(data[i]['openTime']);
        Constants.closeTime.add(data[i]['closeTime']);

        Constants.daysOpen.add(data[i]['dayOfWeeksOpen'].cast<String>());
        // print("data $i = ${data[i]['dayOfWeeksOpen']}");

        
        Constants.costPerSlot.add(data[i]['costPerSlot']);
        Constants.slotTimeSize.add(data[i]['slotTimeSize']);        

        
        
      }
      // print(Constants.images);

    } catch(e) {
      print(e.toString());
    }
  }

}