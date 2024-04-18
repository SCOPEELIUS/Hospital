class Patient {
  String? id;
  String? firstName;
  String? secondName;
  String? email;
  int? age;
  String? carId;
  String? nurseId;
  String? doctorId;
  Patient({
    this.id,
    this.firstName,
    this.secondName,
    this.email,
    this.age,
    this.carId,
    this.nurseId,
    this.doctorId,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['_id'],
      email: json['email'],
      firstName: json['firstName'],
      secondName: json['lastName'],
      age: json['age'],
      carId: json['cardID'],
      doctorId: json['doctorId'],
      nurseId: json['nurseID'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      'firstName': firstName,
      'lastName': secondName,
      'age': age,
      'cardID': carId,
      'doctorId': doctorId,
      'nurseID': nurseId,
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
