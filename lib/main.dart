import 'package:flutter/material.dart';
import 'package:flutter_travel_app/FadeAnimation.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Nunito'),
    home: HomePage(),
  )
);

class HomePage extends StatefulWidget{
  _HomePageState createState() => _HomePageState();


}
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  PageController _pageController;


  void _onScroll(){
    print('sss');
  }

  @override
  void initState(){
    _pageController = PageController(
      initialPage: 0,
    )..addListener((_onScroll));
    super.initState();
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller:_pageController,
        children: <Widget>[
//          Container(
//              color: Colors.blue,
//          ),
//          Container(
//            color: Colors.red,

//        )
          makePage(
            image:'assets/images/one.jpg',
            title: 'IND',
            description:'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            page: 1
          ),
          makePage(
              image:'assets/images/two.jpg',
              title: 'AUS',
              description:'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              page: 2

          ),
          makePage(
              image:'assets/images/three.jpg',
              title: 'USA',
              description:'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              page: 3

          ),
          makePage(
              image:'assets/images/four.jpg',
              title: 'FRA',
              description:'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              page: 4

          )
        ],
      ),
    );
  }
}

Widget makePage({image,title,description,page}){
  int totalPage=4;
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover
      )
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          stops: [0.3,0.9],
          colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.2),
          ]
        )
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             SizedBox(
               height: 20,
             ),


             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.baseline,
               textBaseline: TextBaseline.alphabetic,
               children:<Widget> [
                 Text(page.toString(),style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                 Text('/'+ totalPage.toString(),style: TextStyle(color: Colors.white,fontSize: 15),)
               ],
             ),
             Expanded(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   FadeAnimation(2,
                     Text(title,style: TextStyle(color: Colors.white,fontSize: 55,fontWeight: FontWeight.bold),),
                   ),


                   SizedBox(
                     height: 20,
                   ),
                   FadeAnimation(3,
                   Row(
                     children:<Widget> [
                      Container(
                        child: Icon(Icons.star,color: Colors.yellow,size: 15,),
                        margin: EdgeInsets.only(right: 3),
                      ),
                       Container(
                         child: Icon(Icons.star,color: Colors.yellow,size: 15,),
                         margin: EdgeInsets.only(right: 3),
                       ),
                       Container(
                         child: Icon(Icons.star,color: Colors.yellow,size: 15,),
                         margin: EdgeInsets.only(right: 3),
                       ),
                       Container(
                         child: Icon(Icons.star,color: Colors.yellow,size: 15,),
                         margin: EdgeInsets.only(right: 5),
                       ),
                       Text('(4.0',style:TextStyle(color: Colors.white70),),
                       Text('/1300)',style:TextStyle(color: Colors.white70,fontSize: 12),
                       ),
                     ],
                   )
                   ),


                   SizedBox(
                     height: 20,
                   ),

                   Padding(
                     padding: const EdgeInsets.only(right: 20),

                       child: FadeAnimation(4,
                       Text(description,style: TextStyle(color: Colors.white.withOpacity(0.7),height: 1.9,fontSize: 15)
                       ),

                       )
                   ),

                   SizedBox(height: 40,),
                   FadeAnimation(5,
                   Text('READ MORE',style: TextStyle(color: Colors.white),)
                   ),
                 ],
               ),
             )
           ],
         ),
      ),
    ),
  );
}