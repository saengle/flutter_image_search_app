import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success;

  const factory Result.error(String e) = Error;
}

//freezed 를 이용해서 sealedclass 만들기 (성공 실패의 에러처리)