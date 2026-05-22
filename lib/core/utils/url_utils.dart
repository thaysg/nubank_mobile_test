class UrlUtils {
  UrlUtils._();

  static String getSiteName(String url) {
    if (url.isEmpty) return 'Link';
    
    try {
      // Ensure the URL has a scheme for Uri.parse to work correctly
      final effectiveUrl = url.contains('://') ? url : 'https://$url';
      final uri = Uri.parse(effectiveUrl);
      final host = uri.host.toLowerCase();
      
      if (host.isEmpty) return 'Link';
      
      final parts = host.split('.');
      
      if (parts.length > 1 && parts[0] == 'www') {
        return _capitalize(parts[1]);
      }
      
      return _capitalize(parts[0]);
    } catch (_) {
      return 'Link';
    }
  }

  static String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
