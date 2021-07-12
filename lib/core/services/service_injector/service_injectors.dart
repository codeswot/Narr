import 'package:narr/core/services/service_exports.dart';

class ServiceInjector {
  //backend services
  ApiService apiService = ApiService();
  AuthService authService = AuthService();
  SocketService socketService = SocketService();

  //utils services
  DialogInfoService dialogInfoService = DialogInfoService();
  RouterService routerService = RouterService();
  //frontend services
}

ServiceInjector narrService = ServiceInjector();
