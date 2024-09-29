import 'package:app_links/app_links.dart';
import 'package:oauth2/oauth2.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    auth();
  }

  Future<void> auth() async {
    final appLinks = AppLinks();
    final authUrl = Uri.parse(
        'http://localhost:8080/realms/oomade/protocol/openid-connect/auth');
    final tokenUrl = Uri.parse(
        'http://localhost:8080/realms/oomade/protocol/openid-connect/token');

    var grant = AuthorizationCodeGrant('frontend', authUrl, tokenUrl);

    // A URL on the authorization server (authorizationEndpoint with some additional
    // query parameters). Scopes and state can optionally be passed into this method.
    final redirectUrl = Uri.parse('http://localhost:62048');
    var authorizationUrl = grant.getAuthorizationUrl(redirectUrl, scopes: ['openid', 'profile']);

    if (await canLaunchUrl(authorizationUrl)) {
      await launchUrl(authorizationUrl);
    }

    late Uri responseUrl;

    final sub = appLinks.uriLinkStream.listen((uri) async {
      if (uri.toString() == redirectUrl.toString()) {
        responseUrl = uri;
        print(['r', responseUrl]);
        final client = await grant.handleAuthorizationResponse(responseUrl.queryParameters);
        print(client.credentials.toJson());
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(child: Text('ee'));
  }
}
