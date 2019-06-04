import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'addevent.dart';
import 'event.dart';
import 'statecontainer.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Event event;
  
  _addEventDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) {
            return AddEvent();
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final myInheritedWidget = StateContainer.of(context);
    event = myInheritedWidget.event;
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.bars),
            onPressed: () {
              //
            }),
        title: Container(
          alignment: Alignment.center,
          child: Text("Home Page", style: TextStyle()),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.tasks,
              size: 20.0,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ],
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              width: 300.0,
              height: 300.0,
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        event != null
                            ? Text(
                                '${event.eventName}',
                                style: TextStyle(fontSize: 30.0,color: Color(0xffE81035)),
                              )
                            : Text("No Task Name"),
                            SizedBox(height: 10.0,),
                        event != null
                            ? Text(
                                '${event.eventDetails}',
                                style: TextStyle(fontSize: 20.0,color: Colors.blueGrey),
                              )
                            : Text("No Task Details"),
                            SizedBox(height: 10.0,),
                        Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.calendarTimes,
                              size: 20.0,
                              color: Color(0xffE81035),
                            ),
                            SizedBox(width: 10.0,),
                            event != null
                                ? Text(
                                    '${event.eventDate}',
                                    style: TextStyle(fontSize: 18.0,color: Colors.black),
                                  )
                                : Text("No Location"),
                          ],
                        ),),
                        SizedBox(height: 10.0,),
                        Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.mapMarkerAlt,
                              size: 20.0,
                              color: Color(0xffE81035),
                            ),
                            SizedBox(width: 10.0,),
                            event != null
                                ? Text(
                                    '${event.eventLocation}',
                                    style: TextStyle(fontSize: 18.0,color: Colors.black),
                                  )
                                : Text("No Location"),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffE81035),
          child: Icon(
            FontAwesomeIcons.plus,
            size: 30.0,
            color: Colors.white,
          ),
          onPressed: () {
            _addEventDetails(context);
          }),
    );
  }
}
