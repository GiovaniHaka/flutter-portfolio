class ResponseInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  ResponseInfo({
    required this.count,
    required this.pages,
    this.next = '',
    this.prev = '',
  });

  factory ResponseInfo.fromMap(Map<String, dynamic> map) {
    return ResponseInfo(
      count: map['count'],
      pages: map['pages'],
      next: map['next'],
      prev: map['prev'],
    );
  }

  @override
  String toString() {
    return 'ResponseInfo(count: $count, pages: $pages, next: $next, prev: $prev)';
  }
}
