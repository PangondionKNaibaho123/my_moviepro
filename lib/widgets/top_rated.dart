import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_moviepro/utils/text.dart';

class TopRated extends StatelessWidget{

  final List toprated;

  const TopRated({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedText(text:'Top Rated', size: 26, color: Colors.black,),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Container(
              height: 290,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toprated.length,
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
                                image: NetworkImage('https://image.tmdb.org/t/p/w500/'+toprated[index]['poster_path']),
                              ),
                            ),
                          ),
                          Container(
                              child: modifiedText(text: toprated[index]['title']!=null?toprated[index]['title']:'Loading..', size: 17, color: Colors.black,)
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