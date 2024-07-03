import 'package:form_validator/form_validator.dart';

final courseRequirementValidator =
    ValidationBuilder(requiredMessage: 'Course requirement is required')
        .maxLength(999)
        .minLength(5)
        .required()
        .build();
