class EmployeeModel {
  final int id;
  final String name;
  final String role;
  final String startDate;
  final bool isActive;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.role,
    required this.startDate,
    required this.isActive,
  });

  // Checks if employee is active for more than 5 years
  bool get isVeteran {
    final joined = DateTime.parse(startDate);
    final duration = DateTime.now().difference(joined);
    return isActive && duration.inDays >= 1825;
  }

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json['id'],
        name: json['name'],
        role: json['role'],
        startDate: json['startDate'],
        isActive: json['isActive'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'role': role,
        'startDate': startDate,
        'isActive': isActive ? 1 : 0,
      };

  factory EmployeeModel.fromMap(Map<String, dynamic> map) => EmployeeModel(
        id: map['id'],
        name: map['name'],
        role: map['role'],
        startDate: map['startDate'],
        isActive: map['isActive'] == 1,
      );
}