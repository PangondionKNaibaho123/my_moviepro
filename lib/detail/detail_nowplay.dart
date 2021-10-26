import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_moviepro/utils/text.dart';

class DetailNowPlay extends StatelessWidget{

  final String name, description, bannerurl, posterurl, vote, launchon;

  const DetailNowPlay({Key? key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launchon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(bannerurl, fit: BoxFit.cover,),
                    ),
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
            Container(
              padding: EdgeInsets.only(left: 10),
              child: modifiedText(text: 'Releasing on - '+launchon, color: Colors.black, size: 14),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: modifiedText(text: description, color: Colors.black, size: 15),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }

}