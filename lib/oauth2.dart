import 'dart:io';
import 'package:oauth2/oauth2.dart' as oauth2;

// how to https://stackoverflow.com/questions/46196240/oauth2-flow-in-flutter-app

final authorizationEndpoint =
Uri.parse("https://www.fitbit.com/oauth2/authorize");
final tokenEndpoint =
Uri.parse("https://api.fitbit.com/oauth2/token");
final identifier = "227RTW";
final secret = "4ed2a4d0b532f08ca492432905e409a6";
// this will simplify redirect https://github.com/flutter/flutter/issues/357

final redirectUrl = Uri.parse("com.googleusercontent.apps.227RTW");

/// A file in which the users credentials are stored persistently. If the server
/// issues a refresh token allowing the client to refresh outdated credentials,
/// these may be valid indefinitely, meaning the user never has to
/// re-authenticate.
final credentialsFile = new File("~/.myapp/credentials.json");

/// Either load an OAuth2 client from saved credentials or authenticate a new
/// one.
Future<oauth2.Client> getClient() async {
  var exists = await credentialsFile.exists();

  // If the OAuth2 credentials have already been saved from a previous run, we
  // just want to reload them.
  if (exists) {
    var credentials = new oauth2.Credentials.fromJson(
        await credentialsFile.readAsString());
    return new oauth2.Client(credentials,
        identifier: identifier, secret: secret);
  }

  // If we don't have OAuth2 credentials yet, we need to get the resource owner
  // to authorize us. We're assuming here that we're a command-line application.
  var grant = new oauth2.AuthorizationCodeGrant(
      identifier, authorizationEndpoint, tokenEndpoint,
      secret: secret);

  // Redirect the resource owner to the authorization URL. This will be a URL on
  // the authorization server (authorizationEndpoint with some additional query
  // parameters). Once the resource owner has authorized, they'll be redirected
  // to `redirectUrl` with an authorization code.
  //
  // `redirect` is an imaginary function that redirects the resource
  // owner's browser.
  await redirect(grant.getAuthorizationUrl(redirectUrl));

  // Another imaginary function that listens for a request to `redirectUrl`.
  var request = await listen(redirectUrl);

  // Once the user is redirected to `redirectUrl`, pass the query parameters to
  // the AuthorizationCodeGrant. It will validate them and extract the
  // authorization code to create a new Client.
  return await grant.handleAuthorizationResponse(request.uri.queryParameters);
}

main() async {
  var client = await loadClient();

  // Once you have a Client, you can use it just like any other HTTP client.
  var result = client.read("http://example.com/protected-resources.txt");

  // Once we're done with the client, save the credentials file. This ensures
  // that if the credentials were automatically refreshed while using the
  // client, the new credentials are available for the next run of the
  // program.
  await credentialsFile.writeAsString(client.credentials.toJson());

  print(result);
}