import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_moviepro/utils/text.dart';

class Upcoming extends StatelessWidget{

  final List upcoming;

  const Upcoming({Key? key, required this.upcoming}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedText(text:'Upcoming', size: 26, color: Colors.black,),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: upcoming.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){},
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://image.tmdb.org/t/p/w500/'+upcoming[index]['poster_path']),
                              ),
                            ),
                          ),
                          Container(
                              child: Align(
                                  alignment: Alignment(-0.9,-0.9),
                                  child: Column(
                                    children: [
                                      //modifiedText(text: nowplay[index]['title']!=null?nowplay[index]['title']:'Loading..', size: 17, color: Colors.black,),
                                      Text(
                                        upcoming[index]['title'],
                                        style: GoogleFonts.breeSerif(
                                            color: Colors.black, fontSize: 16
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  )

                              )
                          ),
                          Container(
                              child: Align(
                                  alignment: Alignment(-0.9,-0.9),
                                  child: Column(
                                    children: [
                                      //modifiedText(text: nowplay[index]['title']!=null?nowplay[index]['title']:'Loading..', size: 17, color: Colors.black,),
                                      Text(
                                        upcoming[index]['release_date'],
                                        style: GoogleFonts.breeSerif(
                                            color: Colors.grey, fontSize: 13
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  )

                              )
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

        ],
      ),
    );
  }

}