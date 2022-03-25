class EventModel {
  String? eventDate;
  String? eventId;
  String? eventName;
  String? eventType;
  String? organizerId;
  String? startTime;
  String? endTime;
  String? availableSeats;
  String? ticketPrice;
  String? eventMode;
  String? eventDescription;

  EventModel(
      {this.eventDate,
      this.eventId,
      this.eventName,
      this.eventType,
      this.organizerId,
      this.eventDescription,
      this.startTime,
      this.endTime,
      this.availableSeats,
      this.eventMode,
      this.ticketPrice});

  EventModel.fromJson(Map<String, dynamic> json) {
    eventDate = json['eventDate'];
    eventId = json['eventId'];
    eventName = json['eventName'];
    eventType = json['eventType'];
    organizerId = json['organizerId'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    availableSeats = json['availableSeats'];
    eventMode = json["eventMode"];
    ticketPrice = json['ticketPrice'];
    eventDescription = json["eventDescription"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['eventDate'] = eventDate;
    data['eventId'] = eventId;
    data['eventMode'] = eventMode;
    data['eventName'] = eventName;
    data['eventType'] = eventType;
    data['organizerId'] = organizerId;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['availableSeats'] = availableSeats;
    data['ticketPrice'] = ticketPrice;
    data['eventDescription'] = eventDescription;
    return data;
  }
}
