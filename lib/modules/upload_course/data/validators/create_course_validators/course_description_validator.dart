import 'package:form_validator/form_validator.dart';

final courseDescriptionValidator =
    ValidationBuilder(requiredMessage: 'Course description is required')
        .maxLength(1000)
        .minLength(5)
        .required()
        .build();
