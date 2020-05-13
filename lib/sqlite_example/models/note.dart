class Note{
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;
  Note(this._title,this._date,this._priority,[this._description]);
  Note.withId(this._id,this._title,this._date,this._priority,[this._description]);
  int get id=>this._id;
  String get title=>this._title;
  String get description=>this._description;
  String get date=>this._date;
  int get priority=>this._priority;

  set title(String title){
    this._title=title;
  }
  set description(String description){
    this._description=description;
  }
  set date(String date){
    this._date=date;
  }
  set priority(int priority){
    this._priority=priority;
  }
  Map<String,dynamic> toMap(){
     Map<String,dynamic> map={};
      map['id']=this._id;
      map['title']=this._title;
      map['description']=this._description;
      map['date']=this._date;
      map['priority']=this._priority;
      
      return map;
      
  }

  Note.fromMapObject(Map<String,dynamic> map){
    this._id=map['id'];
    this._title= map['title'];
    this._description=map['description'];
    this._date=map['date'];
    this._priority=map['priority'];

  }
}