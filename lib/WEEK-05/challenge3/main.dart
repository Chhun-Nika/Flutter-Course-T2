import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// SERVICES

class StudentsService {
  String getStudents() => "Students loaded";
}

class CourseService {
  String getCourses() => "Courses loaded";
}

class GradesService {
  String getGrades() => "Grades loaded";
}

// GLOBAL SERVICES INSTANCES

// StudentsService globalStudentsService = StudentsService();
// CourseService globalCourseService = CourseService();
// GradesService globalGradesService = GradesService();

// MAIN ---------------------------------------

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: App()));
}

// UI
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("School App - Global Services")),
      body: MultiProvider(
        providers: [
          Provider<StudentsService>(create: (context) => StudentsService()),
          Provider<CourseService>(create: (context) => CourseService()),
          Provider<GradesService>(create: (context) => GradesService()),
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            StudentsScreen(),
            CoursesScreen(),
            GradesScreen(),
            SettingsScreen(),
          ],
        ),
      ),
    );
  }
}

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Direct global access
    StudentsService studentData = context.read<StudentsService>();

    return Text("StudentsScreen → ${studentData.getStudents()}");
  }
}

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CourseService courseData = context.read<CourseService>();

    return Text("CoursesScreen → ${courseData.getCourses()}");
  }
}

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Direct global access
    StudentsService studentData = context.read<StudentsService>();
    CourseService courseData = context.read<CourseService>();
    GradesService gradeData = context.read<GradesService>();

    return Text(
      "GradesScreen → ${gradeData.getGrades()} for ${studentData.getStudents()} for ${courseData.getCourses()}",
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Seeting");
  }
}
