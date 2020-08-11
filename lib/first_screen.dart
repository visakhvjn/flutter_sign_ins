import 'package:flutter/material.dart';
import 'package:sign_in_flutter/login_page.dart';
import 'package:sign_in_flutter/sign_in.dart';

class FirstScreen extends StatelessWidget
{
	@override
	Widget build(BuildContext context) 
	{
		return Scaffold
		(
			body: Container
			(
				width: double.infinity,
				color: Colors.white,
				child: Column
				(
					children:
					[
						Padding(padding: EdgeInsets.all(200)),
						OutlineButton
						(
							onPressed: ()
							{
								signOutGoogle().whenComplete(()
								{
									Navigator.of(context).push(MaterialPageRoute(builder: (context) {return LoginPage();}));
								});
							},
							child: Padding
							(
								padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
								child: Row
								(
									mainAxisSize: MainAxisSize.min,
									mainAxisAlignment: MainAxisAlignment.center,
									children: <Widget>
									[
										// Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
										Padding
										(
											padding: const EdgeInsets.only(left: 10),
											child: Text
											(
												'Sign Out Google',
												style: TextStyle(fontSize: 20, color: Colors.grey),
											),
										)
									],
								),
							),
						),
						OutlineButton
						(
							onPressed: ()
							{
								signOutFacebook().whenComplete(()
								{
									Navigator.of(context).push(MaterialPageRoute(builder: (context) {return LoginPage();}));
								});
							},
							child: Padding
							(
								padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
								child: Row
								(
									mainAxisSize: MainAxisSize.min,
									mainAxisAlignment: MainAxisAlignment.center,
									children: <Widget>
									[
										// Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
										Padding
										(
											padding: const EdgeInsets.only(left: 10),
											child: Text
											(
												'Sign Out Facebook',
												style: TextStyle(fontSize: 20, color: Colors.grey),
											),
										)
									],
								),
							),
						)
					]
				),
			),
		);
	}
}