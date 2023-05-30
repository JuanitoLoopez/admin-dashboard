import 'package:flutter/material.dart';
import 'package:login_dashboard/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

import 'package:login_dashboard/providers/login_form_provider.dart';
import 'package:login_dashboard/router/router.dart';
import 'package:login_dashboard/ui/inputs/custom_inputs.dart';
import 'package:login_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:login_dashboard/ui/buttons/link_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(
        builder: (context) {

          final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);

          return Container(
            margin: const EdgeInsets.only(top: 100, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: loginFormProvider.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                  
                        // Email
                        const SizedBox(height: 15),
                        TextFormField(
                          validator: (value) {
                            if(value == null || value.isEmpty) return 'Ingrese su email';
                            if(!EmailValidator.validate(value)) return 'El correo no es valido';
                            return null; // Es valido
                          },
                          onChanged: (value) => loginFormProvider.email = value,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.authInputDecoration(
                            hint: 'Ingrese su correo electronico',
                            label: 'Email',
                            icon: Icons.email_outlined
                          ),
                        ),
                  
                        // Password
                        const SizedBox(height: 15),
                        TextFormField(
                          validator: (value) {
                            if(value == null || value.isEmpty) return 'Ingrese su contraseña';
                            if(value.length < 6) return 'La contraseña debe ser de al menos 6 caracteres';
                            return null; // Es valido
                          },
                          onChanged: (value) => loginFormProvider.password = value,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.authInputDecoration(
                            hint: 'Ingrese su contraseña',
                            label: 'Contraseña',
                            icon: Icons.lock_outline
                          ),
                        ),
                  
                        const SizedBox(height: 15),
                        CustomOutlinedButton(
                          onPressed: () {
                            final isValid = loginFormProvider.validateForm();
                            if(isValid) authProvider.login(loginFormProvider.email, loginFormProvider.password);
                          }, 
                          text: 'Ingresar',
                        ),
                          
                        const SizedBox(height: 15),
                        LinkText(
                          text: 'Nueva cuenta', 
                          onPressed: () {
                            Navigator.pushNamed(context, Flurorouter.registerRoute);
                          },
                        ),
                        
                      ],
                    ),
                  )
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}