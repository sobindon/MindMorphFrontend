import 'package:form_validator/form_validator.dart';

final titleValidator = ValidationBuilder(requiredMessage: 'Title is required')
    .maxLength(50)
    .minLength(10)
    .required()
    .build();
