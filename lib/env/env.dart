import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'IMAGE_KEY', obfuscate: true)
  static final Image_Key = _Env.Image_Key;
}