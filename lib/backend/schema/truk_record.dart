import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'truk_record.g.dart';

abstract class TrukRecord implements Built<TrukRecord, TrukRecordBuilder> {
  static Serializer<TrukRecord> get serializer => _$trukRecordSerializer;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TrukRecordBuilder builder) =>
      builder..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Truk');

  static Stream<TrukRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TrukRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TrukRecord._();
  factory TrukRecord([void Function(TrukRecordBuilder) updates]) = _$TrukRecord;

  static TrukRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTrukRecordData({
  String name,
}) =>
    serializers.toFirestore(
        TrukRecord.serializer, TrukRecord((t) => t..name = name));
