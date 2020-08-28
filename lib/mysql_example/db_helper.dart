import 'package:mysql1/mysql1.dart';

class MySql{
  
  static String host='10.0.3.2',
                user='srikanth2',
                password='9014461984',
                db='world';
  static int port=3306;
  MySql();

  Future<MySqlConnection> getConnection()async{
    var settings=ConnectionSettings(
      user: user,
      db: db,
      host: host,
      port: port,
      password: password,
      
    );

    return await MySqlConnection.connect(settings,);
  }

}