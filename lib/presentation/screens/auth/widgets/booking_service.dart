import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class BookingsService {
  final String baseUrl = dotenv.env['PROD_API_URL']!;

  Future<List<dynamic>> fetchBookings({
    required String token,
    String? status,
    String? q,
  }) async {
    if (token.isEmpty) {
      throw Exception('Auth token is required');
    }

    final params = <String, String>{};

    if (status != null && status.isNotEmpty) {
      params['status'] = status.toLowerCase();
    }

    if (q != null && q.trim().isNotEmpty) {
      params['q'] = q.trim();
    }

    final uri = Uri.parse(
      '$baseUrl/booking',
    ).replace(queryParameters: params.isEmpty ? null : params);

    debugPrint('GET $uri');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      if (decoded['success'] == true) {
        return decoded['bookings'] ?? [];
      }
      throw Exception(decoded['message'] ?? 'Failed to fetch bookings');
    }

    throw Exception('Failed to fetch bookings (${response.statusCode})');
  }
}
