import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // ⚠️ Change based on test device:
  // Android emulator  → http://10.0.2.2:3000/api
  // iOS simulator     → http://localhost:3000/api
  // Real device       → http://<her-PC-LAN-IP>:3000/api
  static const String baseUrl = 'http://10.0.2.2:3000/api';

  // ---------------- LOGIN ----------------
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final res = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    final data = jsonDecode(res.body);

    if (res.statusCode == 200) return data;
    throw Exception(data['message'] ?? 'Login failed');
  }

  // ---------------- FORGOT PASSWORD (send OTP) ----------------
  static Future<Map<String, dynamic>> forgotPassword(String email) async {
    final res = await http.post(
      Uri.parse('$baseUrl/auth/forgot-password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    final data = jsonDecode(res.body);

    if (res.statusCode == 200) return data;
    throw Exception(data['message'] ?? 'Failed to send OTP');
  }

  // ---------------- RESET PASSWORD ----------------
  static Future<Map<String, dynamic>> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    final res = await http.post(
      Uri.parse('$baseUrl/auth/reset-password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'otp': otp,
        'newPassword': newPassword,
      }),
    );

    final data = jsonDecode(res.body);

    if (res.statusCode == 200) return data;
    throw Exception(data['message'] ?? 'Reset failed');
  }
}