import 'dart:io';

class MyHttpClient implements HttpClient {
  HttpClient _realClient;

  MyHttpClient(this._realClient) {
    print("initialized");
    this.maxConnectionsPerHost = this._realClient.maxConnectionsPerHost;
    this.userAgent = this._realClient.userAgent;
  }

  @override
  bool get autoUncompress => _realClient.autoUncompress;

  @override
  set autoUncompress(bool value) => _realClient.autoUncompress = value;

  @override
  Duration get connectionTimeout => Duration(seconds: 60);

  @override
  Duration get idleTimeout => _realClient.idleTimeout;

  @override
  set idleTimeout(Duration value) => _realClient.idleTimeout = value;

  @override
  void addCredentials(
          Uri url, String realm, HttpClientCredentials credentials) =>
      _realClient.addCredentials(url, realm, credentials);

  @override
  void addProxyCredentials(String host, int port, String realm,
          HttpClientCredentials credentials) =>
      _realClient.addProxyCredentials(host, port, realm, credentials);

  @override
  void close({bool force = false}) => _realClient.close(force: force);

  @override
  Future<HttpClientRequest> delete(String host, int port, String path) =>
      _realClient.delete(host, port, path);

  @override
  Future<HttpClientRequest> deleteUrl(Uri url) => _realClient.deleteUrl(url);

  @override
  Future<HttpClientRequest> get(String host, int port, String path) {
    print("get called");
    return _updateHeaders(_realClient.get(host, port, path));
  }

  Future<HttpClientRequest> _updateHeaders(
      Future<HttpClientRequest> httpClientRequest) async {
    return (await httpClientRequest)..headers.add('Accept', 'application/json');
  }

  @override
  Future<HttpClientRequest> getUrl(Uri url) =>
      _updateHeaders(_realClient.getUrl(url.replace(path: url.path)));

  @override
  Future<HttpClientRequest> head(String host, int port, String path) =>
      _realClient.head(host, port, path);

  @override
  Future<HttpClientRequest> headUrl(Uri url) => _realClient.headUrl(url);

  @override
  Future<HttpClientRequest> open(
          String method, String host, int port, String path) =>
      _realClient.open(method, host, port, path);

  @override
  Future<HttpClientRequest> openUrl(String method, Uri url) =>
      _realClient.openUrl(method, url);

  @override
  Future<HttpClientRequest> patch(String host, int port, String path) =>
      _realClient.patch(host, port, path);

  @override
  Future<HttpClientRequest> patchUrl(Uri url) => _realClient.patchUrl(url);

  @override
  Future<HttpClientRequest> post(String host, int port, String path) {
    print("post called");
    return _realClient.post(host, port, path);
  }

  @override
  Future<HttpClientRequest> postUrl(Uri url) {
    print("postUrl called");
    return _realClient.postUrl(url);
  }

  @override
  Future<HttpClientRequest> put(String host, int port, String path) =>
      _realClient.put(host, port, path);

  @override
  Future<HttpClientRequest> putUrl(Uri url) => _realClient.putUrl(url);

  @override
  set connectionTimeout(Duration? _connectionTimeout) =>
      _realClient.connectionTimeout = _connectionTimeout;

  @override
  set findProxy(String Function(Uri url)? f) => _realClient.findProxy = f;

  @override
  set badCertificateCallback(
          bool Function(X509Certificate cert, String host, int port)?
              callback) =>
      _realClient.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

  @override
  int? maxConnectionsPerHost;

  @override
  String? userAgent;

  @override
  set authenticate(
          Future<bool> Function(Uri url, String scheme, String? realm)? f) =>
      _realClient.authenticate = f;

  @override
  set authenticateProxy(
          Future<bool> Function(
                  String host, int port, String scheme, String? realm)?
              f) =>
      _realClient.authenticateProxy = f;
}
