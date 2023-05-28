import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

import 'package:login_dashboard/providers/register_form_provider.dart';
import 'package:login_dashboard/router/router.dart';
import 'package:login_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:login_dashboard/ui/buttons/link_text.dart';
import 'package:login_dashboard/ui/inputs/custom_inputs.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(
        builder: (context) {
          
          final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);
    
          return Container(
            margin: const EdgeInsets.only(top: 80, bottom: 15),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: registerFormProvider.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                  
                        // Nombre
                        const SizedBox(height: 15),
                        TextFormField(
                          validator: (value) {
                            if(value == null || value.isEmpty) return 'Ingrese su nombre';
                            return null; // Es valido
                          },
                          onChanged: (value) => registerFormProvider.name = value,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.authInputDecoration(
                            hint: 'Ingrese su nombre',
                            label: 'Nombre',
                            icon: Icons.supervised_user_circle,
                          ),
                        ),
                  
                        // Email
                        const SizedBox(height: 15),
                        TextFormField(
                          validator: (value) {
                            if(value == null || value.isEmpty) return 'Ingrese su email';
                            if(!EmailValidator.validate(value)) return 'El correo no es valido';
                            return null; // Es valido
                          },
                          onChanged: (value) => registerFormProvider.email = value,
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
                          onChanged: (value) => registerFormProvider.password = value,
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
                            registerFormProvider.validateForm();
                          }, 
                          text: 'Crear cuenta',
                        ),
                      
                        const SizedBox(height: 15),
                        LinkText(
                          text: 'Ingresar', 
                          onPressed: () {
                            Navigator.pushNamed(context, Flurorouter.loginRoute);
                          },
                        ),

                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}