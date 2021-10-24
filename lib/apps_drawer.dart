import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppsDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Wrap(
            children: <Widget>[
              createDrawerHeader(),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.home, color: Colors.grey,),
                    Padding(
                      padding: EdgeInsets.only(left: 70.0),
                      child: Text(
                        "Home", style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    )
                  ],
                ),
                onTap: (){},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.play_circle_outline, color: Colors.grey,),
                    Padding(
                      padding: EdgeInsets.only(left: 70.0),
                      child: Text(
                        "Now Playing", style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    )
                  ],
                ),
                onTap: (){},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.show_chart, color: Colors.grey,),
                    Padding(
                      padding: EdgeInsets.only(left: 70.0),
                      child: Text(
                        "Top Rated", style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    )
                  ],
                ),
                onTap: (){},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.live_tv, color: Colors.grey,),
                    Padding(
                      padding: EdgeInsets.only(left: 70.0),
                      child: Text(
                        "Upcoming", style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    )
                  ],
                ),
                onTap: (){},
              ),
              Divider(
                thickness: 2,
                indent: 0,
                endIndent: 0,
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.help_outline_rounded, color: Colors.grey,),
                    Padding(
                      padding: EdgeInsets.only(left: 70.0),
                      child: Text(
                        "About", style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    )
                  ],
                ),
                onTap: (){},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget createDrawerHeader(){
    return DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("images_source/abstract_blue.jpg")
        )
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 20.0,
            left: 9.0,
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("images_source/circular_home.jpeg"),
                  ),
                ),
                Text(
                  "Movie Pro",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )
              ],
            )
          )
        ],
      ),
    );
  }

}