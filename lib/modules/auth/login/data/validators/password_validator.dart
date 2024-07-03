import 'package:form_validator/form_validator.dart';

final passwordValidator = ValidationBuilder(
        requiredMessage: 'Password is required')
    .minLength(8)
    .maxLength(30)
    .regExp(RegExp(r'^(?=.*[A-Z])'),
        'Password must contain at least one uppercase letter')
    .regExp(RegExp(r'^(?=.*\d)'), 'Password must contain at least one number')
    .regExp(RegExp(r'^(?=.*[@!#\$&*~])'),
        'Password must contain at least one special character')
    .regExp(RegExp(r'^(?=.*[a-z])'),
        'Password must contain at least one lowercase letter')
    .build();
