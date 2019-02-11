import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: null,
        home: new LoginPage(),
        theme: new ThemeData(primarySwatch: Colors.blue));
  }
}

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 20));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Beats Share"),
        backgroundColor: Colors.brown,
      ),
      backgroundColor: Colors.white12,
      body: new Stack(
        fit: StackFit.loose,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/ronaldo.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new Form(
                  child: new Theme(
                data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                        labelStyle:
                            new TextStyle(color: Colors.teal, fontSize: 20.0))),
                child: new Container(
                  padding: const EdgeInsets.all(40.0),
                  
                  child: new Column(
                    children: <Widget>[
                      new TextFormField(
                        decoration:
                            new InputDecoration(labelText: "enter email"),

                        keyboardType: TextInputType.emailAddress,
                      ),
                      new TextFormField(
                        decoration:
                            new InputDecoration(labelText: "enter password"),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ), new Padding(
                        padding: const EdgeInsets.only(top:10) ,

                      ),
                      new MaterialButton(
                        height: 40,
                        minWidth: 80,
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: new Text("Login"),
                        onPressed: ()=>{},         
                        splashColor: Colors.cyan,              
                      )
                    ],
                  ),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
