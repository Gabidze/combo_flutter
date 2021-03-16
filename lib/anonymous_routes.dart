import 'package:flutter/material.dart';
import './utils/theme.dart';


class AnonymousRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: basicTheme(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('Switzerland'),
      ),

      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [



            Row(
              children: [
                Expanded(
                  /*1*/
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*2*/
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Oeschinen Lake Campground',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Kandersteg, Switzerland',
                        style: TextStyle(
                          color: Colors.red[500],
                        ),
                      ),
                    ],
                  ),
                ),
                FavoriteWidget(),
              ],
            ),

            Image.network(
              'https://img2.goodfon.ru/original/1366x768/d/7b/les-ozero-kamni-derevya-gory.jpg',
              width: 500,
              height: 240,
              fit: BoxFit.cover,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButtonColumn(color, Icons.call, 'CALL'),
                _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
                _buildButtonColumn(color, Icons.share, 'SHARE'),
                _buildButtonColumn(color, Icons.map, 'MAP'),

              ],
            ),
            Text(

              'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                  'Alps. Situated 1,578 meters above sea level, it is one of the '
                  'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                  'half-hour walk through pastures and pine forest, leads you to the '
                  'lake, which warms to 20 degrees Celsius in the summer. Activities '
                  'enjoyed here include rowing, and riding the summer toboggan run.',
              softWrap: true,


            ),
            RaisedButton(
              child: Text('Open Form'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return DetailScreen();
                  }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Name',
                hintText: 'Dima',
              ),
              textInputAction: TextInputAction.next,
              validator: (String name){
                if (name.isEmpty) return 'Invalid name';
                else return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                labelText: 'Email',
                hintText: 'qwert@mail.ru',
              ),
              textInputAction: TextInputAction.next,
              validator: (String email) {
                Pattern pattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
                RegExp regex = RegExp (pattern);
                if (!regex.hasMatch(email)) return 'Invalid email';
                else return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                icon: Icon(Icons.call),
                labelText: 'Phone Number',
                hintText: '9243332211',
                prefixText: '+7'
              ),
              textInputAction: TextInputAction.done,
                validator: (String number) {
                if (number.length != 10 ) return 'Invalid mobile number';
        else return null;
  },
            ),


            SizedBox (height: 20),
           new RaisedButton( onPressed: () {
             FocusScope.of(context).requestFocus(FocusNode());
             if(_formKey.currentState.validate()) return { Navigator.pop(context) };
              }, child: Text ('Sabmit'), color: Colors.blue[500], textColor: Colors.white),



          ],



        ),
      ),
    );
  }
}




Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,

          ),
        ),
      ),
    ],
  );
}


class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;


  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {

        _isFavorited = false;
      } else {

        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
    Container(
    padding: EdgeInsets.all(0),
    child: IconButton(
    padding: EdgeInsets.all(0),
    alignment: Alignment.centerRight,
    icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
    color: Colors.orange[300],
    onPressed: _toggleFavorite,
    ),

    ),
        ],
    );



  }

}
