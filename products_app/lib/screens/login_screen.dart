import 'package:flutter/material.dart';
import 'package:products_app/services/services.dart';
import 'package:provider/provider.dart';

import 'package:products_app/ui/input_decorarions.dart';
import 'package:products_app/widgets/widgets.dart';
import 'package:products_app/providers/login_form_provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 250),
            CardContainer(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text('Sign In', style: Theme.of(context).textTheme.headline5),
                  const SizedBox(height: 30),
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: _LoginForm(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'register'),
              child: const Text('Crear una nueva cuenta',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 50),
          ],
        ),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        //TODO: MANTENER LA REFERENCIA AL KEY
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: "joe.contoso@email.com",
                  labelText: 'Email',
                  prefixIcon: Icons.alternate_email_sharp),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no luce como un correo electrónico';
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: "******",
                labelText: 'Password',
                prefixIcon: Icons.lock_outline,
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'La contraseña debe ser contener al menos 6 caracteres.';
              },
            ),
            const SizedBox(height: 30),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    loginForm.isLoading ? 'Loading...' : 'Login',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();
                        final authService =
                            Provider.of<AuthService>(context, listen: false);
                        if (!loginForm.isValidadForm()) return;
                        loginForm.isLoading = true;
                        //TODO: validar si el login es correcto
                        final String? errorMessage = await authService.login(
                            loginForm.email, loginForm.password);
                        if (errorMessage == null) {
                          Navigator.pushReplacementNamed(context, 'home');
                        } else {
                          //MOSTRAR ERROR EN PANTALLA
                          NotificationsService.showSnackbar(errorMessage);
                          print(errorMessage);
                          loginForm.isLoading = false;
                        }
                      })
          ],
        ),
      ),
    );
  }
}
