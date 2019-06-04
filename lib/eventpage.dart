import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'addevent.dart';
import 'event.dart';
import 'statecontainer.dart';

class EventPage extends StatefulWidget {
  final Widget child;

  EventPage({Key key, this.child}) : super(key: key);

  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
 Event event;
   _addEventDetails(BuildContext context){
      Navigator.push(context, MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context){
          return AddEvent();
        }
      ),);
    }

  @override
  Widget build(BuildContext context) {
  final myInheritedWidget= StateContainer.of(context);
    event= myInheritedWidget.event;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text("Event Page", style: TextStyle()),
        ),
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
                              FontAwesomeIcons.calendar,
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
                        )),
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
      ),),
    );
  }
}

