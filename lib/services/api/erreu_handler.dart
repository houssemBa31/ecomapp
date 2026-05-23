import 'package:dio/dio.dart';

class ApiErrorHandler {
  static String getErrorMessage(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return "Connexion trop lente.";
        case DioExceptionType.badResponse:
          return _handleStatusCode(error.response?.statusCode);
        case DioExceptionType.connectionError:
          return "Pas de connexion internet.";
        default:
          return "Une erreur inattendue est survenue.";
      }
    }
    return "Erreur inconnue.";
  }

  static String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return "Requête incorrecte.";
      case 401:
        return "Non autorisé (session expirée).";
      case 404:
        return "Ressource non trouvée.";
      case 500:
        return "Erreur serveur. Réessayez plus tard.";
      default:
        return "Erreur serveur ($statusCode).";
    }
  }
}
