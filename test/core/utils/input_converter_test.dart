import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/core/utils/input_converter.dart';

void main() {
  late InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInt', () {
    test(
      'should return an integer when the string represents an unsigned integer',
      () async {
        final str = '123';
        final result = inputConverter.stringToUnsignedInteger(str);

        expect(result, Right(123));
      },
    );
    test(
      'should return a failure when the string is not an integer',
      () async {
        final str = 'abc';
        final result = inputConverter.stringToUnsignedInteger(str);
        expect(result, Left(InvalidInputFailure()));
      },
    );

    test(
      'should return a failure when the string is a negative integer',
      () async {
        final str = '-123';
        final result = inputConverter.stringToUnsignedInteger(str);
        expect(result, Left(InvalidInputFailure()));
      },
    );
  });
}
