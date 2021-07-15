import 'package:narr/core/services/service_exports.dart';

class ServiceInjector {
  //backend services
  ApiService apiService = ApiService();
  AuthService authService = AuthService();
  SocketService socketService = SocketService();

  //utils services
  DialogInfoService dialogInfoService = DialogInfoService();
  RouterService routerService = RouterService();
  InstitutionService institutionService = InstitutionService();
  UtilityService utilityService = UtilityService();
  //frontend services

  //research
  ResearchService researchService = ResearchService();
}

ServiceInjector narrService = ServiceInjector();
