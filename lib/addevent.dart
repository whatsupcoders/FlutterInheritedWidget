import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'event.dart';
import 'statecontainer.dart';
import 'homepage.dart';
import 'eventpage.dart';

class AddEvent extends StatefulWidget {
  final Widget child;

  AddEvent({Key key, this.child}) : super(key: key);

  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  String forEventVal, forDetailVal, forDateVal, forLocationVal;
  final editKey = new GlobalKey<FormState>();

  submitEventDetails() {
    final myInheritedWidget = StateContainer.of(context);
    if (editKey.currentState.validate()) {
      editKey.currentState.save();
      myInheritedWidget.updateEventInfo(
          eventName: forEventVal,
          eventDetails: forDetailVal,
          eventDate: forDateVal,
          eventLocation: forLocationVal);
      Navigator.pop(context);
    } else {
      print('Error in Validation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text("New Event", style: TextStyle()),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: editKey,
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Event Name"),
                    validator: (value) =>
                        value.length == 0 ? "Enter Event Name" : null,
                    onSaved: (value) => forEventVal = value,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Event Details"),
                    validator: (value) =>
                        value.length == 0 ? "Enter Event Details" : null,
                    onSaved: (value) => forDetailVal = value,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Event Date"),
                    validator: (value) =>
                        value.length == 0 ? "Enter Event Date" : null,
                    onSaved: (value) => forDateVal = value,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Event Location"),
                    validator: (value) =>
                        value.length == 0 ? "Enter Event Location" : null,
                    onSaved: (value) => forLocationVal = value,
                  ),
                ),
              ),
              SizedBox(
                    height: 10.0,
                  ),
              RaisedButton(
                child: Text("Submit",style: TextStyle(fontSize: 18.0,color: Color(0xffE81035)),),
                onPressed: submitEventDetails,
              ),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                      child: Text("Home Page",style: TextStyle(fontSize: 18.0,color: Color(0xffE81035)),),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<Null>(
                              builder: (BuildContext context) {
                            return new HomePage();
                          }),
                        );
                      }),
                  SizedBox(
                    width: 10.0,
                  ),
                  RaisedButton(
                      child: Text("Event Page",style: TextStyle(fontSize: 18.0,color: Color(0xffE81035)),),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<Null>(
                              fullscreenDialog: true,
                              builder: (BuildContext context) {
                                return new EventPage();
                              }),
                        );
                      }),
                ],
              )),
            ],
          )),
        ),
      ),
    );
  }
}
