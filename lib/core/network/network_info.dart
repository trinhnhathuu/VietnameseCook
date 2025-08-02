import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    // Simple implementation - in real app you might want to use connectivity_plus package
    try {
      // You can add connectivity_plus package later for better network checking
      return true; // For now, assume always connected
    } catch (e) {
      return false;
    }
  }
}

// Provider
final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfoImpl();
}); 