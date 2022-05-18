import 'package:flutter/material.dart';
import 'package:gam3a/reuse.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {


  @override
  initState(){
    super.initState();
    createDatabse();
  }
  late Database database;
  List<Map> property = [];

  void createDatabse()async{
     database = await openDatabase(
         'ARQA',
         version: 1,
        onCreate: (database, version) async {
           print('databse created');

          await database.execute(
              'CREATE TABLE Test (id INTEGER PRIMARY KEY, Title TEXT,Details TEXT,PhoneNumber TEXT,Location TEXT,Bedroom INTEGER,Bathroom INTEGER, Area INTEGER ,Price INTEGER)');
        },

        onOpen: (database){
           print('database opened');
           getDataFromDatabase(database).then((value) {
             property=value;
             print(property);
           }
           );


     }

        );
  }

  void insertToDatabase(){
    database.transaction((txn) async {

      await txn.rawInsert('INSERT INTO Test ( Title ,Details ,PhoneNumber ,Location ,Bedroom ,Bathroom , Area  ,Price ) VALUES ("ZZ Villa" , "Porto October is located in the heart of 6th of October City" , "01020296982" , "October" , "7" ," 3 ","150" , "3501")')
          .then((value) => print('$value inserted succefully'))
          .catchError((e)=> print('error when inserting data: $e'));

    });


  }

Future <List<Map>> getDataFromDatabase(database) async{
    return await database.rawQuery('SELECT * FROM Test');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(children: [
          ElevatedButton(onPressed: (){
            insertToDatabase();
          }, child: Text('add'),
          ),
          ElevatedButton(onPressed: (){
            print(property.);
          }, child: Text('Print'),
          ),
          ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: property.length,
            itemBuilder: (BuildContext context, index) {
              property[index];
              return RecommendCard(
                Area: Database;
              );
            },
          ),


        ],
        ),
      ),
    );
  }
}
