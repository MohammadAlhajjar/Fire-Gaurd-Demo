// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';



import 'fire_brigade_model.dart';
import 'fire_model.dart';

class FireTask{
  final Fire? fire;
  final FireBrigade? fireBrigade;
  final int? id;
  final String? note;
  final String? createdAt;
  final String? updatedAt;
  FireTask({
    this.fire,
    this.fireBrigade,
    this.id,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  FireTask copyWith({
    Fire? fire,
    FireBrigade? fireBrigade,
    int? id,
    String? note,
    String? createdAt,
    String? updatedAt,
  }) {
    return FireTask(
      fire: fire ?? this.fire,
      fireBrigade: fireBrigade ?? this.fireBrigade,
      id: id ?? this.id,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fire': fire?.toMap(),
      'fireBrigade': fireBrigade?.toMap(),
      'id': id,
      'note': note,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory FireTask.fromMap(Map<String, dynamic> map) {
    return FireTask(
      fire: map['fire'] != null ? Fire.fromMap(map['fire'] as Map<String,dynamic>) : null,
      fireBrigade: map['fireBrigade'] != null ? FireBrigade.fromMap(map['fireBrigade'] as Map<String,dynamic>) : null,
      id: map['id'] != null ? map['id'] as int : null,
      note: map['note'] != null ? map['note'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FireTask.fromJson(String source) => FireTask.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Items(fire: $fire, fireBrigade: $fireBrigade, id: $id, note: $note, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant FireTask other) {
    if (identical(this, other)) return true;
  
    return 
      other.fire == fire &&
      other.fireBrigade == fireBrigade &&
      other.id == id &&
      other.note == note &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return fire.hashCode ^
      fireBrigade.hashCode ^
      id.hashCode ^
      note.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
  }

  
}