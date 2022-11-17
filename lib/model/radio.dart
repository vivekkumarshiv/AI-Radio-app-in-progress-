// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class MyRadiosList {
  final List<myRadio> radios;
  MyRadiosList({
    required this.radios,
  });

  MyRadiosList copyWith({
    List<myRadio>? radios,
  }) {
    return MyRadiosList(
      radios: radios ?? this.radios,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'radios': radios.map((x) => x.toMap()).toList(),
    };
  }

  factory MyRadiosList.fromMap(Map<String, dynamic> map) {
    return MyRadiosList(
      radios: List<myRadio>.from(
        (map['radios'] as List<int>).map<myRadio>(
          (x) => myRadio.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyRadiosList.fromJson(String source) =>
      MyRadiosList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MyRadiosList(radios: $radios)';

  @override
  bool operator ==(covariant MyRadiosList other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return listEquals(other.radios, radios);
  }

  @override
  int get hashCode => radios.hashCode;
}

// ignore: camel_case_types
class myRadio {
  final int id;
  final int order;
  final String name;
  final String tagline;
  final String color;
  final String desc;
  final String url;
  final String category;
  final String icon;
  final String image;
  final String lang;
  myRadio({
    required this.id,
    required this.order,
    required this.name,
    required this.tagline,
    required this.color,
    required this.desc,
    required this.url,
    required this.category,
    required this.icon,
    required this.image,
    required this.lang,
  });

  myRadio copyWith({
    int? id,
    int? order,
    String? name,
    String? tagline,
    String? color,
    String? desc,
    String? url,
    String? category,
    String? icon,
    String? image,
    String? lang,
  }) {
    return myRadio(
      id: id ?? this.id,
      order: order ?? this.order,
      name: name ?? this.name,
      tagline: tagline ?? this.tagline,
      color: color ?? this.color,
      desc: desc ?? this.desc,
      url: url ?? this.url,
      category: category ?? this.category,
      icon: icon ?? this.icon,
      image: image ?? this.image,
      lang: lang ?? this.lang,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order': order,
      'name': name,
      'tagline': tagline,
      'color': color,
      'desc': desc,
      'url': url,
      'category': category,
      'icon': icon,
      'image': image,
      'lang': lang,
    };
  }

  factory myRadio.fromMap(Map<String, dynamic> map) {
    return myRadio(
      id: map['id'] as int,
      order: map['order'] as int,
      name: map['name'] as String,
      tagline: map['tagline'] as String,
      color: map['color'] as String,
      desc: map['desc'] as String,
      url: map['url'] as String,
      category: map['category'] as String,
      icon: map['icon'] as String,
      image: map['image'] as String,
      lang: map['lang'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory myRadio.fromJson(String source) =>
      myRadio.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'myRadio(id: $id, order: $order, name: $name, tagline: $tagline, color: $color, desc: $desc, url: $url, category: $category, icon: $icon, image: $image, lang: $lang)';
  }

  @override
  bool operator ==(covariant myRadio other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.order == order &&
        other.name == name &&
        other.tagline == tagline &&
        other.color == color &&
        other.desc == desc &&
        other.url == url &&
        other.category == category &&
        other.icon == icon &&
        other.image == image &&
        other.lang == lang;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        order.hashCode ^
        name.hashCode ^
        tagline.hashCode ^
        color.hashCode ^
        desc.hashCode ^
        url.hashCode ^
        category.hashCode ^
        icon.hashCode ^
        image.hashCode ^
        lang.hashCode;
  }
}
