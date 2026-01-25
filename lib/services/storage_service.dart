import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StorageService {
  static final StorageService _instance = StorageService._internal();

  factory StorageService() {
    return _instance;
  }

  StorageService._internal();

  late SharedPreferences _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save string
  Future<bool> saveString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  // Get string
  String? getString(String key) {
    return _prefs.getString(key);
  }

  // Save integer
  Future<bool> saveInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  // Get integer
  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  // Save boolean
  Future<bool> saveBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  // Get boolean
  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  // Save double
  Future<bool> saveDouble(String key, double value) async {
    return await _prefs.setDouble(key, value);
  }

  // Get double
  double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  // Save list
  Future<bool> saveList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  // Get list
  List<String>? getList(String key) {
    return _prefs.getStringList(key);
  }

  // Save JSON
  Future<bool> saveJson(String key, Map<String, dynamic> value) async {
    return await _prefs.setString(key, jsonEncode(value));
  }

  // Get JSON
  Map<String, dynamic>? getJson(String key) {
    final value = _prefs.getString(key);
    if (value == null) return null;
    return jsonDecode(value);
  }

  // Delete
  Future<bool> delete(String key) async {
    return await _prefs.remove(key);
  }

  // Clear all
  Future<bool> clearAll() async {
    return await _prefs.clear();
  }

  // Check if key exists
  bool hasKey(String key) {
    return _prefs.containsKey(key);
  }

  // Auth token
  Future<bool> saveAuthToken(String token) async {
    return await saveString('auth_token', token);
  }

  String? getAuthToken() {
    return getString('auth_token');
  }

  Future<bool> deleteAuthToken() async {
    return await delete('auth_token');
  }

  // User ID
  Future<bool> saveUserId(String userId) async {
    return await saveString('user_id', userId);
  }

  String? getUserId() {
    return getString('user_id');
  }

  // User role
  Future<bool> saveUserRole(String role) async {
    return await saveString('user_role', role);
  }

  String? getUserRole() {
    return getString('user_role');
  }
}
