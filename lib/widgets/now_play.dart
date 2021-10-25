import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_moviepro/utils/text.dart';


class NowPlaying extends StatelessWidget{

  final List nowplay;

  const NowPlaying({Key? key, required this.nowplay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedText(text:'Now Playing', size: 26, color: Colors.black,),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Container(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nowplay.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){},
                    child: Container(
                      width: 200,
                      //padding: EdgeInsets.only(left: 5.0),
                      child: Column(
                        children: [
                          Container(
                            height: 290,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://image.tmdb.org/t/p/w500/'+nowplay[index]['poster_path']),
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
                                      nowplay[index]['title'],
                                      style: GoogleFonts.breeSerif(
                                        color: Colors.black, fontSize: 17
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
                                        nowplay[index]['release_date'],
                                        style: GoogleFonts.breeSerif(
                                          color: Colors.grey, fontSize: 14
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