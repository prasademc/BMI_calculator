import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../widgets/CustomListTile.dart';
import './landingPage.dart';
import './bodyWeighPage.dart';

class GenderPage extends StatefulWidget {
  @override
  State createState() => GenderPageState();
}

class GenderPageState extends State<GenderPage> with SingleTickerProviderStateMixin {
  Animation<Alignment> _animation;
  AnimationController _animationController;
  bool gender = false;

  @override
  void initState() {

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = Tween<Alignment>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceIn,
        reverseCurve: Curves.bounceInOut,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0.0,
        leading: Builder(builder: (BuildContext context) {
          return new GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: new Container(
              child: new Image.asset("assets/images/menu.png"),
              width: 64.0,
              height: 64.0,
              padding: new EdgeInsets.only(left: 20.0, top: 10.0),
            ),
          );
        }),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'BMI',
              style: Theme.of(context).textTheme.title,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'calculator',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(44.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Text(
              'What is your gender?',
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
        ),
        backgroundColor: const Color(0xFFEBF1F1),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color(0xFF1F2C2B),
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                    const Color(0xFFF0DF5E),
                    const Color(0xFFF1C40F),
                    ],
                  ),
                ),
                child: new Image.asset("assets/images/avatar.png"),
              ),
              CustomListTile(Icons.home, 'Home', (){
                var route = new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new LandingPage(),
                    );
                    Navigator.of(context).push(route);
              }),
              CustomListTile(Icons.person, 'Profile', () =>{}),
              CustomListTile(Icons.history, 'History', () =>{}),
              CustomListTile(Icons.settings, 'Settings', () =>{}),
              CustomListTile(Icons.power_settings_new, 'Signout', () =>{}),
              CustomListTile(Icons.person_add, 'Registor', () =>{}),
              CustomListTile(Icons.exit_to_app, 'Signin', () =>{}),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.black87.withOpacity(0.6), BlendMode.srcATop),
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                ),
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                ),
                              ),
                              flex: 8,
                            ),
                          ],
                        ),
                      ),
                      flex: 8,
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: AnimatedBuilder(
                            animation: _animationController,
                            builder: (animation, child){
                              return GestureDetector(
                                onTap: (){
                                  if(_animationController.isCompleted){
                                    _animationController.reverse();
                                  }else {
                                    _animationController.forward();
                                  }

                                  gender = !gender;
                                },
                                child: Container(
                                  width: 254.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFA3ABAE),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30.0),
                                    ),
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                        alignment: _animation.value,
                                        child: GestureDetector(
                                          onTap: (){
                                            if(_animationController.isCompleted){
                                              _animationController.reverse();
                                            }else {
                                              _animationController.forward();
                                            }

                                            gender = !gender;
                                          },
                                          child: Container(
                                            width: 127.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFEBF1F1),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(30.0),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                gender ? 'Male': 'Female',
                                                style: Theme.of(context).textTheme.display2,
                                              ),
                                            )
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      flex: 2,
                    ),
                  ],
                )
              ),
              flex: 8,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Center(
                  child: new InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new BodyWeighPage(),
                      );
                      Navigator.of(context).push(route);
                    },
                    child: new Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: new BoxDecoration(
                        color: Colors.transparent,
                        border: new Border.all(
                          color: const Color(0xFFF1C40F),
                          width: 4.0,
                        ),
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      child: new Center(
                        child: Icon(
                          Icons.arrow_forward, 
                          size: 32,
                          color: const Color(0xFFF1C40F),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              flex: 2,
            ),
          ],
        ),
      ), 
    );
  }
}
