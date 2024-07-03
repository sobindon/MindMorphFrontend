import 'package:form_validator/form_validator.dart';

const minPrice = 10;
const maxPrice = 10000;

final coursePriceValidator =
    ValidationBuilder(requiredMessage: 'Course price is required')
        .add(ensurePriceRange)
        .required()
        .build();

String? ensurePriceRange(String? value) {
  if (value == null || value.isEmpty) {
    return 'Price cannot be empty';
  }

  // Try to parse the value as an integer
  final double? number = double.tryParse(value);
  if (number == null) {
    return 'Price must be a valid number';
  }
  // Check if the number is within the range 10 to 999
  if (number < minPrice || maxPrice > 999) {
    return 'Price must be between $minPrice and $maxPrice';
  }

  return null; // The input is valid
}
