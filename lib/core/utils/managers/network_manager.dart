import 'package:connectivity_plus/connectivity_plus.dart';

abstract interface class NetworkManager {
  /// Checks if the device is connected to the internet.
  Future<bool> isConnected();

  /// Listens to internet connection status changes.
  Stream<bool> onConnectionChange();
}

class ConnectivityPlusImpl implements NetworkManager {
  final Connectivity _connectivity = Connectivity();

  @override
  Future<bool> isConnected() async {
    try {
      List<ConnectivityResult> connectivityResults =
          await _connectivity.checkConnectivity();

      if (connectivityResults
          .any((result) => result == ConnectivityResult.none)) {
        return false;
      }

      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Stream<bool> onConnectionChange() async* {
    await for (var results in _connectivity.onConnectivityChanged) {
      if (results.any((result) => result == ConnectivityResult.none)) {
        yield false;
      } else {
        yield true;
      }
    }
  }
}
