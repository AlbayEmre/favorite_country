class Ulke {
  Flags? flags;
  Name? name;
  String? cca2;
  List<String>? capital;
  String? region;
  Languages? languages;
  int? population;
  bool? favorite;

  Ulke(
      {this.flags,
      this.name,
      this.cca2,
      this.capital,
      this.region,
      this.languages,
      this.population,
      this.favorite = false});

  Ulke.fromJson(Map<String, dynamic> json) {
    flags = json['flags'] != null ? new Flags.fromJson(json['flags']) : null;
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    cca2 = json['cca2'];
    favorite = json['favorite'];
    capital = json['capital'].cast<String>();
    region = json['region'];
    languages = json['languages'] != null ? new Languages.fromJson(json['languages']) : null;
    population = json['population'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.flags != null) {
      data['flags'] = this.flags!.toJson();
    }
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['cca2'] = this.cca2;
    data['favorite'] = this.favorite;
    data['capital'] = this.capital;
    data['region'] = this.region;
    if (this.languages != null) {
      data['languages'] = this.languages!.toJson();
    }
    data['population'] = this.population;
    return data;
  }
}

class Flags {
  String? png;
  String? svg;
  String? alt;

  Flags({this.png, this.svg, this.alt});

  Flags.fromJson(Map<String, dynamic> json) {
    png = json['png'];
    svg = json['svg'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['png'] = this.png;
    data['svg'] = this.svg;
    data['alt'] = this.alt;
    return data;
  }
}

class Name {
  String? common;
  String? official;
  NativeName? nativeName;

  Name({this.common, this.official, this.nativeName});

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
    nativeName = json['nativeName'] != null ? new NativeName.fromJson(json['nativeName']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['common'] = this.common;
    data['official'] = this.official;
    if (this.nativeName != null) {
      data['nativeName'] = this.nativeName!.toJson();
    }
    return data;
  }
}

class NativeName {
  Ron? ron;

  NativeName({this.ron});

  NativeName.fromJson(Map<String, dynamic> json) {
    ron = json['ron'] != null ? new Ron.fromJson(json['ron']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ron != null) {
      data['ron'] = this.ron!.toJson();
    }
    return data;
  }
}

class Ron {
  String? official;
  String? common;

  Ron({this.official, this.common});

  Ron.fromJson(Map<String, dynamic> json) {
    official = json['official'];
    common = json['common'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['official'] = this.official;
    data['common'] = this.common;
    return data;
  }
}

class Languages {
  String? ron;

  Languages({this.ron});

  Languages.fromJson(Map<String, dynamic> json) {
    ron = json['ron'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ron'] = this.ron;
    return data;
  }
}
