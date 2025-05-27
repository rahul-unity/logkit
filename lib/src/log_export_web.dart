import 'dart:convert';
import 'dart:html' as html;

void exportLogsToWebDownload(List<String> logs) {
  final bytes = utf8.encode(logs.join('\n'));
  final blob = html.Blob([bytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  html.AnchorElement(href: url)
    ..setAttribute('download', '${DateTime.now().toIso8601String().split('T').first}.log')
    ..click();
  html.Url.revokeObjectUrl(url);
}
