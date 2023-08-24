class PokemonsState {
  bool loading;
  bool loaded;
  List items;
  int count;
  PokemonsState({
    this.loading = true,
    this.loaded = false,
    this.items = const [],
    this.count = 0,
  });

  PokemonsState copyWith({
    bool? loading,
    bool? loaded,
    List? items,
    int? count,
  }) {
    return PokemonsState(
      loading: loading ?? this.loading,
      loaded: loaded ?? this.loaded,
      items: items ?? this.items,
      count: count ?? this.count,
    );
  }

  bool get thereMore => items.length < count;
}
