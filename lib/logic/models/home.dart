class HomeState {
  String nameText;
  HomeState({
    this.nameText = '',
  });

  HomeState copyWith({
    String? nameText,
  }) {
    return HomeState(
      nameText: nameText ?? this.nameText,
    );
  }
}
