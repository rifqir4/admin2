class Validator {
  static String cannotEmpty(String text) {
    if (text == null || text == "") return "Form cannot be empty";
    return null;
  }
}
