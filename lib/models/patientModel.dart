class Patient {
  String? id;
  String? firstName;
  String? secondName;
  String? age;
  String? carId;
  String? nurseId;
  String? doctorId;
  String? createdAt;
  String? wardNumber;
  Patient({
    this.id,
    this.firstName,
    this.secondName,
    this.age,
    this.carId,
    this.nurseId,
    this.doctorId,
    this.createdAt,
    this.wardNumber,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['_id'],
      firstName: json['firstName'],
      secondName: json['lastName'],
      age: json['age'].toString(),
      carId: json['cardID'],
      doctorId: json['doctorId'],
      nurseId: json['nurseID'],
      wardNumber: json['wardNumber'],
      createdAt:
          "${DateTime.parse(json['createdAt']).day.toString()}-${DateTime.parse(json['createdAt']).month.toString()}-${DateTime.parse(json['createdAt']).year.toString()}",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': secondName,
      'age': age,
      'cardID': carId,
      'doctorId': doctorId,
      'nurseID': nurseId,
      'createdAt': createdAt,
      'wardNumber': wardNumber,
    };
  }
}

class Patients {
  List<Patient>? patients = [];
  Patients({this.patients});
  factory Patients.fromJsonList(List<dynamic> jsonList) {
    List<Patient> patientList =
        jsonList.map((json) => Patient.fromJson(json)).toList();
    return Patients(patients: patientList);
  }

  List<Map<String, dynamic>> toJsonList() {
    return patients!.map((patient) => patient.toJson()).toList();
  }
}
