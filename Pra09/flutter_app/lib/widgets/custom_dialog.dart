import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String msg, description, buttonText;

  CustomDialog({
    @required this.msg,
    @required this.description,
    @required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
              top: Consts.avataRadius + Consts.padding,
              bottom: Consts.padding,
              left: Consts.padding,
              right: Consts.padding),
          margin: EdgeInsets.only(top: Consts.avataRadius),
          decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(Consts.padding),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 0.0),
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                msg,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  onPressed: () {
                    print("눌림");
                    Navigator.pop(context);
                  },
                  child: Text(buttonText),
                ),
              )
            ],
          ),
        ),
        Positioned(
          left: Consts.padding,
            right: Consts.padding,
            child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: Consts.avataRadius,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(Consts.avataRadius)),
            child: Image.network("https://picsum.photos/200"),
          ),
        ))
      ],
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avataRadius = 66.0;
}
