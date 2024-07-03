import 'package:form_validator/form_validator.dart';

final courseTitleValidator =
    ValidationBuilder(requiredMessage: 'Course title is required')
        .maxLength(50)
        .minLength(10)
        .required()
        .build();
