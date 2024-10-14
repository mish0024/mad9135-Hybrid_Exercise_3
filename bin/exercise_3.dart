import 'dart:convert';

// Function to decode JSON and return a list of student records
List<Map<String, String>> decodeJson(String jsonString) {
  List<dynamic> decodedData = jsonDecode(jsonString);
  return decodedData.map((item) => Map<String, String>.from(item)).toList();
}

// Function to sort student records by a given field
List<Map<String, String>> sortStudents(List<Map<String, String>> students, String field) {
  students.sort((a, b) => a[field]!.compareTo(b[field]!));
  return students;
}

// Function to display student records
void displayStudents(List<Map<String, String>> students) {
  for (var student in students) {
    print('Name: ${student['first']} ${student['last']}, Email: ${student['email']}');
  }
}

// Function to add a new student record
void addStudent(List<Map<String, String>> students, Map<String, String> newStudent) {
  students.add(newStudent);
}

// Function to remove a student by email
void removeStudentByEmail(List<Map<String, String>> students, String email) {
  students.removeWhere((student) => student['email'] == email);
}

void main() {
  // JSON string containing a list of student records
  String jsonString = '''
  [
    {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
    {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';

  // Decode JSON to get student records
  List<Map<String, String>> students = decodeJson(jsonString);

  // Display the original list of students
  print('Original Student List:');
  displayStudents(students);

  // Sort the list by last name and display it
  sortStudents(students, 'last');
  print('\nSorted Student List by Last Name:');
  displayStudents(students);

  // Add a new student
  Map<String, String> newStudent = {"first": "John", "last": "Doe", "email": "john.doe@example.com"};
  addStudent(students, newStudent);
  print('\nStudent List After Adding John Doe:');
  displayStudents(students);

  // Remove a student by email
  removeStudentByEmail(students, "shaha@algonquincollege.com");
  print('\nStudent List After Removing Adesh Shah:');
  displayStudents(students);
}
