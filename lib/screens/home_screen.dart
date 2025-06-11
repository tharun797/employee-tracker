import 'package:employee_tracker/providers/employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeAsync = ref.watch(employeeProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,

        shadowColor: Colors.black.withValues(alpha: 0.05),
        elevation: 5,
        automaticallyImplyLeading: false,
        title: Text('Employee Tracker', style: TextStyle(fontSize: 25)),
      ),

      body: employeeAsync.when(
        data: (employees) => ListView.builder(
          itemCount: employees.length,
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) {
            final emp = employees[index];
            return Card(
              color: emp.isVeteran ? Colors.green[100] : null,
              child: ListTile(
                title: Text(emp.name),
                subtitle: Text('${emp.role}\nSince: ${emp.startDate}'),
                trailing: emp.isVeteran
                    ? const Icon(Icons.verified, color: Colors.green)
                    : null,
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
