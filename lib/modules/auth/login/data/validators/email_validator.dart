import 'package:form_validator/form_validator.dart';

final emailValidator = ValidationBuilder(requiredMessage: 'Email is required')
    .email()
    .required()
    .build();
