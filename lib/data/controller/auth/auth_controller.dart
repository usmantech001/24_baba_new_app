import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

// =================== ENUM ===================
enum AuthStatus { idle, loading, success, error }

class AuthController extends ChangeNotifier {
  // ========== CONTROLLERS ==========
  List<String> tabs = ['Sign In', 'Sign Up'];
  int currentTabIndex = 0;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final pageController = PageController();

  void changeTabIndex(int index) {
    currentTabIndex = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  // ========== AUTH STATE ==========
  AuthStatus status = AuthStatus.idle;
  String? errorMessage;

  String? _token;
  String? get token => _token;

  bool _isTokenLoaded = false;
  bool get isTokenLoaded => _isTokenLoaded;

  bool get isLoggedIn => _token != null;

  bool get isLoading => status == AuthStatus.loading;

  // ========== INIT ==========
  AuthController() {
    _loadToken();
  }

  // ========== SHARED PREFERENCES ==========
  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('auth_token');
    _isTokenLoaded = true;
    notifyListeners();
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
    _token = token;
    notifyListeners();
  }

  Future<void> _clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    _token = null;
    notifyListeners();
  }

  // ================= STATUS HELPERS =================
  void setStatus(AuthStatus newStatus) {
    status = newStatus;
    notifyListeners();
  }

  void setLoading() => setStatus(AuthStatus.loading);
  void setSuccess() => setStatus(AuthStatus.success);
  void setError([String? message]) {
    errorMessage = message;
    setStatus(AuthStatus.error);
  }

  void setIdle() => setStatus(AuthStatus.idle);

  // ================= LOGIN API =================
  Future<void> login() async {
    setLoading();
    errorMessage = null;

    try {
      final baseURL = dotenv.env['DEV_API_URL'] ?? '';
      final updatedURL = '$baseURL/auth/login';
      final response = await http.post(
        Uri.parse(updatedURL),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
        }),
      );

      final decoded = jsonDecode(response.body);

      if (response.statusCode == 200 && decoded['success'] == true) {
        final token = decoded['data']?['accessToken'];

        if (token != null && token.isNotEmpty) {
          await _saveToken(token);
          setSuccess();
        } else {
          setError('Token not found in response');
        }
      } else {
        setError(decoded['message'] ?? 'Login failed');
      }
    } catch (e) {
      setError('Network error. Please try again.');
    }
  }

  // ================= SIGNUP API =================
  Future<void> signup() async {
    setLoading();
    errorMessage = null;

    final baseURL = dotenv.env['DEV_API_URL'] ?? '';
    final updatedURL = '$baseURL/auth/signup';

    try {
      final response = await http.post(
        Uri.parse(updatedURL),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "fullName": nameController.text.trim(),
          "email": emailController.text.trim(),
          "phone": phoneController.text.trim(),
          "password": passwordController.text.trim(),
          "role": "user",
          "countryCode": "AE",
        }),
      );

      final decoded = jsonDecode(response.body);

      if ((response.statusCode == 200 || response.statusCode == 201) &&
          decoded['success'] == true) {
        // Save token if returned
        final token = decoded['data']?['accessToken'];
        if (token != null && token.isNotEmpty) {
          await _saveToken(token);
        }

        setSuccess();
        changeTabIndex(0); // back to Sign In
      } else {
        setError(decoded['message'] ?? 'Signup failed');
      }
    } catch (e) {
      setError('Network error. Please try again.');
    }
  }

  // ================= LOGOUT API =================
  Future<void> logout() async {
    if (_token == null) return;

    final baseURL = dotenv.env['DEV_API_URL'] ?? '';
    final updatedURL = '$baseURL/auth/logout';

    try {
      final response = await http.post(
        Uri.parse(updatedURL),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $_token",
        },
      );

      if (response.statusCode == 200) {
        await _clearToken();
        setIdle();
      } else {
        debugPrint('Logout failed: ${response.body}');
      }
    } catch (e) {
      debugPrint('Network error during logout.');
    }
  }

  // ================= CLEANUP =================
  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    emailController.dispose();
    nameController.dispose();
    pageController.dispose();
    super.dispose();
  }
}
