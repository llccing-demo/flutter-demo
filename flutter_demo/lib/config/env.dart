final isProd = const bool.fromEnvironment('dart.vm.product');
class Env {
  static BASE_URL() {
    if (isProd) {
      return "http://localhost:7777";
    } else {
      return "http://localhost:7777";
    }
  }
}
