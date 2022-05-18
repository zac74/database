final String tablePropertys = 'property';

class PropertyFields {
  static final List<String> values = [
    /// Add all fields
    id, Title, Details, PhoneNumber, Location, Bedroom, Bathroom, Area, Price,
  ];

  static final String id = '_id';
  static final String Title = 'Title';
  static final String Details = 'Details';
  static final String PhoneNumber = 'PhoneNumber';
  static final String Location = 'Location';
  static final String Bedroom = 'Bedroom';
  static final String Bathroom = 'Bathroom';
  static final String Area = 'Area';
  static final String Price = 'Price';
  static final String Img = 'Img';
}

class Property {
  final int? id;
  final String Title;
  final String Details;
  final String PhoneNumber;
  final String Location;
  final int? Bedroom;
  final int? Bathroom;
  final int? Area;
  final int? Price;

  const Property({
    this.id,
    required this.Title,
    required this.Details,
    required this.PhoneNumber,
    required this.Location,
    required this.Bedroom,
    required this.Bathroom,
    required this.Area,
    required this.Price,
  });

  Property copy({
    final int? id,
    final String? Title,
    final String? Details,
    final String? PhoneNumber,
    final String? Location,
    final int? Bedroom,
    final int? Bathroom,
    final int? Area,
    final int? Price,
  }) =>
      Property(
        id: id ?? this.id,
        Title: Title ?? this.Title,
        Details: Details ?? this.Details,
        PhoneNumber: PhoneNumber ?? this.PhoneNumber,
        Location: Location ?? this.Location,
        Bedroom: Bedroom ?? this.Bedroom,
        Bathroom: Bathroom ?? this.Bathroom,
        Area: Area ?? this.Area,
        Price: Price ?? this.Price,
      );

  static Property fromJson(Map<String, Object?> json) => Property(
        id: json[PropertyFields.id] as int?,
        Title: json[PropertyFields.Title] as String,
        Details: json[PropertyFields.Details] as String,
        PhoneNumber: json[PropertyFields.PhoneNumber] as String,
        Location: json[PropertyFields.Location] as String,
        Bedroom: json[PropertyFields.Bedroom] as int,
        Bathroom: json[PropertyFields.Bathroom] as int,
        Area: json[PropertyFields.Area] as int,
        Price: json[PropertyFields.Price] as int,
      );

  Map<String, Object?> toJson() => {
        PropertyFields.id: id,
        PropertyFields.Title: Title,
        PropertyFields.Details: Details,
        PropertyFields.PhoneNumber: PhoneNumber,
        PropertyFields.Location: Location,
        PropertyFields.Bedroom: Bedroom,
        PropertyFields.Bathroom: Bathroom,
        PropertyFields.Area: Area,
        PropertyFields.Price: Price,
      };
}
