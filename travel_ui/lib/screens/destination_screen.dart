import 'package:flutter/material.dart';
import 'package:travel_ui/models/activity_model.dart';
import 'package:travel_ui/models/destination_model.dart';
import 'package:travel_ui/models/hotel_model.dart';

class DestinationScreen extends StatefulWidget {
  @override
  
  final Destination destination;

  DestinationScreen({this.destination});
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }
  Widget _buildHotels() {
    return Expanded(
      child: Container( 
        child: ListView.builder(
          itemCount: widget.destination.activities.length,
          itemBuilder: (BuildContext context, int index) {
            Activity activity = widget.destination.activities[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Container(
                height: 150.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: 140.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image(
                            image: AssetImage(activity.imageUrl),
                            fit: BoxFit.cover
                          ),
                        )
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row( 
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  height: 60,
                                  child: Text(
                                    activity.name,
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                    ),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text( 
                                      "\$ ${activity.price}",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                      ),
                                    ),
                                    Text(
                                      "Per Day",
                                      style: TextStyle(
                                        fontSize: 10.0
                                      )
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              activity.type
                            ),
                            SizedBox(height: 5.0),
                            _buildRatingStars(activity.rating),
                            SizedBox(height: 5.0),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(4.0)
                                  ),
                                  child: Text(activity.startTimes[0]),
                                ),
                                SizedBox(width: 5.0),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(4.0)
                                  ),
                                  child: Text(activity.startTimes[1]),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)
                  ),
                  boxShadow: [BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 0.2),
                    blurRadius: 6.0
                  )]
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0)
                    ),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 26.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.search),
                          color: Colors.black,
                          iconSize: 26.0,
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.black,
                          iconSize: 26.0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.destination.city,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w300
                      )
                    ),
                    Row( 
                      children: <Widget>[
                        Icon(
                          Icons.flight_land,
                          size: 20.0,
                          color: Colors.white,
                        ),
                        SizedBox(width: 6.0),
                        Text(
                          widget.destination.country,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white
                          )
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 30,
                right: 20,
                child: Icon(
                  Icons.location_on,
                  size: 30.0,
                  color: Colors.white,
                ),
              )
            ],
          ), 
          _buildHotels(), 
        ],
      ),
    );
  }
}
 