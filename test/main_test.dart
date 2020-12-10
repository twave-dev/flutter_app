import 'package:test/test.dart';

void main() {
  test('should be lowercase', () {
    String hello = 'Hello World';

    expect(hello.toLowerCase(), 'hello world');
  });

  test('should contain name', () {
    String hello = 'Hello World, Mike';

    expect(hello.contains('mike'), true);
  });
}