class CharacterConverter {
  String convertChars(String text) {
    List<String> turkishChars = [
      'ı',
      'ğ',
      'İ',
      'Ğ',
      'ç',
      'Ç',
      'ş',
      'Ş',
      'ö',
      'Ö',
      'ü',
      'Ü',
    ];
    List<String> englishChars = [
      'i',
      'g',
      'I',
      'G',
      'c',
      'C',
      's',
      'S',
      'o',
      'O',
      'u',
      'U'
    ];

    for (int i = 0; i < turkishChars.length; i++) {
      text = text.replaceAll(turkishChars[i], englishChars[i]);
    }
    return text;
  }
}
