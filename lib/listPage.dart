import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'imagePage.dart';
import 'services/datamgmt.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  QuerySnapshot mahesh;
  DataManagement mahes = new DataManagement();
  @override
  void initState(){
    mahes.getMahesh().then((result){
      setState(() {
        mahesh = result;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(mahesh != null){
      return SingleChildScrollView(
      child: Wrap(
          children: <Widget>[
            for (var i=0; i<mahesh.documents.length;i++)
            getDesignCard(mahesh.documents[i].data["image"], mahesh.documents[i].data["price"]),
          ],
        )
    );
    }
    else{
      return Text("Loading..");
    }
    
  }

  Widget getDesignCard(String imgPath, String price ){

        return Padding(
          padding: EdgeInsets.only(left: 10.0,right: 10.0, top: 10.0, bottom: 10.0),
          child: InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute( builder: (context) => ImagePage(herotag: imgPath)));
      },
          child: Container(
            height: 230.0,
            width: (MediaQuery.of(context).size.width/2)-20.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 2.0,
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1.5,
            )
          ]
        ),

        child: Column(
          children: <Widget>[
                Hero(
                  tag: imgPath,
                  child: Container(
                    height: 175.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
                      image: DecorationImage(
                        image: NetworkImage(imgPath),
                        fit: BoxFit.cover,

                      )
                    ),
                  ),
                ),
      


            SizedBox(height: 10.0,),


            
             Text(price,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
            ),

          ],
        ),
    ),
    ),
  );

}


}

class ListPage2 extends StatefulWidget {
  @override
  _ListPage2State createState() => _ListPage2State();
}

class _ListPage2State extends State<ListPage2> {
  QuerySnapshot _allu;
  DataManagement allu = new DataManagement();
  @override
  void initState(){
    allu.getAllu().then((result){
      setState(() {
        _allu = result;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(_allu != null){
      return SingleChildScrollView(
      child: Wrap(
          children: <Widget>[
            for (var i=0; i<_allu.documents.length;i++)
            getDesignCard(_allu.documents[i].data["image"], _allu.documents[i].data["price"]),
          ],
        )
    );
    }
    else{
      return Text("Loading..");
    }
  }
  Widget getDesignCard(String imgPath, String price ){

        return Padding(
          padding: EdgeInsets.only(left: 10.0,right: 10.0, top: 10.0, bottom: 10.0),
          child: InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute( builder: (context) => ImagePage(herotag: imgPath)));
      },
          child: Container(
            height: 230.0,
            width: (MediaQuery.of(context).size.width/2)-20.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 2.0,
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1.5,
            )
          ]
        ),

        child: Column(
          children: <Widget>[
                Hero(
                  tag: imgPath,
                  child: Container(
                    height: 175.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
                      image: DecorationImage(
                        image: NetworkImage(imgPath),
                        fit: BoxFit.cover,

                      )
                    ),
                  ),
                ),
      


            SizedBox(height: 10.0,),


            
             Text(price,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
            ),

          ],
        ),
    ),
    ),
  );

}
}


class ListOage3 extends StatefulWidget {
  @override
  _ListOage3State createState() => _ListOage3State();
}

class _ListOage3State extends State<ListOage3> {
  QuerySnapshot _prabhas;
  DataManagement prabhas = new DataManagement();
  @override
  void initState(){
    prabhas.getPrabhas().then((result){
      setState(() {
        _prabhas = result;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(_prabhas != null){
      return SingleChildScrollView(
      child: Wrap(
          children: <Widget>[
            for (var i=0; i<_prabhas.documents.length;i++)
            getDesignCard(_prabhas.documents[i].data["image"], _prabhas.documents[i].data["price"]),
          ],
        )
    );
    }
    else{
      return Text("Loading..");
    }
  }
  Widget getDesignCard(String imgPath, String price ){

        return Padding(
          padding: EdgeInsets.only(left: 10.0,right: 10.0, top: 10.0, bottom: 10.0),
          child: InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute( builder: (context) => ImagePage(herotag: imgPath)));
      },
          child: Container(
            height: 230.0,
            width: (MediaQuery.of(context).size.width/2)-20.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 2.0,
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1.5,
            )
          ]
        ),

        child: Column(
          children: <Widget>[
                Hero(
                  tag: imgPath,
                  child: Container(
                    height: 175.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
                      image: DecorationImage(
                        image: NetworkImage(imgPath),
                        fit: BoxFit.cover,

                      )
                    ),
                  ),
                ),
      


            SizedBox(height: 10.0,),


            
             Text(price,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
            ),

          ],
        ),
    ),
    ),
  );

}
}
