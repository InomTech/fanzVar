abstract class RegisterStates {}

class Initial extends RegisterStates {}

class IsLoading extends RegisterStates {}

class RegisterError extends RegisterStates {
  final String error;
  RegisterError(this.error);
}

class TogglePassword extends RegisterStates {}

class ImagePicked extends RegisterStates {}

class RetailImagePicked extends RegisterStates {}

class ImageUpload extends RegisterStates {}

class RetailImageUpload extends RegisterStates {}

class Select extends RegisterStates {}

class RegisterSuccess extends RegisterStates {
  final String userName;
  RegisterSuccess(this.userName);
}

class ValidateFormState extends RegisterStates {}

class ChangeImageBorderColortobeTranspeternt extends RegisterStates {}
