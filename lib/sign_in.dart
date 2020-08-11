import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final FacebookLogin facebookLogin = FacebookLogin();

Future<String> signInWithGoogle() async
{
  	final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  	final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

	final AuthCredential credential = GoogleAuthProvider.getCredential
	(
		accessToken: googleSignInAuthentication.accessToken,
		idToken: googleSignInAuthentication.idToken,
	);

	final AuthResult authResult = await _auth.signInWithCredential(credential);
	final FirebaseUser user = authResult.user;

	assert(!user.isAnonymous);
	assert(await user.getIdToken() != null);

	final FirebaseUser currentUser = await _auth.currentUser();
	assert(user.uid == currentUser.uid);

  	return 'signInWithGoogle succeeded: $user';
}

Future<int> signOutGoogle() async
{
	await googleSignIn.signOut();
	return(0);
}

Future signInWithFacebook() async
{
	FacebookLoginResult facebookLoginResult = await facebookLogin.logIn(['email','public_profile']);
	print(facebookLoginResult.status);
	print(facebookLoginResult.errorMessage);

	final accessToken = facebookLoginResult.accessToken.token;

	print(accessToken);

	if (facebookLoginResult.status == FacebookLoginStatus.loggedIn)
	{
		print("Login Success!");
		final facebookAuthCred = FacebookAuthProvider.getCredential(accessToken: accessToken);
		final user = await _auth.signInWithCredential(facebookAuthCred);
		print(user);
		return 1;
	}
	else
	{
		print("Login Error!");
		return(0);
	}
}

Future<int> signOutFacebook() async
{
	await facebookLogin.logOut();
	return(0);
}