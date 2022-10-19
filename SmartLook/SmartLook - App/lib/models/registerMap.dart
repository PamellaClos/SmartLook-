class Register{
  late int id, color, remind;
  late String title, note, events, entrada, date, startTime, endTime;

  Register(this.id, this.color, this.remind, this.title, this.note, this.events,this.entrada,this.date, this.startTime,this.endTime);


  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'id' : id,
      'color' : color,
      'remind' : remind,
      'title' : note,
      'events' : events,
      'entrada' : entrada,
      'date' : date,
      'startTime' : startTime,
      'endTime' : endTime
    };
    return map;
  }

  Register.fromMap(Map<String, dynamic>map){
    id = map['id'];
    color = map['color'];
    remind = map['remind'];
    events = map['events'];
    entrada = map['entrada'];
    date = map['date'];
    startTime = map['startTime'];
    endTime = map['endTime'];

  }

  @override
  String toString() {
    return '$id, $color, $remind, $events, $entrada, $date, $startTime, $endTime';
  }
}