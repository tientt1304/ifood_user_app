final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

final RegExp phoneNumberValidatorRegExp =
    RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');

const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Please enter valid email";

const String kPassNullError = "Please enter your password";
const String kRePassNullError = "Please re-enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Password don't match";

const String kNamelNullError = "Please enter your name";
const String kInvalidPhoneNummberError = "Please enter valid phone number";
const String kPhoneNumberNullError = "Please enter your phone number";

const String kAddressNullError = "Please enter your address";
