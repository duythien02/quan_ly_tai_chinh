class SingletonDialogParams {
  SingletonDialogParams({this.title = '', this.onPressOK, this.isPop = true});

  final String title;
  final Function()? onPressOK;
  final bool isPop;
}
