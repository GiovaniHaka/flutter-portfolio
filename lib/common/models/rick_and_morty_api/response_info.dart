class ResponseInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;
  
  ResponseInfo({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });
}
