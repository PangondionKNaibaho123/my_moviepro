import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_moviepro/utils/text.dart';

class DetailTopRated extends StatelessWidget{

  final String name, description, bannerurl, posterurl, vote, launchon, apikey_e2, apireadacesstoken_e2;
  final List genre;

  const DetailTopRated({Key? key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launchon, required this.apikey_e2, required this.apireadacesstoken_e2, required this.genre}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(bannerurl, fit: BoxFit.cover),
                      ),
                      SafeArea(
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    child: modifiedText(text: ' ⭐ Average Rating - '+vote, color: Colors.white, size: 20),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: modifiedText(text: name!=null?name:'Loading...', color: Colors.black, size: 24),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 240,
                  width: 180,
                  child: Image.network(posterurl),
                ),
                Container(
                  height: 250,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
                        child: Text(
                          "General Info",
                          style: GoogleFonts.breeSerif(color: Colors.black, fontSize: 22, decoration: TextDecoration.underline),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.date_range,color: Colors.black,size: 30,),
                          Padding(
                            padding: EdgeInsets.only(left: 40),
                            child: modifiedText(text: launchon, color: Colors.black, size: 17),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Synopsis",
                style: GoogleFonts.breeSerif(color: Colors.black, fontSize: 24, decoration: TextDecoration.underline),
              ),
            ),
            Container(
              child: Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: modifiedText(text: description, color: Colors.black, size: 15),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 30, left: 10),
                child: modifiedText(text: changeString(name), color: Colors.black, size: 15)
            )
          ],
        ),
      ),
    );
  }

  String changeString (String input){

    String result_e1 = input.replaceAll(RegExp('[^a-zA-Z0-9]'), '-');
    String result_e2 = result_e1.replaceAll('--','-').toLowerCase();

    return result_e2;
  }

}