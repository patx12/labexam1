import 'package:flutter/material.dart';

class Subject {
  final String name;
  final String instructor;
  final String schedule;

  const Subject(this.name, this.instructor, this.schedule);
}

const subjects = [
  Subject('Larping 101', 'Mr. Larpson', 'Mon/Wed 9:00 - 10:30 AM'),
  Subject('Understanding Larping Behavior', 'Tung Tung Tung Sahur ', 'Tue/Thu 1:00 - 2:30 PM'),
  Subject('Scamming Others', 'Ayush Boob', 'Fri 8:00 - 11:00 AM'),
];

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  Widget infoTile(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
    );
  }

  Widget subjectCard(Subject subject) {
    return Card(
      child: ListTile(
        title: Text(subject.name),
        subtitle: Text(
          'Instructor: ${subject.instructor}\nSchedule: ${subject.schedule}',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => print('Logout clicked'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/a6d8720b9f13761d027efc64f2f27b51.jpg'),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Patrick Pajaron',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text('ID: 539220'),
                  Text('BSIT 3RD YEAR'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Card(
            child: Column(
              children: [
                infoTile(Icons.email, 'patpajaron@gmail.com'),
                infoTile(Icons.phone, '09071234561'),
                infoTile(Icons.home, 'Juan Village, Bago Aplaya Davao City'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Subjects',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...subjects.map(subjectCard),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Add Subject Clicked!'),
        child: const Icon(Icons.add),
      ),
    );
  }
}