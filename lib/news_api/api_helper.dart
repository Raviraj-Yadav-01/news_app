
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {


  void getEveryThing() {

     String url = "https://newsapi.org/v2/top-headlines/sources?apiKey=010d2329efdb4769a7840d2f953ad535";
     var res = http.get(Uri.parse(url));

     var everyThing = jsonDecode(res.body);

     if(res.statusCode == 200){
       
     }



  }
}
