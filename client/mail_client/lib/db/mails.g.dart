// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mails.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMailCollection on Isar {
  IsarCollection<Mail> get mails => this.collection();
}

const MailSchema = CollectionSchema(
  name: r'Mail',
  id: -4351807803424943458,
  properties: {
    r'animation': PropertySchema(
      id: 0,
      name: r'animation',
      type: IsarType.bool,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.string,
    ),
    r'from': PropertySchema(
      id: 2,
      name: r'from',
      type: IsarType.string,
    ),
    r'head': PropertySchema(
      id: 3,
      name: r'head',
      type: IsarType.string,
    ),
    r'letter': PropertySchema(
      id: 4,
      name: r'letter',
      type: IsarType.string,
    )
  },
  estimateSize: _mailEstimateSize,
  serialize: _mailSerialize,
  deserialize: _mailDeserialize,
  deserializeProp: _mailDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _mailGetId,
  getLinks: _mailGetLinks,
  attach: _mailAttach,
  version: '3.1.0+1',
);

int _mailEstimateSize(
  Mail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.date;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.from;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.head;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.letter;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _mailSerialize(
  Mail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.animation);
  writer.writeString(offsets[1], object.date);
  writer.writeString(offsets[2], object.from);
  writer.writeString(offsets[3], object.head);
  writer.writeString(offsets[4], object.letter);
}

Mail _mailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Mail();
  object.animation = reader.readBool(offsets[0]);
  object.date = reader.readStringOrNull(offsets[1]);
  object.from = reader.readStringOrNull(offsets[2]);
  object.head = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.letter = reader.readStringOrNull(offsets[4]);
  return object;
}

P _mailDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mailGetId(Mail object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mailGetLinks(Mail object) {
  return [];
}

void _mailAttach(IsarCollection<dynamic> col, Id id, Mail object) {
  object.id = id;
}

extension MailQueryWhereSort on QueryBuilder<Mail, Mail, QWhere> {
  QueryBuilder<Mail, Mail, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MailQueryWhere on QueryBuilder<Mail, Mail, QWhereClause> {
  QueryBuilder<Mail, Mail, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Mail, Mail, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Mail, Mail, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Mail, Mail, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MailQueryFilter on QueryBuilder<Mail, Mail, QFilterCondition> {
  QueryBuilder<Mail, Mail, QAfterFilterCondition> animationEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'animation',
        value: value,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> dateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> dateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> dateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> dateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> dateContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> dateMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> fromIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'from',
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> fromIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'from',
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> fromEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'from',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> fromGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'from',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> fromLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'from',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> fromBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'from',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> fromStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'from',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> fromEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'from',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> fromContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'from',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> fromMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'from',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> fromIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'from',
        value: '',
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> fromIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'from',
        value: '',
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> headIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'head',
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> headIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'head',
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> headEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'head',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> headGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'head',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> headLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'head',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> headBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'head',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> headStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'head',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> headEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'head',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> headContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'head',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> headMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'head',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> headIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'head',
        value: '',
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> headIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'head',
        value: '',
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> letterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'letter',
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> letterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'letter',
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> letterEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'letter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> letterGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'letter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> letterLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'letter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> letterBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'letter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> letterStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'letter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> letterEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'letter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> letterContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'letter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> letterMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'letter',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> letterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'letter',
        value: '',
      ));
    });
  }

  QueryBuilder<Mail, Mail, QAfterFilterCondition> letterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'letter',
        value: '',
      ));
    });
  }
}

extension MailQueryObject on QueryBuilder<Mail, Mail, QFilterCondition> {}

extension MailQueryLinks on QueryBuilder<Mail, Mail, QFilterCondition> {}

extension MailQuerySortBy on QueryBuilder<Mail, Mail, QSortBy> {
  QueryBuilder<Mail, Mail, QAfterSortBy> sortByAnimation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'animation', Sort.asc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> sortByAnimationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'animation', Sort.desc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> sortByFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'from', Sort.asc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> sortByFromDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'from', Sort.desc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> sortByHead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'head', Sort.asc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> sortByHeadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'head', Sort.desc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> sortByLetter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'letter', Sort.asc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> sortByLetterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'letter', Sort.desc);
    });
  }
}

extension MailQuerySortThenBy on QueryBuilder<Mail, Mail, QSortThenBy> {
  QueryBuilder<Mail, Mail, QAfterSortBy> thenByAnimation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'animation', Sort.asc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> thenByAnimationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'animation', Sort.desc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> thenByFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'from', Sort.asc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> thenByFromDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'from', Sort.desc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> thenByHead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'head', Sort.asc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> thenByHeadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'head', Sort.desc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> thenByLetter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'letter', Sort.asc);
    });
  }

  QueryBuilder<Mail, Mail, QAfterSortBy> thenByLetterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'letter', Sort.desc);
    });
  }
}

extension MailQueryWhereDistinct on QueryBuilder<Mail, Mail, QDistinct> {
  QueryBuilder<Mail, Mail, QDistinct> distinctByAnimation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'animation');
    });
  }

  QueryBuilder<Mail, Mail, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mail, Mail, QDistinct> distinctByFrom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'from', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mail, Mail, QDistinct> distinctByHead(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'head', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mail, Mail, QDistinct> distinctByLetter(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'letter', caseSensitive: caseSensitive);
    });
  }
}

extension MailQueryProperty on QueryBuilder<Mail, Mail, QQueryProperty> {
  QueryBuilder<Mail, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Mail, bool, QQueryOperations> animationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'animation');
    });
  }

  QueryBuilder<Mail, String?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Mail, String?, QQueryOperations> fromProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'from');
    });
  }

  QueryBuilder<Mail, String?, QQueryOperations> headProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'head');
    });
  }

  QueryBuilder<Mail, String?, QQueryOperations> letterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'letter');
    });
  }
}
