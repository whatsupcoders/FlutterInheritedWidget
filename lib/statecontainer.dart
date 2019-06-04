import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'event.dart';

class StateContainer extends StatefulWidget {
  final Widget child;
  final Event event;

  StateContainer({@required this.child,this.event});

  static StateContainerState of(BuildContext context){
    return(context.inheritFromWidgetOfExactType(InheritedContainer) as InheritedContainer).data;
  }

  StateContainerState createState() => StateContainerState();
}

class StateContainerState extends State<StateContainer> {
    Event event;
    
    void updateEventInfo({eventName,eventDetails,eventDate,eventLocation}){
      if(event==null){
        event=new Event(eventName:eventName,eventDetails:eventDetails,eventDate:eventDate,eventLocation:eventLocation);
        setState(() {
         event=event; 
        });
      }
      else{
        setState(() {
         event.eventName=eventName ?? event.eventName; 
         event.eventDetails=eventDetails ?? event.eventDetails; 
         event.eventDate=eventDate ?? event.eventDate; 
         event.eventLocation=eventLocation ?? event.eventLocation; 
        });
      }

    }

  @override
  Widget build(BuildContext context) {
    return InheritedContainer(
        data:this,
       child: widget.child,
    );
  }
}

class InheritedContainer extends InheritedWidget {
   final StateContainerState data;

  InheritedContainer({Key key,@required this.data, @required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify( InheritedContainer oldWidget) {
    return true;
  }
}
