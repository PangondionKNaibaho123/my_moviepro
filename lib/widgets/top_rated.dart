import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_moviepro/detail/detail_toprated.dart';
import 'package:my_moviepro/utils/text.dart';

class TopRated extends StatelessWidget{

  final List toprated;
  final String apikey_e1, apireadaccesstoken_e1;

  const TopRated({Key? key, required this.toprated, required this.apikey_e1, required this.apireadaccesstoken_e1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              modifiedText(text:'Top Rated', color: Colors.black, size: 26),
              Padding(
                  padding: EdgeInsets.only(left: 215.0),
                  child: InkWell(
                    onTap: (){},
                    child: Text(
                      'MORE',
                      style: GoogleFonts.breeSerif(color: Colors.grey, fontSize: 16),
                    ),
                  )
              ),

            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toprated.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailTopRated(name: toprated[index]['title'], description: toprated[index]['overview'], bannerurl: 'https://image.tmdb.org/t/p/w500/'+toprated[index]['backdrop_path'], posterurl: 'https://image.tmdb.org/t/p/w500/'+toprated[index]['poster_path'], vote: toprated[index]['vote_average'].toString(), launchon: toprated[index]['release_date'], apikey_e2: apikey_e1, apireadacesstoken_e2: apireadaccesstoken_e1, genre: toprated[index]['genre_ids'])));
                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://image.tmdb.org/t/p/w500/'+toprated[index]['poster_path']),
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
                                        toprated[index]['title'],
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
                                        toprated[index]['release_date'],
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