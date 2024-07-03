import 'package:form_validator/form_validator.dart';

final courseObjectiveValidator =
    ValidationBuilder(requiredMessage: 'Course objective is required')
        .maxLength(1000)
        .minLength(5)
        .required()
        .build();
