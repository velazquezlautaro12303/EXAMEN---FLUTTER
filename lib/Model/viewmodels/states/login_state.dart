enum Estado {
  signIn,
  register,
}

class LoginState {
  final Estado estado;
  final String descriptionLink;
  final String nameLink;
  final bool holdSession;
  final String titleButton;

  LoginState({
    required this.titleButton,
    required this.holdSession,
    required this.estado,
    required this.descriptionLink,
    required this.nameLink,
  });

  LoginState copyWith({
    String? descriptionLink,
    String? nameLink,
    Estado? estado,
    bool? holdSession,
    String? titleButton,
  }) {
    return LoginState(
      descriptionLink: descriptionLink ?? this.descriptionLink,
      nameLink: nameLink ?? this.nameLink,
      estado: estado ?? this.estado,
      holdSession: holdSession ?? this.holdSession,
      titleButton: titleButton ?? this.titleButton,
    );
  }
}
