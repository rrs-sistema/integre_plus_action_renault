// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ConhecimentotecnicosTable extends Conhecimentotecnicos
    with TableInfo<$ConhecimentotecnicosTable, Conhecimentotecnico> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConhecimentotecnicosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _conhecimentoidMeta =
      const VerificationMeta('conhecimentoid');
  @override
  late final GeneratedColumn<int> conhecimentoid = GeneratedColumn<int>(
      'conhecimentoid', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _colaboradoridMeta =
      const VerificationMeta('colaboradorid');
  @override
  late final GeneratedColumn<int> colaboradorid = GeneratedColumn<int>(
      'colaboradorid', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _descricaoconhecimentoMeta =
      const VerificationMeta('descricaoconhecimento');
  @override
  late final GeneratedColumn<String> descricaoconhecimento =
      GeneratedColumn<String>('descricaoconhecimento', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 200),
          type: DriftSqlType.string,
          requiredDuringInsert: false);
  static const VerificationMeta _nivelconhecimentoMeta =
      const VerificationMeta('nivelconhecimento');
  @override
  late final GeneratedColumn<String> nivelconhecimento =
      GeneratedColumn<String>('nivelconhecimento', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 50),
          type: DriftSqlType.string,
          requiredDuringInsert: false);
  static const VerificationMeta _dataavaliacaoMeta =
      const VerificationMeta('dataavaliacao');
  @override
  late final GeneratedColumn<DateTime> dataavaliacao =
      GeneratedColumn<DateTime>('dataavaliacao', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        conhecimentoid,
        colaboradorid,
        descricaoconhecimento,
        nivelconhecimento,
        dataavaliacao
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'conhecimentotecnico';
  @override
  VerificationContext validateIntegrity(
      Insertable<Conhecimentotecnico> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('conhecimentoid')) {
      context.handle(
          _conhecimentoidMeta,
          conhecimentoid.isAcceptableOrUnknown(
              data['conhecimentoid']!, _conhecimentoidMeta));
    }
    if (data.containsKey('colaboradorid')) {
      context.handle(
          _colaboradoridMeta,
          colaboradorid.isAcceptableOrUnknown(
              data['colaboradorid']!, _colaboradoridMeta));
    }
    if (data.containsKey('descricaoconhecimento')) {
      context.handle(
          _descricaoconhecimentoMeta,
          descricaoconhecimento.isAcceptableOrUnknown(
              data['descricaoconhecimento']!, _descricaoconhecimentoMeta));
    }
    if (data.containsKey('nivelconhecimento')) {
      context.handle(
          _nivelconhecimentoMeta,
          nivelconhecimento.isAcceptableOrUnknown(
              data['nivelconhecimento']!, _nivelconhecimentoMeta));
    }
    if (data.containsKey('dataavaliacao')) {
      context.handle(
          _dataavaliacaoMeta,
          dataavaliacao.isAcceptableOrUnknown(
              data['dataavaliacao']!, _dataavaliacaoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {conhecimentoid};
  @override
  Conhecimentotecnico map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Conhecimentotecnico(
      conhecimentoid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}conhecimentoid']),
      colaboradorid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}colaboradorid']),
      descricaoconhecimento: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}descricaoconhecimento']),
      nivelconhecimento: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}nivelconhecimento']),
      dataavaliacao: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dataavaliacao']),
    );
  }

  @override
  $ConhecimentotecnicosTable createAlias(String alias) {
    return $ConhecimentotecnicosTable(attachedDatabase, alias);
  }
}

class Conhecimentotecnico extends DataClass
    implements Insertable<Conhecimentotecnico> {
  final int? conhecimentoid;
  final int? colaboradorid;
  final String? descricaoconhecimento;
  final String? nivelconhecimento;
  final DateTime? dataavaliacao;
  const Conhecimentotecnico(
      {this.conhecimentoid,
      this.colaboradorid,
      this.descricaoconhecimento,
      this.nivelconhecimento,
      this.dataavaliacao});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || conhecimentoid != null) {
      map['conhecimentoid'] = Variable<int>(conhecimentoid);
    }
    if (!nullToAbsent || colaboradorid != null) {
      map['colaboradorid'] = Variable<int>(colaboradorid);
    }
    if (!nullToAbsent || descricaoconhecimento != null) {
      map['descricaoconhecimento'] = Variable<String>(descricaoconhecimento);
    }
    if (!nullToAbsent || nivelconhecimento != null) {
      map['nivelconhecimento'] = Variable<String>(nivelconhecimento);
    }
    if (!nullToAbsent || dataavaliacao != null) {
      map['dataavaliacao'] = Variable<DateTime>(dataavaliacao);
    }
    return map;
  }

  factory Conhecimentotecnico.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Conhecimentotecnico(
      conhecimentoid: serializer.fromJson<int?>(json['conhecimentoid']),
      colaboradorid: serializer.fromJson<int?>(json['colaboradorid']),
      descricaoconhecimento:
          serializer.fromJson<String?>(json['descricaoconhecimento']),
      nivelconhecimento:
          serializer.fromJson<String?>(json['nivelconhecimento']),
      dataavaliacao: serializer.fromJson<DateTime?>(json['dataavaliacao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'conhecimentoid': serializer.toJson<int?>(conhecimentoid),
      'colaboradorid': serializer.toJson<int?>(colaboradorid),
      'descricaoconhecimento':
          serializer.toJson<String?>(descricaoconhecimento),
      'nivelconhecimento': serializer.toJson<String?>(nivelconhecimento),
      'dataavaliacao': serializer.toJson<DateTime?>(dataavaliacao),
    };
  }

  Conhecimentotecnico copyWith(
          {Value<int?> conhecimentoid = const Value.absent(),
          Value<int?> colaboradorid = const Value.absent(),
          Value<String?> descricaoconhecimento = const Value.absent(),
          Value<String?> nivelconhecimento = const Value.absent(),
          Value<DateTime?> dataavaliacao = const Value.absent()}) =>
      Conhecimentotecnico(
        conhecimentoid:
            conhecimentoid.present ? conhecimentoid.value : this.conhecimentoid,
        colaboradorid:
            colaboradorid.present ? colaboradorid.value : this.colaboradorid,
        descricaoconhecimento: descricaoconhecimento.present
            ? descricaoconhecimento.value
            : this.descricaoconhecimento,
        nivelconhecimento: nivelconhecimento.present
            ? nivelconhecimento.value
            : this.nivelconhecimento,
        dataavaliacao:
            dataavaliacao.present ? dataavaliacao.value : this.dataavaliacao,
      );
  Conhecimentotecnico copyWithCompanion(ConhecimentotecnicosCompanion data) {
    return Conhecimentotecnico(
      conhecimentoid: data.conhecimentoid.present
          ? data.conhecimentoid.value
          : this.conhecimentoid,
      colaboradorid: data.colaboradorid.present
          ? data.colaboradorid.value
          : this.colaboradorid,
      descricaoconhecimento: data.descricaoconhecimento.present
          ? data.descricaoconhecimento.value
          : this.descricaoconhecimento,
      nivelconhecimento: data.nivelconhecimento.present
          ? data.nivelconhecimento.value
          : this.nivelconhecimento,
      dataavaliacao: data.dataavaliacao.present
          ? data.dataavaliacao.value
          : this.dataavaliacao,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Conhecimentotecnico(')
          ..write('conhecimentoid: $conhecimentoid, ')
          ..write('colaboradorid: $colaboradorid, ')
          ..write('descricaoconhecimento: $descricaoconhecimento, ')
          ..write('nivelconhecimento: $nivelconhecimento, ')
          ..write('dataavaliacao: $dataavaliacao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(conhecimentoid, colaboradorid,
      descricaoconhecimento, nivelconhecimento, dataavaliacao);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Conhecimentotecnico &&
          other.conhecimentoid == this.conhecimentoid &&
          other.colaboradorid == this.colaboradorid &&
          other.descricaoconhecimento == this.descricaoconhecimento &&
          other.nivelconhecimento == this.nivelconhecimento &&
          other.dataavaliacao == this.dataavaliacao);
}

class ConhecimentotecnicosCompanion
    extends UpdateCompanion<Conhecimentotecnico> {
  final Value<int?> conhecimentoid;
  final Value<int?> colaboradorid;
  final Value<String?> descricaoconhecimento;
  final Value<String?> nivelconhecimento;
  final Value<DateTime?> dataavaliacao;
  const ConhecimentotecnicosCompanion({
    this.conhecimentoid = const Value.absent(),
    this.colaboradorid = const Value.absent(),
    this.descricaoconhecimento = const Value.absent(),
    this.nivelconhecimento = const Value.absent(),
    this.dataavaliacao = const Value.absent(),
  });
  ConhecimentotecnicosCompanion.insert({
    this.conhecimentoid = const Value.absent(),
    this.colaboradorid = const Value.absent(),
    this.descricaoconhecimento = const Value.absent(),
    this.nivelconhecimento = const Value.absent(),
    this.dataavaliacao = const Value.absent(),
  });
  static Insertable<Conhecimentotecnico> custom({
    Expression<int>? conhecimentoid,
    Expression<int>? colaboradorid,
    Expression<String>? descricaoconhecimento,
    Expression<String>? nivelconhecimento,
    Expression<DateTime>? dataavaliacao,
  }) {
    return RawValuesInsertable({
      if (conhecimentoid != null) 'conhecimentoid': conhecimentoid,
      if (colaboradorid != null) 'colaboradorid': colaboradorid,
      if (descricaoconhecimento != null)
        'descricaoconhecimento': descricaoconhecimento,
      if (nivelconhecimento != null) 'nivelconhecimento': nivelconhecimento,
      if (dataavaliacao != null) 'dataavaliacao': dataavaliacao,
    });
  }

  ConhecimentotecnicosCompanion copyWith(
      {Value<int?>? conhecimentoid,
      Value<int?>? colaboradorid,
      Value<String?>? descricaoconhecimento,
      Value<String?>? nivelconhecimento,
      Value<DateTime?>? dataavaliacao}) {
    return ConhecimentotecnicosCompanion(
      conhecimentoid: conhecimentoid ?? this.conhecimentoid,
      colaboradorid: colaboradorid ?? this.colaboradorid,
      descricaoconhecimento:
          descricaoconhecimento ?? this.descricaoconhecimento,
      nivelconhecimento: nivelconhecimento ?? this.nivelconhecimento,
      dataavaliacao: dataavaliacao ?? this.dataavaliacao,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (conhecimentoid.present) {
      map['conhecimentoid'] = Variable<int>(conhecimentoid.value);
    }
    if (colaboradorid.present) {
      map['colaboradorid'] = Variable<int>(colaboradorid.value);
    }
    if (descricaoconhecimento.present) {
      map['descricaoconhecimento'] =
          Variable<String>(descricaoconhecimento.value);
    }
    if (nivelconhecimento.present) {
      map['nivelconhecimento'] = Variable<String>(nivelconhecimento.value);
    }
    if (dataavaliacao.present) {
      map['dataavaliacao'] = Variable<DateTime>(dataavaliacao.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConhecimentotecnicosCompanion(')
          ..write('conhecimentoid: $conhecimentoid, ')
          ..write('colaboradorid: $colaboradorid, ')
          ..write('descricaoconhecimento: $descricaoconhecimento, ')
          ..write('nivelconhecimento: $nivelconhecimento, ')
          ..write('dataavaliacao: $dataavaliacao')
          ..write(')'))
        .toString();
  }
}

class $EngajamentoproatividadesTable extends Engajamentoproatividades
    with TableInfo<$EngajamentoproatividadesTable, Engajamentoproatividade> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EngajamentoproatividadesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _engajamentoidMeta =
      const VerificationMeta('engajamentoid');
  @override
  late final GeneratedColumn<int> engajamentoid = GeneratedColumn<int>(
      'engajamentoid', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _colaboradoridMeta =
      const VerificationMeta('colaboradorid');
  @override
  late final GeneratedColumn<int> colaboradorid = GeneratedColumn<int>(
      'colaboradorid', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _pontuacaoengajamentoMeta =
      const VerificationMeta('pontuacaoengajamento');
  @override
  late final GeneratedColumn<int> pontuacaoengajamento = GeneratedColumn<int>(
      'pontuacaoengajamento', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _propostasmelhoriaMeta =
      const VerificationMeta('propostasmelhoria');
  @override
  late final GeneratedColumn<int> propostasmelhoria = GeneratedColumn<int>(
      'propostasmelhoria', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dataavaliacaoMeta =
      const VerificationMeta('dataavaliacao');
  @override
  late final GeneratedColumn<DateTime> dataavaliacao =
      GeneratedColumn<DateTime>('dataavaliacao', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        engajamentoid,
        colaboradorid,
        pontuacaoengajamento,
        propostasmelhoria,
        dataavaliacao
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'engajamentoproatividade';
  @override
  VerificationContext validateIntegrity(
      Insertable<Engajamentoproatividade> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('engajamentoid')) {
      context.handle(
          _engajamentoidMeta,
          engajamentoid.isAcceptableOrUnknown(
              data['engajamentoid']!, _engajamentoidMeta));
    }
    if (data.containsKey('colaboradorid')) {
      context.handle(
          _colaboradoridMeta,
          colaboradorid.isAcceptableOrUnknown(
              data['colaboradorid']!, _colaboradoridMeta));
    }
    if (data.containsKey('pontuacaoengajamento')) {
      context.handle(
          _pontuacaoengajamentoMeta,
          pontuacaoengajamento.isAcceptableOrUnknown(
              data['pontuacaoengajamento']!, _pontuacaoengajamentoMeta));
    }
    if (data.containsKey('propostasmelhoria')) {
      context.handle(
          _propostasmelhoriaMeta,
          propostasmelhoria.isAcceptableOrUnknown(
              data['propostasmelhoria']!, _propostasmelhoriaMeta));
    }
    if (data.containsKey('dataavaliacao')) {
      context.handle(
          _dataavaliacaoMeta,
          dataavaliacao.isAcceptableOrUnknown(
              data['dataavaliacao']!, _dataavaliacaoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {engajamentoid};
  @override
  Engajamentoproatividade map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Engajamentoproatividade(
      engajamentoid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}engajamentoid']),
      colaboradorid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}colaboradorid']),
      pontuacaoengajamento: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}pontuacaoengajamento']),
      propostasmelhoria: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}propostasmelhoria']),
      dataavaliacao: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dataavaliacao']),
    );
  }

  @override
  $EngajamentoproatividadesTable createAlias(String alias) {
    return $EngajamentoproatividadesTable(attachedDatabase, alias);
  }
}

class Engajamentoproatividade extends DataClass
    implements Insertable<Engajamentoproatividade> {
  final int? engajamentoid;
  final int? colaboradorid;
  final int? pontuacaoengajamento;
  final int? propostasmelhoria;
  final DateTime? dataavaliacao;
  const Engajamentoproatividade(
      {this.engajamentoid,
      this.colaboradorid,
      this.pontuacaoengajamento,
      this.propostasmelhoria,
      this.dataavaliacao});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || engajamentoid != null) {
      map['engajamentoid'] = Variable<int>(engajamentoid);
    }
    if (!nullToAbsent || colaboradorid != null) {
      map['colaboradorid'] = Variable<int>(colaboradorid);
    }
    if (!nullToAbsent || pontuacaoengajamento != null) {
      map['pontuacaoengajamento'] = Variable<int>(pontuacaoengajamento);
    }
    if (!nullToAbsent || propostasmelhoria != null) {
      map['propostasmelhoria'] = Variable<int>(propostasmelhoria);
    }
    if (!nullToAbsent || dataavaliacao != null) {
      map['dataavaliacao'] = Variable<DateTime>(dataavaliacao);
    }
    return map;
  }

  factory Engajamentoproatividade.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Engajamentoproatividade(
      engajamentoid: serializer.fromJson<int?>(json['engajamentoid']),
      colaboradorid: serializer.fromJson<int?>(json['colaboradorid']),
      pontuacaoengajamento:
          serializer.fromJson<int?>(json['pontuacaoengajamento']),
      propostasmelhoria: serializer.fromJson<int?>(json['propostasmelhoria']),
      dataavaliacao: serializer.fromJson<DateTime?>(json['dataavaliacao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'engajamentoid': serializer.toJson<int?>(engajamentoid),
      'colaboradorid': serializer.toJson<int?>(colaboradorid),
      'pontuacaoengajamento': serializer.toJson<int?>(pontuacaoengajamento),
      'propostasmelhoria': serializer.toJson<int?>(propostasmelhoria),
      'dataavaliacao': serializer.toJson<DateTime?>(dataavaliacao),
    };
  }

  Engajamentoproatividade copyWith(
          {Value<int?> engajamentoid = const Value.absent(),
          Value<int?> colaboradorid = const Value.absent(),
          Value<int?> pontuacaoengajamento = const Value.absent(),
          Value<int?> propostasmelhoria = const Value.absent(),
          Value<DateTime?> dataavaliacao = const Value.absent()}) =>
      Engajamentoproatividade(
        engajamentoid:
            engajamentoid.present ? engajamentoid.value : this.engajamentoid,
        colaboradorid:
            colaboradorid.present ? colaboradorid.value : this.colaboradorid,
        pontuacaoengajamento: pontuacaoengajamento.present
            ? pontuacaoengajamento.value
            : this.pontuacaoengajamento,
        propostasmelhoria: propostasmelhoria.present
            ? propostasmelhoria.value
            : this.propostasmelhoria,
        dataavaliacao:
            dataavaliacao.present ? dataavaliacao.value : this.dataavaliacao,
      );
  Engajamentoproatividade copyWithCompanion(
      EngajamentoproatividadesCompanion data) {
    return Engajamentoproatividade(
      engajamentoid: data.engajamentoid.present
          ? data.engajamentoid.value
          : this.engajamentoid,
      colaboradorid: data.colaboradorid.present
          ? data.colaboradorid.value
          : this.colaboradorid,
      pontuacaoengajamento: data.pontuacaoengajamento.present
          ? data.pontuacaoengajamento.value
          : this.pontuacaoengajamento,
      propostasmelhoria: data.propostasmelhoria.present
          ? data.propostasmelhoria.value
          : this.propostasmelhoria,
      dataavaliacao: data.dataavaliacao.present
          ? data.dataavaliacao.value
          : this.dataavaliacao,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Engajamentoproatividade(')
          ..write('engajamentoid: $engajamentoid, ')
          ..write('colaboradorid: $colaboradorid, ')
          ..write('pontuacaoengajamento: $pontuacaoengajamento, ')
          ..write('propostasmelhoria: $propostasmelhoria, ')
          ..write('dataavaliacao: $dataavaliacao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(engajamentoid, colaboradorid,
      pontuacaoengajamento, propostasmelhoria, dataavaliacao);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Engajamentoproatividade &&
          other.engajamentoid == this.engajamentoid &&
          other.colaboradorid == this.colaboradorid &&
          other.pontuacaoengajamento == this.pontuacaoengajamento &&
          other.propostasmelhoria == this.propostasmelhoria &&
          other.dataavaliacao == this.dataavaliacao);
}

class EngajamentoproatividadesCompanion
    extends UpdateCompanion<Engajamentoproatividade> {
  final Value<int?> engajamentoid;
  final Value<int?> colaboradorid;
  final Value<int?> pontuacaoengajamento;
  final Value<int?> propostasmelhoria;
  final Value<DateTime?> dataavaliacao;
  const EngajamentoproatividadesCompanion({
    this.engajamentoid = const Value.absent(),
    this.colaboradorid = const Value.absent(),
    this.pontuacaoengajamento = const Value.absent(),
    this.propostasmelhoria = const Value.absent(),
    this.dataavaliacao = const Value.absent(),
  });
  EngajamentoproatividadesCompanion.insert({
    this.engajamentoid = const Value.absent(),
    this.colaboradorid = const Value.absent(),
    this.pontuacaoengajamento = const Value.absent(),
    this.propostasmelhoria = const Value.absent(),
    this.dataavaliacao = const Value.absent(),
  });
  static Insertable<Engajamentoproatividade> custom({
    Expression<int>? engajamentoid,
    Expression<int>? colaboradorid,
    Expression<int>? pontuacaoengajamento,
    Expression<int>? propostasmelhoria,
    Expression<DateTime>? dataavaliacao,
  }) {
    return RawValuesInsertable({
      if (engajamentoid != null) 'engajamentoid': engajamentoid,
      if (colaboradorid != null) 'colaboradorid': colaboradorid,
      if (pontuacaoengajamento != null)
        'pontuacaoengajamento': pontuacaoengajamento,
      if (propostasmelhoria != null) 'propostasmelhoria': propostasmelhoria,
      if (dataavaliacao != null) 'dataavaliacao': dataavaliacao,
    });
  }

  EngajamentoproatividadesCompanion copyWith(
      {Value<int?>? engajamentoid,
      Value<int?>? colaboradorid,
      Value<int?>? pontuacaoengajamento,
      Value<int?>? propostasmelhoria,
      Value<DateTime?>? dataavaliacao}) {
    return EngajamentoproatividadesCompanion(
      engajamentoid: engajamentoid ?? this.engajamentoid,
      colaboradorid: colaboradorid ?? this.colaboradorid,
      pontuacaoengajamento: pontuacaoengajamento ?? this.pontuacaoengajamento,
      propostasmelhoria: propostasmelhoria ?? this.propostasmelhoria,
      dataavaliacao: dataavaliacao ?? this.dataavaliacao,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (engajamentoid.present) {
      map['engajamentoid'] = Variable<int>(engajamentoid.value);
    }
    if (colaboradorid.present) {
      map['colaboradorid'] = Variable<int>(colaboradorid.value);
    }
    if (pontuacaoengajamento.present) {
      map['pontuacaoengajamento'] = Variable<int>(pontuacaoengajamento.value);
    }
    if (propostasmelhoria.present) {
      map['propostasmelhoria'] = Variable<int>(propostasmelhoria.value);
    }
    if (dataavaliacao.present) {
      map['dataavaliacao'] = Variable<DateTime>(dataavaliacao.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EngajamentoproatividadesCompanion(')
          ..write('engajamentoid: $engajamentoid, ')
          ..write('colaboradorid: $colaboradorid, ')
          ..write('pontuacaoengajamento: $pontuacaoengajamento, ')
          ..write('propostasmelhoria: $propostasmelhoria, ')
          ..write('dataavaliacao: $dataavaliacao')
          ..write(')'))
        .toString();
  }
}

class $CapacidadecomunicacaosTable extends Capacidadecomunicacaos
    with TableInfo<$CapacidadecomunicacaosTable, Capacidadecomunicacao> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CapacidadecomunicacaosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _comunicacaoidMeta =
      const VerificationMeta('comunicacaoid');
  @override
  late final GeneratedColumn<int> comunicacaoid = GeneratedColumn<int>(
      'comunicacaoid', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _colaboradoridMeta =
      const VerificationMeta('colaboradorid');
  @override
  late final GeneratedColumn<int> colaboradorid = GeneratedColumn<int>(
      'colaboradorid', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _avaliacaocomunicacaoMeta =
      const VerificationMeta('avaliacaocomunicacao');
  @override
  late final GeneratedColumn<int> avaliacaocomunicacao = GeneratedColumn<int>(
      'avaliacaocomunicacao', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _feedbackcomunicacaoMeta =
      const VerificationMeta('feedbackcomunicacao');
  @override
  late final GeneratedColumn<String> feedbackcomunicacao =
      GeneratedColumn<String>('feedbackcomunicacao', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dataavaliacaoMeta =
      const VerificationMeta('dataavaliacao');
  @override
  late final GeneratedColumn<DateTime> dataavaliacao =
      GeneratedColumn<DateTime>('dataavaliacao', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        comunicacaoid,
        colaboradorid,
        avaliacaocomunicacao,
        feedbackcomunicacao,
        dataavaliacao
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'capacidadecomunicacao';
  @override
  VerificationContext validateIntegrity(
      Insertable<Capacidadecomunicacao> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('comunicacaoid')) {
      context.handle(
          _comunicacaoidMeta,
          comunicacaoid.isAcceptableOrUnknown(
              data['comunicacaoid']!, _comunicacaoidMeta));
    }
    if (data.containsKey('colaboradorid')) {
      context.handle(
          _colaboradoridMeta,
          colaboradorid.isAcceptableOrUnknown(
              data['colaboradorid']!, _colaboradoridMeta));
    }
    if (data.containsKey('avaliacaocomunicacao')) {
      context.handle(
          _avaliacaocomunicacaoMeta,
          avaliacaocomunicacao.isAcceptableOrUnknown(
              data['avaliacaocomunicacao']!, _avaliacaocomunicacaoMeta));
    }
    if (data.containsKey('feedbackcomunicacao')) {
      context.handle(
          _feedbackcomunicacaoMeta,
          feedbackcomunicacao.isAcceptableOrUnknown(
              data['feedbackcomunicacao']!, _feedbackcomunicacaoMeta));
    }
    if (data.containsKey('dataavaliacao')) {
      context.handle(
          _dataavaliacaoMeta,
          dataavaliacao.isAcceptableOrUnknown(
              data['dataavaliacao']!, _dataavaliacaoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {comunicacaoid};
  @override
  Capacidadecomunicacao map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Capacidadecomunicacao(
      comunicacaoid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}comunicacaoid']),
      colaboradorid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}colaboradorid']),
      avaliacaocomunicacao: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}avaliacaocomunicacao']),
      feedbackcomunicacao: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}feedbackcomunicacao']),
      dataavaliacao: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dataavaliacao']),
    );
  }

  @override
  $CapacidadecomunicacaosTable createAlias(String alias) {
    return $CapacidadecomunicacaosTable(attachedDatabase, alias);
  }
}

class Capacidadecomunicacao extends DataClass
    implements Insertable<Capacidadecomunicacao> {
  final int? comunicacaoid;
  final int? colaboradorid;
  final int? avaliacaocomunicacao;
  final String? feedbackcomunicacao;
  final DateTime? dataavaliacao;
  const Capacidadecomunicacao(
      {this.comunicacaoid,
      this.colaboradorid,
      this.avaliacaocomunicacao,
      this.feedbackcomunicacao,
      this.dataavaliacao});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || comunicacaoid != null) {
      map['comunicacaoid'] = Variable<int>(comunicacaoid);
    }
    if (!nullToAbsent || colaboradorid != null) {
      map['colaboradorid'] = Variable<int>(colaboradorid);
    }
    if (!nullToAbsent || avaliacaocomunicacao != null) {
      map['avaliacaocomunicacao'] = Variable<int>(avaliacaocomunicacao);
    }
    if (!nullToAbsent || feedbackcomunicacao != null) {
      map['feedbackcomunicacao'] = Variable<String>(feedbackcomunicacao);
    }
    if (!nullToAbsent || dataavaliacao != null) {
      map['dataavaliacao'] = Variable<DateTime>(dataavaliacao);
    }
    return map;
  }

  factory Capacidadecomunicacao.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Capacidadecomunicacao(
      comunicacaoid: serializer.fromJson<int?>(json['comunicacaoid']),
      colaboradorid: serializer.fromJson<int?>(json['colaboradorid']),
      avaliacaocomunicacao:
          serializer.fromJson<int?>(json['avaliacaocomunicacao']),
      feedbackcomunicacao:
          serializer.fromJson<String?>(json['feedbackcomunicacao']),
      dataavaliacao: serializer.fromJson<DateTime?>(json['dataavaliacao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'comunicacaoid': serializer.toJson<int?>(comunicacaoid),
      'colaboradorid': serializer.toJson<int?>(colaboradorid),
      'avaliacaocomunicacao': serializer.toJson<int?>(avaliacaocomunicacao),
      'feedbackcomunicacao': serializer.toJson<String?>(feedbackcomunicacao),
      'dataavaliacao': serializer.toJson<DateTime?>(dataavaliacao),
    };
  }

  Capacidadecomunicacao copyWith(
          {Value<int?> comunicacaoid = const Value.absent(),
          Value<int?> colaboradorid = const Value.absent(),
          Value<int?> avaliacaocomunicacao = const Value.absent(),
          Value<String?> feedbackcomunicacao = const Value.absent(),
          Value<DateTime?> dataavaliacao = const Value.absent()}) =>
      Capacidadecomunicacao(
        comunicacaoid:
            comunicacaoid.present ? comunicacaoid.value : this.comunicacaoid,
        colaboradorid:
            colaboradorid.present ? colaboradorid.value : this.colaboradorid,
        avaliacaocomunicacao: avaliacaocomunicacao.present
            ? avaliacaocomunicacao.value
            : this.avaliacaocomunicacao,
        feedbackcomunicacao: feedbackcomunicacao.present
            ? feedbackcomunicacao.value
            : this.feedbackcomunicacao,
        dataavaliacao:
            dataavaliacao.present ? dataavaliacao.value : this.dataavaliacao,
      );
  Capacidadecomunicacao copyWithCompanion(
      CapacidadecomunicacaosCompanion data) {
    return Capacidadecomunicacao(
      comunicacaoid: data.comunicacaoid.present
          ? data.comunicacaoid.value
          : this.comunicacaoid,
      colaboradorid: data.colaboradorid.present
          ? data.colaboradorid.value
          : this.colaboradorid,
      avaliacaocomunicacao: data.avaliacaocomunicacao.present
          ? data.avaliacaocomunicacao.value
          : this.avaliacaocomunicacao,
      feedbackcomunicacao: data.feedbackcomunicacao.present
          ? data.feedbackcomunicacao.value
          : this.feedbackcomunicacao,
      dataavaliacao: data.dataavaliacao.present
          ? data.dataavaliacao.value
          : this.dataavaliacao,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Capacidadecomunicacao(')
          ..write('comunicacaoid: $comunicacaoid, ')
          ..write('colaboradorid: $colaboradorid, ')
          ..write('avaliacaocomunicacao: $avaliacaocomunicacao, ')
          ..write('feedbackcomunicacao: $feedbackcomunicacao, ')
          ..write('dataavaliacao: $dataavaliacao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(comunicacaoid, colaboradorid,
      avaliacaocomunicacao, feedbackcomunicacao, dataavaliacao);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Capacidadecomunicacao &&
          other.comunicacaoid == this.comunicacaoid &&
          other.colaboradorid == this.colaboradorid &&
          other.avaliacaocomunicacao == this.avaliacaocomunicacao &&
          other.feedbackcomunicacao == this.feedbackcomunicacao &&
          other.dataavaliacao == this.dataavaliacao);
}

class CapacidadecomunicacaosCompanion
    extends UpdateCompanion<Capacidadecomunicacao> {
  final Value<int?> comunicacaoid;
  final Value<int?> colaboradorid;
  final Value<int?> avaliacaocomunicacao;
  final Value<String?> feedbackcomunicacao;
  final Value<DateTime?> dataavaliacao;
  const CapacidadecomunicacaosCompanion({
    this.comunicacaoid = const Value.absent(),
    this.colaboradorid = const Value.absent(),
    this.avaliacaocomunicacao = const Value.absent(),
    this.feedbackcomunicacao = const Value.absent(),
    this.dataavaliacao = const Value.absent(),
  });
  CapacidadecomunicacaosCompanion.insert({
    this.comunicacaoid = const Value.absent(),
    this.colaboradorid = const Value.absent(),
    this.avaliacaocomunicacao = const Value.absent(),
    this.feedbackcomunicacao = const Value.absent(),
    this.dataavaliacao = const Value.absent(),
  });
  static Insertable<Capacidadecomunicacao> custom({
    Expression<int>? comunicacaoid,
    Expression<int>? colaboradorid,
    Expression<int>? avaliacaocomunicacao,
    Expression<String>? feedbackcomunicacao,
    Expression<DateTime>? dataavaliacao,
  }) {
    return RawValuesInsertable({
      if (comunicacaoid != null) 'comunicacaoid': comunicacaoid,
      if (colaboradorid != null) 'colaboradorid': colaboradorid,
      if (avaliacaocomunicacao != null)
        'avaliacaocomunicacao': avaliacaocomunicacao,
      if (feedbackcomunicacao != null)
        'feedbackcomunicacao': feedbackcomunicacao,
      if (dataavaliacao != null) 'dataavaliacao': dataavaliacao,
    });
  }

  CapacidadecomunicacaosCompanion copyWith(
      {Value<int?>? comunicacaoid,
      Value<int?>? colaboradorid,
      Value<int?>? avaliacaocomunicacao,
      Value<String?>? feedbackcomunicacao,
      Value<DateTime?>? dataavaliacao}) {
    return CapacidadecomunicacaosCompanion(
      comunicacaoid: comunicacaoid ?? this.comunicacaoid,
      colaboradorid: colaboradorid ?? this.colaboradorid,
      avaliacaocomunicacao: avaliacaocomunicacao ?? this.avaliacaocomunicacao,
      feedbackcomunicacao: feedbackcomunicacao ?? this.feedbackcomunicacao,
      dataavaliacao: dataavaliacao ?? this.dataavaliacao,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (comunicacaoid.present) {
      map['comunicacaoid'] = Variable<int>(comunicacaoid.value);
    }
    if (colaboradorid.present) {
      map['colaboradorid'] = Variable<int>(colaboradorid.value);
    }
    if (avaliacaocomunicacao.present) {
      map['avaliacaocomunicacao'] = Variable<int>(avaliacaocomunicacao.value);
    }
    if (feedbackcomunicacao.present) {
      map['feedbackcomunicacao'] = Variable<String>(feedbackcomunicacao.value);
    }
    if (dataavaliacao.present) {
      map['dataavaliacao'] = Variable<DateTime>(dataavaliacao.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CapacidadecomunicacaosCompanion(')
          ..write('comunicacaoid: $comunicacaoid, ')
          ..write('colaboradorid: $colaboradorid, ')
          ..write('avaliacaocomunicacao: $avaliacaocomunicacao, ')
          ..write('feedbackcomunicacao: $feedbackcomunicacao, ')
          ..write('dataavaliacao: $dataavaliacao')
          ..write(')'))
        .toString();
  }
}

class $ResultadosatingidossTable extends Resultadosatingidoss
    with TableInfo<$ResultadosatingidossTable, Resultadosatingidos> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResultadosatingidossTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _resultadoidMeta =
      const VerificationMeta('resultadoid');
  @override
  late final GeneratedColumn<int> resultadoid = GeneratedColumn<int>(
      'resultadoid', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _colaboradoridMeta =
      const VerificationMeta('colaboradorid');
  @override
  late final GeneratedColumn<int> colaboradorid = GeneratedColumn<int>(
      'colaboradorid', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _metasatingidasMeta =
      const VerificationMeta('metasatingidas');
  @override
  late final GeneratedColumn<int> metasatingidas = GeneratedColumn<int>(
      'metasatingidas', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dataavaliacaoMeta =
      const VerificationMeta('dataavaliacao');
  @override
  late final GeneratedColumn<DateTime> dataavaliacao =
      GeneratedColumn<DateTime>('dataavaliacao', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _pontuacaoprodutividadeMeta =
      const VerificationMeta('pontuacaoprodutividade');
  @override
  late final GeneratedColumn<int> pontuacaoprodutividade = GeneratedColumn<int>(
      'pontuacaoprodutividade', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _defeitosproduzidosMeta =
      const VerificationMeta('defeitosproduzidos');
  @override
  late final GeneratedColumn<int> defeitosproduzidos = GeneratedColumn<int>(
      'defeitosproduzidos', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        resultadoid,
        colaboradorid,
        metasatingidas,
        dataavaliacao,
        pontuacaoprodutividade,
        defeitosproduzidos
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'resultadosatingidos';
  @override
  VerificationContext validateIntegrity(
      Insertable<Resultadosatingidos> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('resultadoid')) {
      context.handle(
          _resultadoidMeta,
          resultadoid.isAcceptableOrUnknown(
              data['resultadoid']!, _resultadoidMeta));
    }
    if (data.containsKey('colaboradorid')) {
      context.handle(
          _colaboradoridMeta,
          colaboradorid.isAcceptableOrUnknown(
              data['colaboradorid']!, _colaboradoridMeta));
    }
    if (data.containsKey('metasatingidas')) {
      context.handle(
          _metasatingidasMeta,
          metasatingidas.isAcceptableOrUnknown(
              data['metasatingidas']!, _metasatingidasMeta));
    }
    if (data.containsKey('dataavaliacao')) {
      context.handle(
          _dataavaliacaoMeta,
          dataavaliacao.isAcceptableOrUnknown(
              data['dataavaliacao']!, _dataavaliacaoMeta));
    }
    if (data.containsKey('pontuacaoprodutividade')) {
      context.handle(
          _pontuacaoprodutividadeMeta,
          pontuacaoprodutividade.isAcceptableOrUnknown(
              data['pontuacaoprodutividade']!, _pontuacaoprodutividadeMeta));
    }
    if (data.containsKey('defeitosproduzidos')) {
      context.handle(
          _defeitosproduzidosMeta,
          defeitosproduzidos.isAcceptableOrUnknown(
              data['defeitosproduzidos']!, _defeitosproduzidosMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {resultadoid};
  @override
  Resultadosatingidos map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Resultadosatingidos(
      resultadoid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}resultadoid']),
      colaboradorid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}colaboradorid']),
      metasatingidas: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}metasatingidas']),
      dataavaliacao: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dataavaliacao']),
      pontuacaoprodutividade: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}pontuacaoprodutividade']),
      defeitosproduzidos: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}defeitosproduzidos']),
    );
  }

  @override
  $ResultadosatingidossTable createAlias(String alias) {
    return $ResultadosatingidossTable(attachedDatabase, alias);
  }
}

class Resultadosatingidos extends DataClass
    implements Insertable<Resultadosatingidos> {
  final int? resultadoid;
  final int? colaboradorid;
  final int? metasatingidas;
  final DateTime? dataavaliacao;
  final int? pontuacaoprodutividade;
  final int? defeitosproduzidos;
  const Resultadosatingidos(
      {this.resultadoid,
      this.colaboradorid,
      this.metasatingidas,
      this.dataavaliacao,
      this.pontuacaoprodutividade,
      this.defeitosproduzidos});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || resultadoid != null) {
      map['resultadoid'] = Variable<int>(resultadoid);
    }
    if (!nullToAbsent || colaboradorid != null) {
      map['colaboradorid'] = Variable<int>(colaboradorid);
    }
    if (!nullToAbsent || metasatingidas != null) {
      map['metasatingidas'] = Variable<int>(metasatingidas);
    }
    if (!nullToAbsent || dataavaliacao != null) {
      map['dataavaliacao'] = Variable<DateTime>(dataavaliacao);
    }
    if (!nullToAbsent || pontuacaoprodutividade != null) {
      map['pontuacaoprodutividade'] = Variable<int>(pontuacaoprodutividade);
    }
    if (!nullToAbsent || defeitosproduzidos != null) {
      map['defeitosproduzidos'] = Variable<int>(defeitosproduzidos);
    }
    return map;
  }

  factory Resultadosatingidos.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Resultadosatingidos(
      resultadoid: serializer.fromJson<int?>(json['resultadoid']),
      colaboradorid: serializer.fromJson<int?>(json['colaboradorid']),
      metasatingidas: serializer.fromJson<int?>(json['metasatingidas']),
      dataavaliacao: serializer.fromJson<DateTime?>(json['dataavaliacao']),
      pontuacaoprodutividade:
          serializer.fromJson<int?>(json['pontuacaoprodutividade']),
      defeitosproduzidos: serializer.fromJson<int?>(json['defeitosproduzidos']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'resultadoid': serializer.toJson<int?>(resultadoid),
      'colaboradorid': serializer.toJson<int?>(colaboradorid),
      'metasatingidas': serializer.toJson<int?>(metasatingidas),
      'dataavaliacao': serializer.toJson<DateTime?>(dataavaliacao),
      'pontuacaoprodutividade': serializer.toJson<int?>(pontuacaoprodutividade),
      'defeitosproduzidos': serializer.toJson<int?>(defeitosproduzidos),
    };
  }

  Resultadosatingidos copyWith(
          {Value<int?> resultadoid = const Value.absent(),
          Value<int?> colaboradorid = const Value.absent(),
          Value<int?> metasatingidas = const Value.absent(),
          Value<DateTime?> dataavaliacao = const Value.absent(),
          Value<int?> pontuacaoprodutividade = const Value.absent(),
          Value<int?> defeitosproduzidos = const Value.absent()}) =>
      Resultadosatingidos(
        resultadoid: resultadoid.present ? resultadoid.value : this.resultadoid,
        colaboradorid:
            colaboradorid.present ? colaboradorid.value : this.colaboradorid,
        metasatingidas:
            metasatingidas.present ? metasatingidas.value : this.metasatingidas,
        dataavaliacao:
            dataavaliacao.present ? dataavaliacao.value : this.dataavaliacao,
        pontuacaoprodutividade: pontuacaoprodutividade.present
            ? pontuacaoprodutividade.value
            : this.pontuacaoprodutividade,
        defeitosproduzidos: defeitosproduzidos.present
            ? defeitosproduzidos.value
            : this.defeitosproduzidos,
      );
  Resultadosatingidos copyWithCompanion(ResultadosatingidossCompanion data) {
    return Resultadosatingidos(
      resultadoid:
          data.resultadoid.present ? data.resultadoid.value : this.resultadoid,
      colaboradorid: data.colaboradorid.present
          ? data.colaboradorid.value
          : this.colaboradorid,
      metasatingidas: data.metasatingidas.present
          ? data.metasatingidas.value
          : this.metasatingidas,
      dataavaliacao: data.dataavaliacao.present
          ? data.dataavaliacao.value
          : this.dataavaliacao,
      pontuacaoprodutividade: data.pontuacaoprodutividade.present
          ? data.pontuacaoprodutividade.value
          : this.pontuacaoprodutividade,
      defeitosproduzidos: data.defeitosproduzidos.present
          ? data.defeitosproduzidos.value
          : this.defeitosproduzidos,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Resultadosatingidos(')
          ..write('resultadoid: $resultadoid, ')
          ..write('colaboradorid: $colaboradorid, ')
          ..write('metasatingidas: $metasatingidas, ')
          ..write('dataavaliacao: $dataavaliacao, ')
          ..write('pontuacaoprodutividade: $pontuacaoprodutividade, ')
          ..write('defeitosproduzidos: $defeitosproduzidos')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(resultadoid, colaboradorid, metasatingidas,
      dataavaliacao, pontuacaoprodutividade, defeitosproduzidos);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Resultadosatingidos &&
          other.resultadoid == this.resultadoid &&
          other.colaboradorid == this.colaboradorid &&
          other.metasatingidas == this.metasatingidas &&
          other.dataavaliacao == this.dataavaliacao &&
          other.pontuacaoprodutividade == this.pontuacaoprodutividade &&
          other.defeitosproduzidos == this.defeitosproduzidos);
}

class ResultadosatingidossCompanion
    extends UpdateCompanion<Resultadosatingidos> {
  final Value<int?> resultadoid;
  final Value<int?> colaboradorid;
  final Value<int?> metasatingidas;
  final Value<DateTime?> dataavaliacao;
  final Value<int?> pontuacaoprodutividade;
  final Value<int?> defeitosproduzidos;
  const ResultadosatingidossCompanion({
    this.resultadoid = const Value.absent(),
    this.colaboradorid = const Value.absent(),
    this.metasatingidas = const Value.absent(),
    this.dataavaliacao = const Value.absent(),
    this.pontuacaoprodutividade = const Value.absent(),
    this.defeitosproduzidos = const Value.absent(),
  });
  ResultadosatingidossCompanion.insert({
    this.resultadoid = const Value.absent(),
    this.colaboradorid = const Value.absent(),
    this.metasatingidas = const Value.absent(),
    this.dataavaliacao = const Value.absent(),
    this.pontuacaoprodutividade = const Value.absent(),
    this.defeitosproduzidos = const Value.absent(),
  });
  static Insertable<Resultadosatingidos> custom({
    Expression<int>? resultadoid,
    Expression<int>? colaboradorid,
    Expression<int>? metasatingidas,
    Expression<DateTime>? dataavaliacao,
    Expression<int>? pontuacaoprodutividade,
    Expression<int>? defeitosproduzidos,
  }) {
    return RawValuesInsertable({
      if (resultadoid != null) 'resultadoid': resultadoid,
      if (colaboradorid != null) 'colaboradorid': colaboradorid,
      if (metasatingidas != null) 'metasatingidas': metasatingidas,
      if (dataavaliacao != null) 'dataavaliacao': dataavaliacao,
      if (pontuacaoprodutividade != null)
        'pontuacaoprodutividade': pontuacaoprodutividade,
      if (defeitosproduzidos != null) 'defeitosproduzidos': defeitosproduzidos,
    });
  }

  ResultadosatingidossCompanion copyWith(
      {Value<int?>? resultadoid,
      Value<int?>? colaboradorid,
      Value<int?>? metasatingidas,
      Value<DateTime?>? dataavaliacao,
      Value<int?>? pontuacaoprodutividade,
      Value<int?>? defeitosproduzidos}) {
    return ResultadosatingidossCompanion(
      resultadoid: resultadoid ?? this.resultadoid,
      colaboradorid: colaboradorid ?? this.colaboradorid,
      metasatingidas: metasatingidas ?? this.metasatingidas,
      dataavaliacao: dataavaliacao ?? this.dataavaliacao,
      pontuacaoprodutividade:
          pontuacaoprodutividade ?? this.pontuacaoprodutividade,
      defeitosproduzidos: defeitosproduzidos ?? this.defeitosproduzidos,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (resultadoid.present) {
      map['resultadoid'] = Variable<int>(resultadoid.value);
    }
    if (colaboradorid.present) {
      map['colaboradorid'] = Variable<int>(colaboradorid.value);
    }
    if (metasatingidas.present) {
      map['metasatingidas'] = Variable<int>(metasatingidas.value);
    }
    if (dataavaliacao.present) {
      map['dataavaliacao'] = Variable<DateTime>(dataavaliacao.value);
    }
    if (pontuacaoprodutividade.present) {
      map['pontuacaoprodutividade'] =
          Variable<int>(pontuacaoprodutividade.value);
    }
    if (defeitosproduzidos.present) {
      map['defeitosproduzidos'] = Variable<int>(defeitosproduzidos.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResultadosatingidossCompanion(')
          ..write('resultadoid: $resultadoid, ')
          ..write('colaboradorid: $colaboradorid, ')
          ..write('metasatingidas: $metasatingidas, ')
          ..write('dataavaliacao: $dataavaliacao, ')
          ..write('pontuacaoprodutividade: $pontuacaoprodutividade, ')
          ..write('defeitosproduzidos: $defeitosproduzidos')
          ..write(')'))
        .toString();
  }
}

class $CapacitacaotreinamentossTable extends Capacitacaotreinamentoss
    with TableInfo<$CapacitacaotreinamentossTable, Capacitacaotreinamentos> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CapacitacaotreinamentossTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _treinamentoidMeta =
      const VerificationMeta('treinamentoid');
  @override
  late final GeneratedColumn<int> treinamentoid = GeneratedColumn<int>(
      'treinamentoid', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _colaboradoridMeta =
      const VerificationMeta('colaboradorid');
  @override
  late final GeneratedColumn<int> colaboradorid = GeneratedColumn<int>(
      'colaboradorid', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nometreinamentoMeta =
      const VerificationMeta('nometreinamento');
  @override
  late final GeneratedColumn<String> nometreinamento = GeneratedColumn<String>(
      'nometreinamento', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 150),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _dataconclusaoMeta =
      const VerificationMeta('dataconclusao');
  @override
  late final GeneratedColumn<DateTime> dataconclusao =
      GeneratedColumn<DateTime>('dataconclusao', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _certificadoMeta =
      const VerificationMeta('certificado');
  @override
  late final GeneratedColumn<bool> certificado = GeneratedColumn<bool>(
      'certificado', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("certificado" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        treinamentoid,
        colaboradorid,
        nometreinamento,
        dataconclusao,
        certificado
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'capacitacaotreinamentos';
  @override
  VerificationContext validateIntegrity(
      Insertable<Capacitacaotreinamentos> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('treinamentoid')) {
      context.handle(
          _treinamentoidMeta,
          treinamentoid.isAcceptableOrUnknown(
              data['treinamentoid']!, _treinamentoidMeta));
    }
    if (data.containsKey('colaboradorid')) {
      context.handle(
          _colaboradoridMeta,
          colaboradorid.isAcceptableOrUnknown(
              data['colaboradorid']!, _colaboradoridMeta));
    }
    if (data.containsKey('nometreinamento')) {
      context.handle(
          _nometreinamentoMeta,
          nometreinamento.isAcceptableOrUnknown(
              data['nometreinamento']!, _nometreinamentoMeta));
    }
    if (data.containsKey('dataconclusao')) {
      context.handle(
          _dataconclusaoMeta,
          dataconclusao.isAcceptableOrUnknown(
              data['dataconclusao']!, _dataconclusaoMeta));
    }
    if (data.containsKey('certificado')) {
      context.handle(
          _certificadoMeta,
          certificado.isAcceptableOrUnknown(
              data['certificado']!, _certificadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {treinamentoid};
  @override
  Capacitacaotreinamentos map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Capacitacaotreinamentos(
      treinamentoid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}treinamentoid']),
      colaboradorid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}colaboradorid']),
      nometreinamento: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nometreinamento']),
      dataconclusao: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dataconclusao']),
      certificado: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}certificado']),
    );
  }

  @override
  $CapacitacaotreinamentossTable createAlias(String alias) {
    return $CapacitacaotreinamentossTable(attachedDatabase, alias);
  }
}

class Capacitacaotreinamentos extends DataClass
    implements Insertable<Capacitacaotreinamentos> {
  final int? treinamentoid;
  final int? colaboradorid;
  final String? nometreinamento;
  final DateTime? dataconclusao;
  final bool? certificado;
  const Capacitacaotreinamentos(
      {this.treinamentoid,
      this.colaboradorid,
      this.nometreinamento,
      this.dataconclusao,
      this.certificado});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || treinamentoid != null) {
      map['treinamentoid'] = Variable<int>(treinamentoid);
    }
    if (!nullToAbsent || colaboradorid != null) {
      map['colaboradorid'] = Variable<int>(colaboradorid);
    }
    if (!nullToAbsent || nometreinamento != null) {
      map['nometreinamento'] = Variable<String>(nometreinamento);
    }
    if (!nullToAbsent || dataconclusao != null) {
      map['dataconclusao'] = Variable<DateTime>(dataconclusao);
    }
    if (!nullToAbsent || certificado != null) {
      map['certificado'] = Variable<bool>(certificado);
    }
    return map;
  }

  factory Capacitacaotreinamentos.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Capacitacaotreinamentos(
      treinamentoid: serializer.fromJson<int?>(json['treinamentoid']),
      colaboradorid: serializer.fromJson<int?>(json['colaboradorid']),
      nometreinamento: serializer.fromJson<String?>(json['nometreinamento']),
      dataconclusao: serializer.fromJson<DateTime?>(json['dataconclusao']),
      certificado: serializer.fromJson<bool?>(json['certificado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'treinamentoid': serializer.toJson<int?>(treinamentoid),
      'colaboradorid': serializer.toJson<int?>(colaboradorid),
      'nometreinamento': serializer.toJson<String?>(nometreinamento),
      'dataconclusao': serializer.toJson<DateTime?>(dataconclusao),
      'certificado': serializer.toJson<bool?>(certificado),
    };
  }

  Capacitacaotreinamentos copyWith(
          {Value<int?> treinamentoid = const Value.absent(),
          Value<int?> colaboradorid = const Value.absent(),
          Value<String?> nometreinamento = const Value.absent(),
          Value<DateTime?> dataconclusao = const Value.absent(),
          Value<bool?> certificado = const Value.absent()}) =>
      Capacitacaotreinamentos(
        treinamentoid:
            treinamentoid.present ? treinamentoid.value : this.treinamentoid,
        colaboradorid:
            colaboradorid.present ? colaboradorid.value : this.colaboradorid,
        nometreinamento: nometreinamento.present
            ? nometreinamento.value
            : this.nometreinamento,
        dataconclusao:
            dataconclusao.present ? dataconclusao.value : this.dataconclusao,
        certificado: certificado.present ? certificado.value : this.certificado,
      );
  Capacitacaotreinamentos copyWithCompanion(
      CapacitacaotreinamentossCompanion data) {
    return Capacitacaotreinamentos(
      treinamentoid: data.treinamentoid.present
          ? data.treinamentoid.value
          : this.treinamentoid,
      colaboradorid: data.colaboradorid.present
          ? data.colaboradorid.value
          : this.colaboradorid,
      nometreinamento: data.nometreinamento.present
          ? data.nometreinamento.value
          : this.nometreinamento,
      dataconclusao: data.dataconclusao.present
          ? data.dataconclusao.value
          : this.dataconclusao,
      certificado:
          data.certificado.present ? data.certificado.value : this.certificado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Capacitacaotreinamentos(')
          ..write('treinamentoid: $treinamentoid, ')
          ..write('colaboradorid: $colaboradorid, ')
          ..write('nometreinamento: $nometreinamento, ')
          ..write('dataconclusao: $dataconclusao, ')
          ..write('certificado: $certificado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(treinamentoid, colaboradorid, nometreinamento,
      dataconclusao, certificado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Capacitacaotreinamentos &&
          other.treinamentoid == this.treinamentoid &&
          other.colaboradorid == this.colaboradorid &&
          other.nometreinamento == this.nometreinamento &&
          other.dataconclusao == this.dataconclusao &&
          other.certificado == this.certificado);
}

class CapacitacaotreinamentossCompanion
    extends UpdateCompanion<Capacitacaotreinamentos> {
  final Value<int?> treinamentoid;
  final Value<int?> colaboradorid;
  final Value<String?> nometreinamento;
  final Value<DateTime?> dataconclusao;
  final Value<bool?> certificado;
  const CapacitacaotreinamentossCompanion({
    this.treinamentoid = const Value.absent(),
    this.colaboradorid = const Value.absent(),
    this.nometreinamento = const Value.absent(),
    this.dataconclusao = const Value.absent(),
    this.certificado = const Value.absent(),
  });
  CapacitacaotreinamentossCompanion.insert({
    this.treinamentoid = const Value.absent(),
    this.colaboradorid = const Value.absent(),
    this.nometreinamento = const Value.absent(),
    this.dataconclusao = const Value.absent(),
    this.certificado = const Value.absent(),
  });
  static Insertable<Capacitacaotreinamentos> custom({
    Expression<int>? treinamentoid,
    Expression<int>? colaboradorid,
    Expression<String>? nometreinamento,
    Expression<DateTime>? dataconclusao,
    Expression<bool>? certificado,
  }) {
    return RawValuesInsertable({
      if (treinamentoid != null) 'treinamentoid': treinamentoid,
      if (colaboradorid != null) 'colaboradorid': colaboradorid,
      if (nometreinamento != null) 'nometreinamento': nometreinamento,
      if (dataconclusao != null) 'dataconclusao': dataconclusao,
      if (certificado != null) 'certificado': certificado,
    });
  }

  CapacitacaotreinamentossCompanion copyWith(
      {Value<int?>? treinamentoid,
      Value<int?>? colaboradorid,
      Value<String?>? nometreinamento,
      Value<DateTime?>? dataconclusao,
      Value<bool?>? certificado}) {
    return CapacitacaotreinamentossCompanion(
      treinamentoid: treinamentoid ?? this.treinamentoid,
      colaboradorid: colaboradorid ?? this.colaboradorid,
      nometreinamento: nometreinamento ?? this.nometreinamento,
      dataconclusao: dataconclusao ?? this.dataconclusao,
      certificado: certificado ?? this.certificado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (treinamentoid.present) {
      map['treinamentoid'] = Variable<int>(treinamentoid.value);
    }
    if (colaboradorid.present) {
      map['colaboradorid'] = Variable<int>(colaboradorid.value);
    }
    if (nometreinamento.present) {
      map['nometreinamento'] = Variable<String>(nometreinamento.value);
    }
    if (dataconclusao.present) {
      map['dataconclusao'] = Variable<DateTime>(dataconclusao.value);
    }
    if (certificado.present) {
      map['certificado'] = Variable<bool>(certificado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CapacitacaotreinamentossCompanion(')
          ..write('treinamentoid: $treinamentoid, ')
          ..write('colaboradorid: $colaboradorid, ')
          ..write('nometreinamento: $nometreinamento, ')
          ..write('dataconclusao: $dataconclusao, ')
          ..write('certificado: $certificado')
          ..write(')'))
        .toString();
  }
}

class $FeedbacksupervisoressTable extends Feedbacksupervisoress
    with TableInfo<$FeedbacksupervisoressTable, Feedbacksupervisores> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeedbacksupervisoressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _feedbackidMeta =
      const VerificationMeta('feedbackid');
  @override
  late final GeneratedColumn<int> feedbackid = GeneratedColumn<int>(
      'feedbackid', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _supervisoridSupervisoresMeta =
      const VerificationMeta('supervisoridSupervisores');
  @override
  late final GeneratedColumn<int> supervisoridSupervisores =
      GeneratedColumn<int>('supervisorid_supervisores', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _colaboradoridMeta =
      const VerificationMeta('colaboradorid');
  @override
  late final GeneratedColumn<int> colaboradorid = GeneratedColumn<int>(
      'colaboradorid', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _feedbackMeta =
      const VerificationMeta('feedback');
  @override
  late final GeneratedColumn<String> feedback = GeneratedColumn<String>(
      'feedback', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 450),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _datafeedbackMeta =
      const VerificationMeta('datafeedback');
  @override
  late final GeneratedColumn<DateTime> datafeedback = GeneratedColumn<DateTime>(
      'datafeedback', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        feedbackid,
        supervisoridSupervisores,
        colaboradorid,
        feedback,
        datafeedback
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'feedbacksupervisores';
  @override
  VerificationContext validateIntegrity(
      Insertable<Feedbacksupervisores> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('feedbackid')) {
      context.handle(
          _feedbackidMeta,
          feedbackid.isAcceptableOrUnknown(
              data['feedbackid']!, _feedbackidMeta));
    }
    if (data.containsKey('supervisorid_supervisores')) {
      context.handle(
          _supervisoridSupervisoresMeta,
          supervisoridSupervisores.isAcceptableOrUnknown(
              data['supervisorid_supervisores']!,
              _supervisoridSupervisoresMeta));
    }
    if (data.containsKey('colaboradorid')) {
      context.handle(
          _colaboradoridMeta,
          colaboradorid.isAcceptableOrUnknown(
              data['colaboradorid']!, _colaboradoridMeta));
    }
    if (data.containsKey('feedback')) {
      context.handle(_feedbackMeta,
          feedback.isAcceptableOrUnknown(data['feedback']!, _feedbackMeta));
    }
    if (data.containsKey('datafeedback')) {
      context.handle(
          _datafeedbackMeta,
          datafeedback.isAcceptableOrUnknown(
              data['datafeedback']!, _datafeedbackMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {feedbackid};
  @override
  Feedbacksupervisores map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Feedbacksupervisores(
      feedbackid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}feedbackid']),
      supervisoridSupervisores: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}supervisorid_supervisores']),
      colaboradorid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}colaboradorid']),
      feedback: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}feedback']),
      datafeedback: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}datafeedback']),
    );
  }

  @override
  $FeedbacksupervisoressTable createAlias(String alias) {
    return $FeedbacksupervisoressTable(attachedDatabase, alias);
  }
}

class Feedbacksupervisores extends DataClass
    implements Insertable<Feedbacksupervisores> {
  final int? feedbackid;
  final int? supervisoridSupervisores;
  final int? colaboradorid;
  final String? feedback;
  final DateTime? datafeedback;
  const Feedbacksupervisores(
      {this.feedbackid,
      this.supervisoridSupervisores,
      this.colaboradorid,
      this.feedback,
      this.datafeedback});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || feedbackid != null) {
      map['feedbackid'] = Variable<int>(feedbackid);
    }
    if (!nullToAbsent || supervisoridSupervisores != null) {
      map['supervisorid_supervisores'] =
          Variable<int>(supervisoridSupervisores);
    }
    if (!nullToAbsent || colaboradorid != null) {
      map['colaboradorid'] = Variable<int>(colaboradorid);
    }
    if (!nullToAbsent || feedback != null) {
      map['feedback'] = Variable<String>(feedback);
    }
    if (!nullToAbsent || datafeedback != null) {
      map['datafeedback'] = Variable<DateTime>(datafeedback);
    }
    return map;
  }

  factory Feedbacksupervisores.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Feedbacksupervisores(
      feedbackid: serializer.fromJson<int?>(json['feedbackid']),
      supervisoridSupervisores:
          serializer.fromJson<int?>(json['supervisoridSupervisores']),
      colaboradorid: serializer.fromJson<int?>(json['colaboradorid']),
      feedback: serializer.fromJson<String?>(json['feedback']),
      datafeedback: serializer.fromJson<DateTime?>(json['datafeedback']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'feedbackid': serializer.toJson<int?>(feedbackid),
      'supervisoridSupervisores':
          serializer.toJson<int?>(supervisoridSupervisores),
      'colaboradorid': serializer.toJson<int?>(colaboradorid),
      'feedback': serializer.toJson<String?>(feedback),
      'datafeedback': serializer.toJson<DateTime?>(datafeedback),
    };
  }

  Feedbacksupervisores copyWith(
          {Value<int?> feedbackid = const Value.absent(),
          Value<int?> supervisoridSupervisores = const Value.absent(),
          Value<int?> colaboradorid = const Value.absent(),
          Value<String?> feedback = const Value.absent(),
          Value<DateTime?> datafeedback = const Value.absent()}) =>
      Feedbacksupervisores(
        feedbackid: feedbackid.present ? feedbackid.value : this.feedbackid,
        supervisoridSupervisores: supervisoridSupervisores.present
            ? supervisoridSupervisores.value
            : this.supervisoridSupervisores,
        colaboradorid:
            colaboradorid.present ? colaboradorid.value : this.colaboradorid,
        feedback: feedback.present ? feedback.value : this.feedback,
        datafeedback:
            datafeedback.present ? datafeedback.value : this.datafeedback,
      );
  Feedbacksupervisores copyWithCompanion(FeedbacksupervisoressCompanion data) {
    return Feedbacksupervisores(
      feedbackid:
          data.feedbackid.present ? data.feedbackid.value : this.feedbackid,
      supervisoridSupervisores: data.supervisoridSupervisores.present
          ? data.supervisoridSupervisores.value
          : this.supervisoridSupervisores,
      colaboradorid: data.colaboradorid.present
          ? data.colaboradorid.value
          : this.colaboradorid,
      feedback: data.feedback.present ? data.feedback.value : this.feedback,
      datafeedback: data.datafeedback.present
          ? data.datafeedback.value
          : this.datafeedback,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Feedbacksupervisores(')
          ..write('feedbackid: $feedbackid, ')
          ..write('supervisoridSupervisores: $supervisoridSupervisores, ')
          ..write('colaboradorid: $colaboradorid, ')
          ..write('feedback: $feedback, ')
          ..write('datafeedback: $datafeedback')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(feedbackid, supervisoridSupervisores,
      colaboradorid, feedback, datafeedback);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Feedbacksupervisores &&
          other.feedbackid == this.feedbackid &&
          other.supervisoridSupervisores == this.supervisoridSupervisores &&
          other.colaboradorid == this.colaboradorid &&
          other.feedback == this.feedback &&
          other.datafeedback == this.datafeedback);
}

class FeedbacksupervisoressCompanion
    extends UpdateCompanion<Feedbacksupervisores> {
  final Value<int?> feedbackid;
  final Value<int?> supervisoridSupervisores;
  final Value<int?> colaboradorid;
  final Value<String?> feedback;
  final Value<DateTime?> datafeedback;
  const FeedbacksupervisoressCompanion({
    this.feedbackid = const Value.absent(),
    this.supervisoridSupervisores = const Value.absent(),
    this.colaboradorid = const Value.absent(),
    this.feedback = const Value.absent(),
    this.datafeedback = const Value.absent(),
  });
  FeedbacksupervisoressCompanion.insert({
    this.feedbackid = const Value.absent(),
    this.supervisoridSupervisores = const Value.absent(),
    this.colaboradorid = const Value.absent(),
    this.feedback = const Value.absent(),
    this.datafeedback = const Value.absent(),
  });
  static Insertable<Feedbacksupervisores> custom({
    Expression<int>? feedbackid,
    Expression<int>? supervisoridSupervisores,
    Expression<int>? colaboradorid,
    Expression<String>? feedback,
    Expression<DateTime>? datafeedback,
  }) {
    return RawValuesInsertable({
      if (feedbackid != null) 'feedbackid': feedbackid,
      if (supervisoridSupervisores != null)
        'supervisorid_supervisores': supervisoridSupervisores,
      if (colaboradorid != null) 'colaboradorid': colaboradorid,
      if (feedback != null) 'feedback': feedback,
      if (datafeedback != null) 'datafeedback': datafeedback,
    });
  }

  FeedbacksupervisoressCompanion copyWith(
      {Value<int?>? feedbackid,
      Value<int?>? supervisoridSupervisores,
      Value<int?>? colaboradorid,
      Value<String?>? feedback,
      Value<DateTime?>? datafeedback}) {
    return FeedbacksupervisoressCompanion(
      feedbackid: feedbackid ?? this.feedbackid,
      supervisoridSupervisores:
          supervisoridSupervisores ?? this.supervisoridSupervisores,
      colaboradorid: colaboradorid ?? this.colaboradorid,
      feedback: feedback ?? this.feedback,
      datafeedback: datafeedback ?? this.datafeedback,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (feedbackid.present) {
      map['feedbackid'] = Variable<int>(feedbackid.value);
    }
    if (supervisoridSupervisores.present) {
      map['supervisorid_supervisores'] =
          Variable<int>(supervisoridSupervisores.value);
    }
    if (colaboradorid.present) {
      map['colaboradorid'] = Variable<int>(colaboradorid.value);
    }
    if (feedback.present) {
      map['feedback'] = Variable<String>(feedback.value);
    }
    if (datafeedback.present) {
      map['datafeedback'] = Variable<DateTime>(datafeedback.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedbacksupervisoressCompanion(')
          ..write('feedbackid: $feedbackid, ')
          ..write('supervisoridSupervisores: $supervisoridSupervisores, ')
          ..write('colaboradorid: $colaboradorid, ')
          ..write('feedback: $feedback, ')
          ..write('datafeedback: $datafeedback')
          ..write(')'))
        .toString();
  }
}

class $ResolucaoproblemassTable extends Resolucaoproblemass
    with TableInfo<$ResolucaoproblemassTable, Resolucaoproblemas> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResolucaoproblemassTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _resolucaoidMeta =
      const VerificationMeta('resolucaoid');
  @override
  late final GeneratedColumn<int> resolucaoid = GeneratedColumn<int>(
      'resolucaoid', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _colaboradoridMeta =
      const VerificationMeta('colaboradorid');
  @override
  late final GeneratedColumn<int> colaboradorid = GeneratedColumn<int>(
      'colaboradorid', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _descricaoproblemaresolvidoMeta =
      const VerificationMeta('descricaoproblemaresolvido');
  @override
  late final GeneratedColumn<String> descricaoproblemaresolvido =
      GeneratedColumn<String>('descricaoproblemaresolvido', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 0, maxTextLength: 450),
          type: DriftSqlType.string,
          requiredDuringInsert: false);
  static const VerificationMeta _dataresolucaoMeta =
      const VerificationMeta('dataresolucao');
  @override
  late final GeneratedColumn<DateTime> dataresolucao =
      GeneratedColumn<DateTime>('dataresolucao', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _avaliacaoresolucaoMeta =
      const VerificationMeta('avaliacaoresolucao');
  @override
  late final GeneratedColumn<int> avaliacaoresolucao = GeneratedColumn<int>(
      'avaliacaoresolucao', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        resolucaoid,
        colaboradorid,
        descricaoproblemaresolvido,
        dataresolucao,
        avaliacaoresolucao
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'resolucaoproblemas';
  @override
  VerificationContext validateIntegrity(Insertable<Resolucaoproblemas> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('resolucaoid')) {
      context.handle(
          _resolucaoidMeta,
          resolucaoid.isAcceptableOrUnknown(
              data['resolucaoid']!, _resolucaoidMeta));
    }
    if (data.containsKey('colaboradorid')) {
      context.handle(
          _colaboradoridMeta,
          colaboradorid.isAcceptableOrUnknown(
              data['colaboradorid']!, _colaboradoridMeta));
    }
    if (data.containsKey('descricaoproblemaresolvido')) {
      context.handle(
          _descricaoproblemaresolvidoMeta,
          descricaoproblemaresolvido.isAcceptableOrUnknown(
              data['descricaoproblemaresolvido']!,
              _descricaoproblemaresolvidoMeta));
    }
    if (data.containsKey('dataresolucao')) {
      context.handle(
          _dataresolucaoMeta,
          dataresolucao.isAcceptableOrUnknown(
              data['dataresolucao']!, _dataresolucaoMeta));
    }
    if (data.containsKey('avaliacaoresolucao')) {
      context.handle(
          _avaliacaoresolucaoMeta,
          avaliacaoresolucao.isAcceptableOrUnknown(
              data['avaliacaoresolucao']!, _avaliacaoresolucaoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {resolucaoid};
  @override
  Resolucaoproblemas map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Resolucaoproblemas(
      resolucaoid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}resolucaoid']),
      colaboradorid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}colaboradorid']),
      descricaoproblemaresolvido: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}descricaoproblemaresolvido']),
      dataresolucao: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dataresolucao']),
      avaliacaoresolucao: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}avaliacaoresolucao']),
    );
  }

  @override
  $ResolucaoproblemassTable createAlias(String alias) {
    return $ResolucaoproblemassTable(attachedDatabase, alias);
  }
}

class Resolucaoproblemas extends DataClass
    implements Insertable<Resolucaoproblemas> {
  final int? resolucaoid;
  final int? colaboradorid;
  final String? descricaoproblemaresolvido;
  final DateTime? dataresolucao;
  final int? avaliacaoresolucao;
  const Resolucaoproblemas(
      {this.resolucaoid,
      this.colaboradorid,
      this.descricaoproblemaresolvido,
      this.dataresolucao,
      this.avaliacaoresolucao});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || resolucaoid != null) {
      map['resolucaoid'] = Variable<int>(resolucaoid);
    }
    if (!nullToAbsent || colaboradorid != null) {
      map['colaboradorid'] = Variable<int>(colaboradorid);
    }
    if (!nullToAbsent || descricaoproblemaresolvido != null) {
      map['descricaoproblemaresolvido'] =
          Variable<String>(descricaoproblemaresolvido);
    }
    if (!nullToAbsent || dataresolucao != null) {
      map['dataresolucao'] = Variable<DateTime>(dataresolucao);
    }
    if (!nullToAbsent || avaliacaoresolucao != null) {
      map['avaliacaoresolucao'] = Variable<int>(avaliacaoresolucao);
    }
    return map;
  }

  factory Resolucaoproblemas.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Resolucaoproblemas(
      resolucaoid: serializer.fromJson<int?>(json['resolucaoid']),
      colaboradorid: serializer.fromJson<int?>(json['colaboradorid']),
      descricaoproblemaresolvido:
          serializer.fromJson<String?>(json['descricaoproblemaresolvido']),
      dataresolucao: serializer.fromJson<DateTime?>(json['dataresolucao']),
      avaliacaoresolucao: serializer.fromJson<int?>(json['avaliacaoresolucao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'resolucaoid': serializer.toJson<int?>(resolucaoid),
      'colaboradorid': serializer.toJson<int?>(colaboradorid),
      'descricaoproblemaresolvido':
          serializer.toJson<String?>(descricaoproblemaresolvido),
      'dataresolucao': serializer.toJson<DateTime?>(dataresolucao),
      'avaliacaoresolucao': serializer.toJson<int?>(avaliacaoresolucao),
    };
  }

  Resolucaoproblemas copyWith(
          {Value<int?> resolucaoid = const Value.absent(),
          Value<int?> colaboradorid = const Value.absent(),
          Value<String?> descricaoproblemaresolvido = const Value.absent(),
          Value<DateTime?> dataresolucao = const Value.absent(),
          Value<int?> avaliacaoresolucao = const Value.absent()}) =>
      Resolucaoproblemas(
        resolucaoid: resolucaoid.present ? resolucaoid.value : this.resolucaoid,
        colaboradorid:
            colaboradorid.present ? colaboradorid.value : this.colaboradorid,
        descricaoproblemaresolvido: descricaoproblemaresolvido.present
            ? descricaoproblemaresolvido.value
            : this.descricaoproblemaresolvido,
        dataresolucao:
            dataresolucao.present ? dataresolucao.value : this.dataresolucao,
        avaliacaoresolucao: avaliacaoresolucao.present
            ? avaliacaoresolucao.value
            : this.avaliacaoresolucao,
      );
  Resolucaoproblemas copyWithCompanion(ResolucaoproblemassCompanion data) {
    return Resolucaoproblemas(
      resolucaoid:
          data.resolucaoid.present ? data.resolucaoid.value : this.resolucaoid,
      colaboradorid: data.colaboradorid.present
          ? data.colaboradorid.value
          : this.colaboradorid,
      descricaoproblemaresolvido: data.descricaoproblemaresolvido.present
          ? data.descricaoproblemaresolvido.value
          : this.descricaoproblemaresolvido,
      dataresolucao: data.dataresolucao.present
          ? data.dataresolucao.value
          : this.dataresolucao,
      avaliacaoresolucao: data.avaliacaoresolucao.present
          ? data.avaliacaoresolucao.value
          : this.avaliacaoresolucao,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Resolucaoproblemas(')
          ..write('resolucaoid: $resolucaoid, ')
          ..write('colaboradorid: $colaboradorid, ')
          ..write('descricaoproblemaresolvido: $descricaoproblemaresolvido, ')
          ..write('dataresolucao: $dataresolucao, ')
          ..write('avaliacaoresolucao: $avaliacaoresolucao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(resolucaoid, colaboradorid,
      descricaoproblemaresolvido, dataresolucao, avaliacaoresolucao);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Resolucaoproblemas &&
          other.resolucaoid == this.resolucaoid &&
          other.colaboradorid == this.colaboradorid &&
          other.descricaoproblemaresolvido == this.descricaoproblemaresolvido &&
          other.dataresolucao == this.dataresolucao &&
          other.avaliacaoresolucao == this.avaliacaoresolucao);
}

class ResolucaoproblemassCompanion extends UpdateCompanion<Resolucaoproblemas> {
  final Value<int?> resolucaoid;
  final Value<int?> colaboradorid;
  final Value<String?> descricaoproblemaresolvido;
  final Value<DateTime?> dataresolucao;
  final Value<int?> avaliacaoresolucao;
  const ResolucaoproblemassCompanion({
    this.resolucaoid = const Value.absent(),
    this.colaboradorid = const Value.absent(),
    this.descricaoproblemaresolvido = const Value.absent(),
    this.dataresolucao = const Value.absent(),
    this.avaliacaoresolucao = const Value.absent(),
  });
  ResolucaoproblemassCompanion.insert({
    this.resolucaoid = const Value.absent(),
    this.colaboradorid = const Value.absent(),
    this.descricaoproblemaresolvido = const Value.absent(),
    this.dataresolucao = const Value.absent(),
    this.avaliacaoresolucao = const Value.absent(),
  });
  static Insertable<Resolucaoproblemas> custom({
    Expression<int>? resolucaoid,
    Expression<int>? colaboradorid,
    Expression<String>? descricaoproblemaresolvido,
    Expression<DateTime>? dataresolucao,
    Expression<int>? avaliacaoresolucao,
  }) {
    return RawValuesInsertable({
      if (resolucaoid != null) 'resolucaoid': resolucaoid,
      if (colaboradorid != null) 'colaboradorid': colaboradorid,
      if (descricaoproblemaresolvido != null)
        'descricaoproblemaresolvido': descricaoproblemaresolvido,
      if (dataresolucao != null) 'dataresolucao': dataresolucao,
      if (avaliacaoresolucao != null) 'avaliacaoresolucao': avaliacaoresolucao,
    });
  }

  ResolucaoproblemassCompanion copyWith(
      {Value<int?>? resolucaoid,
      Value<int?>? colaboradorid,
      Value<String?>? descricaoproblemaresolvido,
      Value<DateTime?>? dataresolucao,
      Value<int?>? avaliacaoresolucao}) {
    return ResolucaoproblemassCompanion(
      resolucaoid: resolucaoid ?? this.resolucaoid,
      colaboradorid: colaboradorid ?? this.colaboradorid,
      descricaoproblemaresolvido:
          descricaoproblemaresolvido ?? this.descricaoproblemaresolvido,
      dataresolucao: dataresolucao ?? this.dataresolucao,
      avaliacaoresolucao: avaliacaoresolucao ?? this.avaliacaoresolucao,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (resolucaoid.present) {
      map['resolucaoid'] = Variable<int>(resolucaoid.value);
    }
    if (colaboradorid.present) {
      map['colaboradorid'] = Variable<int>(colaboradorid.value);
    }
    if (descricaoproblemaresolvido.present) {
      map['descricaoproblemaresolvido'] =
          Variable<String>(descricaoproblemaresolvido.value);
    }
    if (dataresolucao.present) {
      map['dataresolucao'] = Variable<DateTime>(dataresolucao.value);
    }
    if (avaliacaoresolucao.present) {
      map['avaliacaoresolucao'] = Variable<int>(avaliacaoresolucao.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResolucaoproblemassCompanion(')
          ..write('resolucaoid: $resolucaoid, ')
          ..write('colaboradorid: $colaboradorid, ')
          ..write('descricaoproblemaresolvido: $descricaoproblemaresolvido, ')
          ..write('dataresolucao: $dataresolucao, ')
          ..write('avaliacaoresolucao: $avaliacaoresolucao')
          ..write(')'))
        .toString();
  }
}

class $AssiduidadepontualidadesTable extends Assiduidadepontualidades
    with TableInfo<$AssiduidadepontualidadesTable, Assiduidadepontualidade> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssiduidadepontualidadesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _assiduidadeidMeta =
      const VerificationMeta('assiduidadeid');
  @override
  late final GeneratedColumn<int> assiduidadeid = GeneratedColumn<int>(
      'assiduidadeid', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _colaboradoridMeta =
      const VerificationMeta('colaboradorid');
  @override
  late final GeneratedColumn<int> colaboradorid = GeneratedColumn<int>(
      'colaboradorid', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _faltasinjustificadasMeta =
      const VerificationMeta('faltasinjustificadas');
  @override
  late final GeneratedColumn<int> faltasinjustificadas = GeneratedColumn<int>(
      'faltasinjustificadas', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _atrasosMeta =
      const VerificationMeta('atrasos');
  @override
  late final GeneratedColumn<int> atrasos = GeneratedColumn<int>(
      'atrasos', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dataregistroMeta =
      const VerificationMeta('dataregistro');
  @override
  late final GeneratedColumn<DateTime> dataregistro = GeneratedColumn<DateTime>(
      'dataregistro', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        assiduidadeid,
        colaboradorid,
        faltasinjustificadas,
        atrasos,
        dataregistro
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assiduidadepontualidade';
  @override
  VerificationContext validateIntegrity(
      Insertable<Assiduidadepontualidade> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('assiduidadeid')) {
      context.handle(
          _assiduidadeidMeta,
          assiduidadeid.isAcceptableOrUnknown(
              data['assiduidadeid']!, _assiduidadeidMeta));
    }
    if (data.containsKey('colaboradorid')) {
      context.handle(
          _colaboradoridMeta,
          colaboradorid.isAcceptableOrUnknown(
              data['colaboradorid']!, _colaboradoridMeta));
    }
    if (data.containsKey('faltasinjustificadas')) {
      context.handle(
          _faltasinjustificadasMeta,
          faltasinjustificadas.isAcceptableOrUnknown(
              data['faltasinjustificadas']!, _faltasinjustificadasMeta));
    }
    if (data.containsKey('atrasos')) {
      context.handle(_atrasosMeta,
          atrasos.isAcceptableOrUnknown(data['atrasos']!, _atrasosMeta));
    }
    if (data.containsKey('dataregistro')) {
      context.handle(
          _dataregistroMeta,
          dataregistro.isAcceptableOrUnknown(
              data['dataregistro']!, _dataregistroMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {assiduidadeid};
  @override
  Assiduidadepontualidade map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Assiduidadepontualidade(
      assiduidadeid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}assiduidadeid']),
      colaboradorid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}colaboradorid']),
      faltasinjustificadas: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}faltasinjustificadas']),
      atrasos: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}atrasos']),
      dataregistro: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dataregistro']),
    );
  }

  @override
  $AssiduidadepontualidadesTable createAlias(String alias) {
    return $AssiduidadepontualidadesTable(attachedDatabase, alias);
  }
}

class Assiduidadepontualidade extends DataClass
    implements Insertable<Assiduidadepontualidade> {
  final int? assiduidadeid;
  final int? colaboradorid;
  final int? faltasinjustificadas;
  final int? atrasos;
  final DateTime? dataregistro;
  const Assiduidadepontualidade(
      {this.assiduidadeid,
      this.colaboradorid,
      this.faltasinjustificadas,
      this.atrasos,
      this.dataregistro});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || assiduidadeid != null) {
      map['assiduidadeid'] = Variable<int>(assiduidadeid);
    }
    if (!nullToAbsent || colaboradorid != null) {
      map['colaboradorid'] = Variable<int>(colaboradorid);
    }
    if (!nullToAbsent || faltasinjustificadas != null) {
      map['faltasinjustificadas'] = Variable<int>(faltasinjustificadas);
    }
    if (!nullToAbsent || atrasos != null) {
      map['atrasos'] = Variable<int>(atrasos);
    }
    if (!nullToAbsent || dataregistro != null) {
      map['dataregistro'] = Variable<DateTime>(dataregistro);
    }
    return map;
  }

  factory Assiduidadepontualidade.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Assiduidadepontualidade(
      assiduidadeid: serializer.fromJson<int?>(json['assiduidadeid']),
      colaboradorid: serializer.fromJson<int?>(json['colaboradorid']),
      faltasinjustificadas:
          serializer.fromJson<int?>(json['faltasinjustificadas']),
      atrasos: serializer.fromJson<int?>(json['atrasos']),
      dataregistro: serializer.fromJson<DateTime?>(json['dataregistro']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'assiduidadeid': serializer.toJson<int?>(assiduidadeid),
      'colaboradorid': serializer.toJson<int?>(colaboradorid),
      'faltasinjustificadas': serializer.toJson<int?>(faltasinjustificadas),
      'atrasos': serializer.toJson<int?>(atrasos),
      'dataregistro': serializer.toJson<DateTime?>(dataregistro),
    };
  }

  Assiduidadepontualidade copyWith(
          {Value<int?> assiduidadeid = const Value.absent(),
          Value<int?> colaboradorid = const Value.absent(),
          Value<int?> faltasinjustificadas = const Value.absent(),
          Value<int?> atrasos = const Value.absent(),
          Value<DateTime?> dataregistro = const Value.absent()}) =>
      Assiduidadepontualidade(
        assiduidadeid:
            assiduidadeid.present ? assiduidadeid.value : this.assiduidadeid,
        colaboradorid:
            colaboradorid.present ? colaboradorid.value : this.colaboradorid,
        faltasinjustificadas: faltasinjustificadas.present
            ? faltasinjustificadas.value
            : this.faltasinjustificadas,
        atrasos: atrasos.present ? atrasos.value : this.atrasos,
        dataregistro:
            dataregistro.present ? dataregistro.value : this.dataregistro,
      );
  Assiduidadepontualidade copyWithCompanion(
      AssiduidadepontualidadesCompanion data) {
    return Assiduidadepontualidade(
      assiduidadeid: data.assiduidadeid.present
          ? data.assiduidadeid.value
          : this.assiduidadeid,
      colaboradorid: data.colaboradorid.present
          ? data.colaboradorid.value
          : this.colaboradorid,
      faltasinjustificadas: data.faltasinjustificadas.present
          ? data.faltasinjustificadas.value
          : this.faltasinjustificadas,
      atrasos: data.atrasos.present ? data.atrasos.value : this.atrasos,
      dataregistro: data.dataregistro.present
          ? data.dataregistro.value
          : this.dataregistro,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Assiduidadepontualidade(')
          ..write('assiduidadeid: $assiduidadeid, ')
          ..write('colaboradorid: $colaboradorid, ')
          ..write('faltasinjustificadas: $faltasinjustificadas, ')
          ..write('atrasos: $atrasos, ')
          ..write('dataregistro: $dataregistro')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(assiduidadeid, colaboradorid,
      faltasinjustificadas, atrasos, dataregistro);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Assiduidadepontualidade &&
          other.assiduidadeid == this.assiduidadeid &&
          other.colaboradorid == this.colaboradorid &&
          other.faltasinjustificadas == this.faltasinjustificadas &&
          other.atrasos == this.atrasos &&
          other.dataregistro == this.dataregistro);
}

class AssiduidadepontualidadesCompanion
    extends UpdateCompanion<Assiduidadepontualidade> {
  final Value<int?> assiduidadeid;
  final Value<int?> colaboradorid;
  final Value<int?> faltasinjustificadas;
  final Value<int?> atrasos;
  final Value<DateTime?> dataregistro;
  const AssiduidadepontualidadesCompanion({
    this.assiduidadeid = const Value.absent(),
    this.colaboradorid = const Value.absent(),
    this.faltasinjustificadas = const Value.absent(),
    this.atrasos = const Value.absent(),
    this.dataregistro = const Value.absent(),
  });
  AssiduidadepontualidadesCompanion.insert({
    this.assiduidadeid = const Value.absent(),
    this.colaboradorid = const Value.absent(),
    this.faltasinjustificadas = const Value.absent(),
    this.atrasos = const Value.absent(),
    this.dataregistro = const Value.absent(),
  });
  static Insertable<Assiduidadepontualidade> custom({
    Expression<int>? assiduidadeid,
    Expression<int>? colaboradorid,
    Expression<int>? faltasinjustificadas,
    Expression<int>? atrasos,
    Expression<DateTime>? dataregistro,
  }) {
    return RawValuesInsertable({
      if (assiduidadeid != null) 'assiduidadeid': assiduidadeid,
      if (colaboradorid != null) 'colaboradorid': colaboradorid,
      if (faltasinjustificadas != null)
        'faltasinjustificadas': faltasinjustificadas,
      if (atrasos != null) 'atrasos': atrasos,
      if (dataregistro != null) 'dataregistro': dataregistro,
    });
  }

  AssiduidadepontualidadesCompanion copyWith(
      {Value<int?>? assiduidadeid,
      Value<int?>? colaboradorid,
      Value<int?>? faltasinjustificadas,
      Value<int?>? atrasos,
      Value<DateTime?>? dataregistro}) {
    return AssiduidadepontualidadesCompanion(
      assiduidadeid: assiduidadeid ?? this.assiduidadeid,
      colaboradorid: colaboradorid ?? this.colaboradorid,
      faltasinjustificadas: faltasinjustificadas ?? this.faltasinjustificadas,
      atrasos: atrasos ?? this.atrasos,
      dataregistro: dataregistro ?? this.dataregistro,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (assiduidadeid.present) {
      map['assiduidadeid'] = Variable<int>(assiduidadeid.value);
    }
    if (colaboradorid.present) {
      map['colaboradorid'] = Variable<int>(colaboradorid.value);
    }
    if (faltasinjustificadas.present) {
      map['faltasinjustificadas'] = Variable<int>(faltasinjustificadas.value);
    }
    if (atrasos.present) {
      map['atrasos'] = Variable<int>(atrasos.value);
    }
    if (dataregistro.present) {
      map['dataregistro'] = Variable<DateTime>(dataregistro.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssiduidadepontualidadesCompanion(')
          ..write('assiduidadeid: $assiduidadeid, ')
          ..write('colaboradorid: $colaboradorid, ')
          ..write('faltasinjustificadas: $faltasinjustificadas, ')
          ..write('atrasos: $atrasos, ')
          ..write('dataregistro: $dataregistro')
          ..write(')'))
        .toString();
  }
}

class $ColaboradoressTable extends Colaboradoress
    with TableInfo<$ColaboradoressTable, Colaboradores> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ColaboradoressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _colaboradoridMeta =
      const VerificationMeta('colaboradorid');
  @override
  late final GeneratedColumn<int> colaboradorid = GeneratedColumn<int>(
      'colaboradorid', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _cargoatualMeta =
      const VerificationMeta('cargoatual');
  @override
  late final GeneratedColumn<String> cargoatual = GeneratedColumn<String>(
      'cargoatual', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _dataadmissaoMeta =
      const VerificationMeta('dataadmissao');
  @override
  late final GeneratedColumn<DateTime> dataadmissao = GeneratedColumn<DateTime>(
      'dataadmissao', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _experienciaatualMeta =
      const VerificationMeta('experienciaatual');
  @override
  late final GeneratedColumn<int> experienciaatual = GeneratedColumn<int>(
      'experienciaatual', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _telefoneMeta =
      const VerificationMeta('telefone');
  @override
  late final GeneratedColumn<String> telefone = GeneratedColumn<String>(
      'telefone', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        colaboradorid,
        nome,
        cargoatual,
        dataadmissao,
        experienciaatual,
        telefone,
        status
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'colaboradores';
  @override
  VerificationContext validateIntegrity(Insertable<Colaboradores> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('colaboradorid')) {
      context.handle(
          _colaboradoridMeta,
          colaboradorid.isAcceptableOrUnknown(
              data['colaboradorid']!, _colaboradoridMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    }
    if (data.containsKey('cargoatual')) {
      context.handle(
          _cargoatualMeta,
          cargoatual.isAcceptableOrUnknown(
              data['cargoatual']!, _cargoatualMeta));
    }
    if (data.containsKey('dataadmissao')) {
      context.handle(
          _dataadmissaoMeta,
          dataadmissao.isAcceptableOrUnknown(
              data['dataadmissao']!, _dataadmissaoMeta));
    }
    if (data.containsKey('experienciaatual')) {
      context.handle(
          _experienciaatualMeta,
          experienciaatual.isAcceptableOrUnknown(
              data['experienciaatual']!, _experienciaatualMeta));
    }
    if (data.containsKey('telefone')) {
      context.handle(_telefoneMeta,
          telefone.isAcceptableOrUnknown(data['telefone']!, _telefoneMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {colaboradorid};
  @override
  Colaboradores map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Colaboradores(
      colaboradorid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}colaboradorid']),
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome']),
      cargoatual: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cargoatual']),
      dataadmissao: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dataadmissao']),
      experienciaatual: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}experienciaatual']),
      telefone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}telefone']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status']),
    );
  }

  @override
  $ColaboradoressTable createAlias(String alias) {
    return $ColaboradoressTable(attachedDatabase, alias);
  }
}

class Colaboradores extends DataClass implements Insertable<Colaboradores> {
  final int? colaboradorid;
  final String? nome;
  final String? cargoatual;
  final DateTime? dataadmissao;
  final int? experienciaatual;
  final String? telefone;
  final String? status;
  const Colaboradores(
      {this.colaboradorid,
      this.nome,
      this.cargoatual,
      this.dataadmissao,
      this.experienciaatual,
      this.telefone,
      this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || colaboradorid != null) {
      map['colaboradorid'] = Variable<int>(colaboradorid);
    }
    if (!nullToAbsent || nome != null) {
      map['nome'] = Variable<String>(nome);
    }
    if (!nullToAbsent || cargoatual != null) {
      map['cargoatual'] = Variable<String>(cargoatual);
    }
    if (!nullToAbsent || dataadmissao != null) {
      map['dataadmissao'] = Variable<DateTime>(dataadmissao);
    }
    if (!nullToAbsent || experienciaatual != null) {
      map['experienciaatual'] = Variable<int>(experienciaatual);
    }
    if (!nullToAbsent || telefone != null) {
      map['telefone'] = Variable<String>(telefone);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    return map;
  }

  factory Colaboradores.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Colaboradores(
      colaboradorid: serializer.fromJson<int?>(json['colaboradorid']),
      nome: serializer.fromJson<String?>(json['nome']),
      cargoatual: serializer.fromJson<String?>(json['cargoatual']),
      dataadmissao: serializer.fromJson<DateTime?>(json['dataadmissao']),
      experienciaatual: serializer.fromJson<int?>(json['experienciaatual']),
      telefone: serializer.fromJson<String?>(json['telefone']),
      status: serializer.fromJson<String?>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'colaboradorid': serializer.toJson<int?>(colaboradorid),
      'nome': serializer.toJson<String?>(nome),
      'cargoatual': serializer.toJson<String?>(cargoatual),
      'dataadmissao': serializer.toJson<DateTime?>(dataadmissao),
      'experienciaatual': serializer.toJson<int?>(experienciaatual),
      'telefone': serializer.toJson<String?>(telefone),
      'status': serializer.toJson<String?>(status),
    };
  }

  Colaboradores copyWith(
          {Value<int?> colaboradorid = const Value.absent(),
          Value<String?> nome = const Value.absent(),
          Value<String?> cargoatual = const Value.absent(),
          Value<DateTime?> dataadmissao = const Value.absent(),
          Value<int?> experienciaatual = const Value.absent(),
          Value<String?> telefone = const Value.absent(),
          Value<String?> status = const Value.absent()}) =>
      Colaboradores(
        colaboradorid:
            colaboradorid.present ? colaboradorid.value : this.colaboradorid,
        nome: nome.present ? nome.value : this.nome,
        cargoatual: cargoatual.present ? cargoatual.value : this.cargoatual,
        dataadmissao:
            dataadmissao.present ? dataadmissao.value : this.dataadmissao,
        experienciaatual: experienciaatual.present
            ? experienciaatual.value
            : this.experienciaatual,
        telefone: telefone.present ? telefone.value : this.telefone,
        status: status.present ? status.value : this.status,
      );
  Colaboradores copyWithCompanion(ColaboradoressCompanion data) {
    return Colaboradores(
      colaboradorid: data.colaboradorid.present
          ? data.colaboradorid.value
          : this.colaboradorid,
      nome: data.nome.present ? data.nome.value : this.nome,
      cargoatual:
          data.cargoatual.present ? data.cargoatual.value : this.cargoatual,
      dataadmissao: data.dataadmissao.present
          ? data.dataadmissao.value
          : this.dataadmissao,
      experienciaatual: data.experienciaatual.present
          ? data.experienciaatual.value
          : this.experienciaatual,
      telefone: data.telefone.present ? data.telefone.value : this.telefone,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Colaboradores(')
          ..write('colaboradorid: $colaboradorid, ')
          ..write('nome: $nome, ')
          ..write('cargoatual: $cargoatual, ')
          ..write('dataadmissao: $dataadmissao, ')
          ..write('experienciaatual: $experienciaatual, ')
          ..write('telefone: $telefone, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(colaboradorid, nome, cargoatual, dataadmissao,
      experienciaatual, telefone, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Colaboradores &&
          other.colaboradorid == this.colaboradorid &&
          other.nome == this.nome &&
          other.cargoatual == this.cargoatual &&
          other.dataadmissao == this.dataadmissao &&
          other.experienciaatual == this.experienciaatual &&
          other.telefone == this.telefone &&
          other.status == this.status);
}

class ColaboradoressCompanion extends UpdateCompanion<Colaboradores> {
  final Value<int?> colaboradorid;
  final Value<String?> nome;
  final Value<String?> cargoatual;
  final Value<DateTime?> dataadmissao;
  final Value<int?> experienciaatual;
  final Value<String?> telefone;
  final Value<String?> status;
  const ColaboradoressCompanion({
    this.colaboradorid = const Value.absent(),
    this.nome = const Value.absent(),
    this.cargoatual = const Value.absent(),
    this.dataadmissao = const Value.absent(),
    this.experienciaatual = const Value.absent(),
    this.telefone = const Value.absent(),
    this.status = const Value.absent(),
  });
  ColaboradoressCompanion.insert({
    this.colaboradorid = const Value.absent(),
    this.nome = const Value.absent(),
    this.cargoatual = const Value.absent(),
    this.dataadmissao = const Value.absent(),
    this.experienciaatual = const Value.absent(),
    this.telefone = const Value.absent(),
    this.status = const Value.absent(),
  });
  static Insertable<Colaboradores> custom({
    Expression<int>? colaboradorid,
    Expression<String>? nome,
    Expression<String>? cargoatual,
    Expression<DateTime>? dataadmissao,
    Expression<int>? experienciaatual,
    Expression<String>? telefone,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (colaboradorid != null) 'colaboradorid': colaboradorid,
      if (nome != null) 'nome': nome,
      if (cargoatual != null) 'cargoatual': cargoatual,
      if (dataadmissao != null) 'dataadmissao': dataadmissao,
      if (experienciaatual != null) 'experienciaatual': experienciaatual,
      if (telefone != null) 'telefone': telefone,
      if (status != null) 'status': status,
    });
  }

  ColaboradoressCompanion copyWith(
      {Value<int?>? colaboradorid,
      Value<String?>? nome,
      Value<String?>? cargoatual,
      Value<DateTime?>? dataadmissao,
      Value<int?>? experienciaatual,
      Value<String?>? telefone,
      Value<String?>? status}) {
    return ColaboradoressCompanion(
      colaboradorid: colaboradorid ?? this.colaboradorid,
      nome: nome ?? this.nome,
      cargoatual: cargoatual ?? this.cargoatual,
      dataadmissao: dataadmissao ?? this.dataadmissao,
      experienciaatual: experienciaatual ?? this.experienciaatual,
      telefone: telefone ?? this.telefone,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (colaboradorid.present) {
      map['colaboradorid'] = Variable<int>(colaboradorid.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (cargoatual.present) {
      map['cargoatual'] = Variable<String>(cargoatual.value);
    }
    if (dataadmissao.present) {
      map['dataadmissao'] = Variable<DateTime>(dataadmissao.value);
    }
    if (experienciaatual.present) {
      map['experienciaatual'] = Variable<int>(experienciaatual.value);
    }
    if (telefone.present) {
      map['telefone'] = Variable<String>(telefone.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ColaboradoressCompanion(')
          ..write('colaboradorid: $colaboradorid, ')
          ..write('nome: $nome, ')
          ..write('cargoatual: $cargoatual, ')
          ..write('dataadmissao: $dataadmissao, ')
          ..write('experienciaatual: $experienciaatual, ')
          ..write('telefone: $telefone, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $SupervisoressTable extends Supervisoress
    with TableInfo<$SupervisoressTable, Supervisores> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SupervisoressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _supervisoridMeta =
      const VerificationMeta('supervisorid');
  @override
  late final GeneratedColumn<int> supervisorid = GeneratedColumn<int>(
      'supervisorid', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _cargoMeta = const VerificationMeta('cargo');
  @override
  late final GeneratedColumn<String> cargo = GeneratedColumn<String>(
      'cargo', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _telefoneMeta =
      const VerificationMeta('telefone');
  @override
  late final GeneratedColumn<String> telefone = GeneratedColumn<String>(
      'telefone', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _dataadmissaoMeta =
      const VerificationMeta('dataadmissao');
  @override
  late final GeneratedColumn<DateTime> dataadmissao = GeneratedColumn<DateTime>(
      'dataadmissao', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [supervisorid, nome, cargo, email, telefone, dataadmissao, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'supervisores';
  @override
  VerificationContext validateIntegrity(Insertable<Supervisores> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('supervisorid')) {
      context.handle(
          _supervisoridMeta,
          supervisorid.isAcceptableOrUnknown(
              data['supervisorid']!, _supervisoridMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    }
    if (data.containsKey('cargo')) {
      context.handle(
          _cargoMeta, cargo.isAcceptableOrUnknown(data['cargo']!, _cargoMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('telefone')) {
      context.handle(_telefoneMeta,
          telefone.isAcceptableOrUnknown(data['telefone']!, _telefoneMeta));
    }
    if (data.containsKey('dataadmissao')) {
      context.handle(
          _dataadmissaoMeta,
          dataadmissao.isAcceptableOrUnknown(
              data['dataadmissao']!, _dataadmissaoMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {supervisorid};
  @override
  Supervisores map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Supervisores(
      supervisorid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}supervisorid']),
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome']),
      cargo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cargo']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      telefone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}telefone']),
      dataadmissao: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dataadmissao']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status']),
    );
  }

  @override
  $SupervisoressTable createAlias(String alias) {
    return $SupervisoressTable(attachedDatabase, alias);
  }
}

class Supervisores extends DataClass implements Insertable<Supervisores> {
  final int? supervisorid;
  final String? nome;
  final String? cargo;
  final String? email;
  final String? telefone;
  final DateTime? dataadmissao;
  final String? status;
  const Supervisores(
      {this.supervisorid,
      this.nome,
      this.cargo,
      this.email,
      this.telefone,
      this.dataadmissao,
      this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || supervisorid != null) {
      map['supervisorid'] = Variable<int>(supervisorid);
    }
    if (!nullToAbsent || nome != null) {
      map['nome'] = Variable<String>(nome);
    }
    if (!nullToAbsent || cargo != null) {
      map['cargo'] = Variable<String>(cargo);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || telefone != null) {
      map['telefone'] = Variable<String>(telefone);
    }
    if (!nullToAbsent || dataadmissao != null) {
      map['dataadmissao'] = Variable<DateTime>(dataadmissao);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    return map;
  }

  factory Supervisores.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Supervisores(
      supervisorid: serializer.fromJson<int?>(json['supervisorid']),
      nome: serializer.fromJson<String?>(json['nome']),
      cargo: serializer.fromJson<String?>(json['cargo']),
      email: serializer.fromJson<String?>(json['email']),
      telefone: serializer.fromJson<String?>(json['telefone']),
      dataadmissao: serializer.fromJson<DateTime?>(json['dataadmissao']),
      status: serializer.fromJson<String?>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'supervisorid': serializer.toJson<int?>(supervisorid),
      'nome': serializer.toJson<String?>(nome),
      'cargo': serializer.toJson<String?>(cargo),
      'email': serializer.toJson<String?>(email),
      'telefone': serializer.toJson<String?>(telefone),
      'dataadmissao': serializer.toJson<DateTime?>(dataadmissao),
      'status': serializer.toJson<String?>(status),
    };
  }

  Supervisores copyWith(
          {Value<int?> supervisorid = const Value.absent(),
          Value<String?> nome = const Value.absent(),
          Value<String?> cargo = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> telefone = const Value.absent(),
          Value<DateTime?> dataadmissao = const Value.absent(),
          Value<String?> status = const Value.absent()}) =>
      Supervisores(
        supervisorid:
            supervisorid.present ? supervisorid.value : this.supervisorid,
        nome: nome.present ? nome.value : this.nome,
        cargo: cargo.present ? cargo.value : this.cargo,
        email: email.present ? email.value : this.email,
        telefone: telefone.present ? telefone.value : this.telefone,
        dataadmissao:
            dataadmissao.present ? dataadmissao.value : this.dataadmissao,
        status: status.present ? status.value : this.status,
      );
  Supervisores copyWithCompanion(SupervisoressCompanion data) {
    return Supervisores(
      supervisorid: data.supervisorid.present
          ? data.supervisorid.value
          : this.supervisorid,
      nome: data.nome.present ? data.nome.value : this.nome,
      cargo: data.cargo.present ? data.cargo.value : this.cargo,
      email: data.email.present ? data.email.value : this.email,
      telefone: data.telefone.present ? data.telefone.value : this.telefone,
      dataadmissao: data.dataadmissao.present
          ? data.dataadmissao.value
          : this.dataadmissao,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Supervisores(')
          ..write('supervisorid: $supervisorid, ')
          ..write('nome: $nome, ')
          ..write('cargo: $cargo, ')
          ..write('email: $email, ')
          ..write('telefone: $telefone, ')
          ..write('dataadmissao: $dataadmissao, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      supervisorid, nome, cargo, email, telefone, dataadmissao, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Supervisores &&
          other.supervisorid == this.supervisorid &&
          other.nome == this.nome &&
          other.cargo == this.cargo &&
          other.email == this.email &&
          other.telefone == this.telefone &&
          other.dataadmissao == this.dataadmissao &&
          other.status == this.status);
}

class SupervisoressCompanion extends UpdateCompanion<Supervisores> {
  final Value<int?> supervisorid;
  final Value<String?> nome;
  final Value<String?> cargo;
  final Value<String?> email;
  final Value<String?> telefone;
  final Value<DateTime?> dataadmissao;
  final Value<String?> status;
  const SupervisoressCompanion({
    this.supervisorid = const Value.absent(),
    this.nome = const Value.absent(),
    this.cargo = const Value.absent(),
    this.email = const Value.absent(),
    this.telefone = const Value.absent(),
    this.dataadmissao = const Value.absent(),
    this.status = const Value.absent(),
  });
  SupervisoressCompanion.insert({
    this.supervisorid = const Value.absent(),
    this.nome = const Value.absent(),
    this.cargo = const Value.absent(),
    this.email = const Value.absent(),
    this.telefone = const Value.absent(),
    this.dataadmissao = const Value.absent(),
    this.status = const Value.absent(),
  });
  static Insertable<Supervisores> custom({
    Expression<int>? supervisorid,
    Expression<String>? nome,
    Expression<String>? cargo,
    Expression<String>? email,
    Expression<String>? telefone,
    Expression<DateTime>? dataadmissao,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (supervisorid != null) 'supervisorid': supervisorid,
      if (nome != null) 'nome': nome,
      if (cargo != null) 'cargo': cargo,
      if (email != null) 'email': email,
      if (telefone != null) 'telefone': telefone,
      if (dataadmissao != null) 'dataadmissao': dataadmissao,
      if (status != null) 'status': status,
    });
  }

  SupervisoressCompanion copyWith(
      {Value<int?>? supervisorid,
      Value<String?>? nome,
      Value<String?>? cargo,
      Value<String?>? email,
      Value<String?>? telefone,
      Value<DateTime?>? dataadmissao,
      Value<String?>? status}) {
    return SupervisoressCompanion(
      supervisorid: supervisorid ?? this.supervisorid,
      nome: nome ?? this.nome,
      cargo: cargo ?? this.cargo,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
      dataadmissao: dataadmissao ?? this.dataadmissao,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (supervisorid.present) {
      map['supervisorid'] = Variable<int>(supervisorid.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (cargo.present) {
      map['cargo'] = Variable<String>(cargo.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (telefone.present) {
      map['telefone'] = Variable<String>(telefone.value);
    }
    if (dataadmissao.present) {
      map['dataadmissao'] = Variable<DateTime>(dataadmissao.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SupervisoressCompanion(')
          ..write('supervisorid: $supervisorid, ')
          ..write('nome: $nome, ')
          ..write('cargo: $cargo, ')
          ..write('email: $email, ')
          ..write('telefone: $telefone, ')
          ..write('dataadmissao: $dataadmissao, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ConhecimentotecnicosTable conhecimentotecnicos =
      $ConhecimentotecnicosTable(this);
  late final $EngajamentoproatividadesTable engajamentoproatividades =
      $EngajamentoproatividadesTable(this);
  late final $CapacidadecomunicacaosTable capacidadecomunicacaos =
      $CapacidadecomunicacaosTable(this);
  late final $ResultadosatingidossTable resultadosatingidoss =
      $ResultadosatingidossTable(this);
  late final $CapacitacaotreinamentossTable capacitacaotreinamentoss =
      $CapacitacaotreinamentossTable(this);
  late final $FeedbacksupervisoressTable feedbacksupervisoress =
      $FeedbacksupervisoressTable(this);
  late final $ResolucaoproblemassTable resolucaoproblemass =
      $ResolucaoproblemassTable(this);
  late final $AssiduidadepontualidadesTable assiduidadepontualidades =
      $AssiduidadepontualidadesTable(this);
  late final $ColaboradoressTable colaboradoress = $ColaboradoressTable(this);
  late final $SupervisoressTable supervisoress = $SupervisoressTable(this);
  late final ColaboradoresDao colaboradoresDao =
      ColaboradoresDao(this as AppDatabase);
  late final SupervisoresDao supervisoresDao =
      SupervisoresDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        conhecimentotecnicos,
        engajamentoproatividades,
        capacidadecomunicacaos,
        resultadosatingidoss,
        capacitacaotreinamentoss,
        feedbacksupervisoress,
        resolucaoproblemass,
        assiduidadepontualidades,
        colaboradoress,
        supervisoress
      ];
}

typedef $$ConhecimentotecnicosTableCreateCompanionBuilder
    = ConhecimentotecnicosCompanion Function({
  Value<int?> conhecimentoid,
  Value<int?> colaboradorid,
  Value<String?> descricaoconhecimento,
  Value<String?> nivelconhecimento,
  Value<DateTime?> dataavaliacao,
});
typedef $$ConhecimentotecnicosTableUpdateCompanionBuilder
    = ConhecimentotecnicosCompanion Function({
  Value<int?> conhecimentoid,
  Value<int?> colaboradorid,
  Value<String?> descricaoconhecimento,
  Value<String?> nivelconhecimento,
  Value<DateTime?> dataavaliacao,
});

class $$ConhecimentotecnicosTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ConhecimentotecnicosTable> {
  $$ConhecimentotecnicosTableFilterComposer(super.$state);
  ColumnFilters<int> get conhecimentoid => $state.composableBuilder(
      column: $state.table.conhecimentoid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get colaboradorid => $state.composableBuilder(
      column: $state.table.colaboradorid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get descricaoconhecimento => $state.composableBuilder(
      column: $state.table.descricaoconhecimento,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nivelconhecimento => $state.composableBuilder(
      column: $state.table.nivelconhecimento,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get dataavaliacao => $state.composableBuilder(
      column: $state.table.dataavaliacao,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ConhecimentotecnicosTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ConhecimentotecnicosTable> {
  $$ConhecimentotecnicosTableOrderingComposer(super.$state);
  ColumnOrderings<int> get conhecimentoid => $state.composableBuilder(
      column: $state.table.conhecimentoid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get colaboradorid => $state.composableBuilder(
      column: $state.table.colaboradorid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get descricaoconhecimento => $state.composableBuilder(
      column: $state.table.descricaoconhecimento,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nivelconhecimento => $state.composableBuilder(
      column: $state.table.nivelconhecimento,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get dataavaliacao => $state.composableBuilder(
      column: $state.table.dataavaliacao,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ConhecimentotecnicosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ConhecimentotecnicosTable,
    Conhecimentotecnico,
    $$ConhecimentotecnicosTableFilterComposer,
    $$ConhecimentotecnicosTableOrderingComposer,
    $$ConhecimentotecnicosTableCreateCompanionBuilder,
    $$ConhecimentotecnicosTableUpdateCompanionBuilder,
    (
      Conhecimentotecnico,
      BaseReferences<_$AppDatabase, $ConhecimentotecnicosTable,
          Conhecimentotecnico>
    ),
    Conhecimentotecnico,
    PrefetchHooks Function()> {
  $$ConhecimentotecnicosTableTableManager(
      _$AppDatabase db, $ConhecimentotecnicosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$ConhecimentotecnicosTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$ConhecimentotecnicosTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int?> conhecimentoid = const Value.absent(),
            Value<int?> colaboradorid = const Value.absent(),
            Value<String?> descricaoconhecimento = const Value.absent(),
            Value<String?> nivelconhecimento = const Value.absent(),
            Value<DateTime?> dataavaliacao = const Value.absent(),
          }) =>
              ConhecimentotecnicosCompanion(
            conhecimentoid: conhecimentoid,
            colaboradorid: colaboradorid,
            descricaoconhecimento: descricaoconhecimento,
            nivelconhecimento: nivelconhecimento,
            dataavaliacao: dataavaliacao,
          ),
          createCompanionCallback: ({
            Value<int?> conhecimentoid = const Value.absent(),
            Value<int?> colaboradorid = const Value.absent(),
            Value<String?> descricaoconhecimento = const Value.absent(),
            Value<String?> nivelconhecimento = const Value.absent(),
            Value<DateTime?> dataavaliacao = const Value.absent(),
          }) =>
              ConhecimentotecnicosCompanion.insert(
            conhecimentoid: conhecimentoid,
            colaboradorid: colaboradorid,
            descricaoconhecimento: descricaoconhecimento,
            nivelconhecimento: nivelconhecimento,
            dataavaliacao: dataavaliacao,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ConhecimentotecnicosTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $ConhecimentotecnicosTable,
        Conhecimentotecnico,
        $$ConhecimentotecnicosTableFilterComposer,
        $$ConhecimentotecnicosTableOrderingComposer,
        $$ConhecimentotecnicosTableCreateCompanionBuilder,
        $$ConhecimentotecnicosTableUpdateCompanionBuilder,
        (
          Conhecimentotecnico,
          BaseReferences<_$AppDatabase, $ConhecimentotecnicosTable,
              Conhecimentotecnico>
        ),
        Conhecimentotecnico,
        PrefetchHooks Function()>;
typedef $$EngajamentoproatividadesTableCreateCompanionBuilder
    = EngajamentoproatividadesCompanion Function({
  Value<int?> engajamentoid,
  Value<int?> colaboradorid,
  Value<int?> pontuacaoengajamento,
  Value<int?> propostasmelhoria,
  Value<DateTime?> dataavaliacao,
});
typedef $$EngajamentoproatividadesTableUpdateCompanionBuilder
    = EngajamentoproatividadesCompanion Function({
  Value<int?> engajamentoid,
  Value<int?> colaboradorid,
  Value<int?> pontuacaoengajamento,
  Value<int?> propostasmelhoria,
  Value<DateTime?> dataavaliacao,
});

class $$EngajamentoproatividadesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $EngajamentoproatividadesTable> {
  $$EngajamentoproatividadesTableFilterComposer(super.$state);
  ColumnFilters<int> get engajamentoid => $state.composableBuilder(
      column: $state.table.engajamentoid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get colaboradorid => $state.composableBuilder(
      column: $state.table.colaboradorid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get pontuacaoengajamento => $state.composableBuilder(
      column: $state.table.pontuacaoengajamento,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get propostasmelhoria => $state.composableBuilder(
      column: $state.table.propostasmelhoria,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get dataavaliacao => $state.composableBuilder(
      column: $state.table.dataavaliacao,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$EngajamentoproatividadesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $EngajamentoproatividadesTable> {
  $$EngajamentoproatividadesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get engajamentoid => $state.composableBuilder(
      column: $state.table.engajamentoid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get colaboradorid => $state.composableBuilder(
      column: $state.table.colaboradorid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get pontuacaoengajamento => $state.composableBuilder(
      column: $state.table.pontuacaoengajamento,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get propostasmelhoria => $state.composableBuilder(
      column: $state.table.propostasmelhoria,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get dataavaliacao => $state.composableBuilder(
      column: $state.table.dataavaliacao,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$EngajamentoproatividadesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EngajamentoproatividadesTable,
    Engajamentoproatividade,
    $$EngajamentoproatividadesTableFilterComposer,
    $$EngajamentoproatividadesTableOrderingComposer,
    $$EngajamentoproatividadesTableCreateCompanionBuilder,
    $$EngajamentoproatividadesTableUpdateCompanionBuilder,
    (
      Engajamentoproatividade,
      BaseReferences<_$AppDatabase, $EngajamentoproatividadesTable,
          Engajamentoproatividade>
    ),
    Engajamentoproatividade,
    PrefetchHooks Function()> {
  $$EngajamentoproatividadesTableTableManager(
      _$AppDatabase db, $EngajamentoproatividadesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$EngajamentoproatividadesTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$EngajamentoproatividadesTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int?> engajamentoid = const Value.absent(),
            Value<int?> colaboradorid = const Value.absent(),
            Value<int?> pontuacaoengajamento = const Value.absent(),
            Value<int?> propostasmelhoria = const Value.absent(),
            Value<DateTime?> dataavaliacao = const Value.absent(),
          }) =>
              EngajamentoproatividadesCompanion(
            engajamentoid: engajamentoid,
            colaboradorid: colaboradorid,
            pontuacaoengajamento: pontuacaoengajamento,
            propostasmelhoria: propostasmelhoria,
            dataavaliacao: dataavaliacao,
          ),
          createCompanionCallback: ({
            Value<int?> engajamentoid = const Value.absent(),
            Value<int?> colaboradorid = const Value.absent(),
            Value<int?> pontuacaoengajamento = const Value.absent(),
            Value<int?> propostasmelhoria = const Value.absent(),
            Value<DateTime?> dataavaliacao = const Value.absent(),
          }) =>
              EngajamentoproatividadesCompanion.insert(
            engajamentoid: engajamentoid,
            colaboradorid: colaboradorid,
            pontuacaoengajamento: pontuacaoengajamento,
            propostasmelhoria: propostasmelhoria,
            dataavaliacao: dataavaliacao,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EngajamentoproatividadesTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $EngajamentoproatividadesTable,
        Engajamentoproatividade,
        $$EngajamentoproatividadesTableFilterComposer,
        $$EngajamentoproatividadesTableOrderingComposer,
        $$EngajamentoproatividadesTableCreateCompanionBuilder,
        $$EngajamentoproatividadesTableUpdateCompanionBuilder,
        (
          Engajamentoproatividade,
          BaseReferences<_$AppDatabase, $EngajamentoproatividadesTable,
              Engajamentoproatividade>
        ),
        Engajamentoproatividade,
        PrefetchHooks Function()>;
typedef $$CapacidadecomunicacaosTableCreateCompanionBuilder
    = CapacidadecomunicacaosCompanion Function({
  Value<int?> comunicacaoid,
  Value<int?> colaboradorid,
  Value<int?> avaliacaocomunicacao,
  Value<String?> feedbackcomunicacao,
  Value<DateTime?> dataavaliacao,
});
typedef $$CapacidadecomunicacaosTableUpdateCompanionBuilder
    = CapacidadecomunicacaosCompanion Function({
  Value<int?> comunicacaoid,
  Value<int?> colaboradorid,
  Value<int?> avaliacaocomunicacao,
  Value<String?> feedbackcomunicacao,
  Value<DateTime?> dataavaliacao,
});

class $$CapacidadecomunicacaosTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CapacidadecomunicacaosTable> {
  $$CapacidadecomunicacaosTableFilterComposer(super.$state);
  ColumnFilters<int> get comunicacaoid => $state.composableBuilder(
      column: $state.table.comunicacaoid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get colaboradorid => $state.composableBuilder(
      column: $state.table.colaboradorid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get avaliacaocomunicacao => $state.composableBuilder(
      column: $state.table.avaliacaocomunicacao,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get feedbackcomunicacao => $state.composableBuilder(
      column: $state.table.feedbackcomunicacao,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get dataavaliacao => $state.composableBuilder(
      column: $state.table.dataavaliacao,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CapacidadecomunicacaosTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CapacidadecomunicacaosTable> {
  $$CapacidadecomunicacaosTableOrderingComposer(super.$state);
  ColumnOrderings<int> get comunicacaoid => $state.composableBuilder(
      column: $state.table.comunicacaoid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get colaboradorid => $state.composableBuilder(
      column: $state.table.colaboradorid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get avaliacaocomunicacao => $state.composableBuilder(
      column: $state.table.avaliacaocomunicacao,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get feedbackcomunicacao => $state.composableBuilder(
      column: $state.table.feedbackcomunicacao,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get dataavaliacao => $state.composableBuilder(
      column: $state.table.dataavaliacao,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$CapacidadecomunicacaosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CapacidadecomunicacaosTable,
    Capacidadecomunicacao,
    $$CapacidadecomunicacaosTableFilterComposer,
    $$CapacidadecomunicacaosTableOrderingComposer,
    $$CapacidadecomunicacaosTableCreateCompanionBuilder,
    $$CapacidadecomunicacaosTableUpdateCompanionBuilder,
    (
      Capacidadecomunicacao,
      BaseReferences<_$AppDatabase, $CapacidadecomunicacaosTable,
          Capacidadecomunicacao>
    ),
    Capacidadecomunicacao,
    PrefetchHooks Function()> {
  $$CapacidadecomunicacaosTableTableManager(
      _$AppDatabase db, $CapacidadecomunicacaosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$CapacidadecomunicacaosTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$CapacidadecomunicacaosTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int?> comunicacaoid = const Value.absent(),
            Value<int?> colaboradorid = const Value.absent(),
            Value<int?> avaliacaocomunicacao = const Value.absent(),
            Value<String?> feedbackcomunicacao = const Value.absent(),
            Value<DateTime?> dataavaliacao = const Value.absent(),
          }) =>
              CapacidadecomunicacaosCompanion(
            comunicacaoid: comunicacaoid,
            colaboradorid: colaboradorid,
            avaliacaocomunicacao: avaliacaocomunicacao,
            feedbackcomunicacao: feedbackcomunicacao,
            dataavaliacao: dataavaliacao,
          ),
          createCompanionCallback: ({
            Value<int?> comunicacaoid = const Value.absent(),
            Value<int?> colaboradorid = const Value.absent(),
            Value<int?> avaliacaocomunicacao = const Value.absent(),
            Value<String?> feedbackcomunicacao = const Value.absent(),
            Value<DateTime?> dataavaliacao = const Value.absent(),
          }) =>
              CapacidadecomunicacaosCompanion.insert(
            comunicacaoid: comunicacaoid,
            colaboradorid: colaboradorid,
            avaliacaocomunicacao: avaliacaocomunicacao,
            feedbackcomunicacao: feedbackcomunicacao,
            dataavaliacao: dataavaliacao,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CapacidadecomunicacaosTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $CapacidadecomunicacaosTable,
        Capacidadecomunicacao,
        $$CapacidadecomunicacaosTableFilterComposer,
        $$CapacidadecomunicacaosTableOrderingComposer,
        $$CapacidadecomunicacaosTableCreateCompanionBuilder,
        $$CapacidadecomunicacaosTableUpdateCompanionBuilder,
        (
          Capacidadecomunicacao,
          BaseReferences<_$AppDatabase, $CapacidadecomunicacaosTable,
              Capacidadecomunicacao>
        ),
        Capacidadecomunicacao,
        PrefetchHooks Function()>;
typedef $$ResultadosatingidossTableCreateCompanionBuilder
    = ResultadosatingidossCompanion Function({
  Value<int?> resultadoid,
  Value<int?> colaboradorid,
  Value<int?> metasatingidas,
  Value<DateTime?> dataavaliacao,
  Value<int?> pontuacaoprodutividade,
  Value<int?> defeitosproduzidos,
});
typedef $$ResultadosatingidossTableUpdateCompanionBuilder
    = ResultadosatingidossCompanion Function({
  Value<int?> resultadoid,
  Value<int?> colaboradorid,
  Value<int?> metasatingidas,
  Value<DateTime?> dataavaliacao,
  Value<int?> pontuacaoprodutividade,
  Value<int?> defeitosproduzidos,
});

class $$ResultadosatingidossTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ResultadosatingidossTable> {
  $$ResultadosatingidossTableFilterComposer(super.$state);
  ColumnFilters<int> get resultadoid => $state.composableBuilder(
      column: $state.table.resultadoid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get colaboradorid => $state.composableBuilder(
      column: $state.table.colaboradorid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get metasatingidas => $state.composableBuilder(
      column: $state.table.metasatingidas,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get dataavaliacao => $state.composableBuilder(
      column: $state.table.dataavaliacao,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get pontuacaoprodutividade => $state.composableBuilder(
      column: $state.table.pontuacaoprodutividade,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get defeitosproduzidos => $state.composableBuilder(
      column: $state.table.defeitosproduzidos,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ResultadosatingidossTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ResultadosatingidossTable> {
  $$ResultadosatingidossTableOrderingComposer(super.$state);
  ColumnOrderings<int> get resultadoid => $state.composableBuilder(
      column: $state.table.resultadoid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get colaboradorid => $state.composableBuilder(
      column: $state.table.colaboradorid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get metasatingidas => $state.composableBuilder(
      column: $state.table.metasatingidas,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get dataavaliacao => $state.composableBuilder(
      column: $state.table.dataavaliacao,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get pontuacaoprodutividade => $state.composableBuilder(
      column: $state.table.pontuacaoprodutividade,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get defeitosproduzidos => $state.composableBuilder(
      column: $state.table.defeitosproduzidos,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ResultadosatingidossTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ResultadosatingidossTable,
    Resultadosatingidos,
    $$ResultadosatingidossTableFilterComposer,
    $$ResultadosatingidossTableOrderingComposer,
    $$ResultadosatingidossTableCreateCompanionBuilder,
    $$ResultadosatingidossTableUpdateCompanionBuilder,
    (
      Resultadosatingidos,
      BaseReferences<_$AppDatabase, $ResultadosatingidossTable,
          Resultadosatingidos>
    ),
    Resultadosatingidos,
    PrefetchHooks Function()> {
  $$ResultadosatingidossTableTableManager(
      _$AppDatabase db, $ResultadosatingidossTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$ResultadosatingidossTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$ResultadosatingidossTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int?> resultadoid = const Value.absent(),
            Value<int?> colaboradorid = const Value.absent(),
            Value<int?> metasatingidas = const Value.absent(),
            Value<DateTime?> dataavaliacao = const Value.absent(),
            Value<int?> pontuacaoprodutividade = const Value.absent(),
            Value<int?> defeitosproduzidos = const Value.absent(),
          }) =>
              ResultadosatingidossCompanion(
            resultadoid: resultadoid,
            colaboradorid: colaboradorid,
            metasatingidas: metasatingidas,
            dataavaliacao: dataavaliacao,
            pontuacaoprodutividade: pontuacaoprodutividade,
            defeitosproduzidos: defeitosproduzidos,
          ),
          createCompanionCallback: ({
            Value<int?> resultadoid = const Value.absent(),
            Value<int?> colaboradorid = const Value.absent(),
            Value<int?> metasatingidas = const Value.absent(),
            Value<DateTime?> dataavaliacao = const Value.absent(),
            Value<int?> pontuacaoprodutividade = const Value.absent(),
            Value<int?> defeitosproduzidos = const Value.absent(),
          }) =>
              ResultadosatingidossCompanion.insert(
            resultadoid: resultadoid,
            colaboradorid: colaboradorid,
            metasatingidas: metasatingidas,
            dataavaliacao: dataavaliacao,
            pontuacaoprodutividade: pontuacaoprodutividade,
            defeitosproduzidos: defeitosproduzidos,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ResultadosatingidossTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $ResultadosatingidossTable,
        Resultadosatingidos,
        $$ResultadosatingidossTableFilterComposer,
        $$ResultadosatingidossTableOrderingComposer,
        $$ResultadosatingidossTableCreateCompanionBuilder,
        $$ResultadosatingidossTableUpdateCompanionBuilder,
        (
          Resultadosatingidos,
          BaseReferences<_$AppDatabase, $ResultadosatingidossTable,
              Resultadosatingidos>
        ),
        Resultadosatingidos,
        PrefetchHooks Function()>;
typedef $$CapacitacaotreinamentossTableCreateCompanionBuilder
    = CapacitacaotreinamentossCompanion Function({
  Value<int?> treinamentoid,
  Value<int?> colaboradorid,
  Value<String?> nometreinamento,
  Value<DateTime?> dataconclusao,
  Value<bool?> certificado,
});
typedef $$CapacitacaotreinamentossTableUpdateCompanionBuilder
    = CapacitacaotreinamentossCompanion Function({
  Value<int?> treinamentoid,
  Value<int?> colaboradorid,
  Value<String?> nometreinamento,
  Value<DateTime?> dataconclusao,
  Value<bool?> certificado,
});

class $$CapacitacaotreinamentossTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CapacitacaotreinamentossTable> {
  $$CapacitacaotreinamentossTableFilterComposer(super.$state);
  ColumnFilters<int> get treinamentoid => $state.composableBuilder(
      column: $state.table.treinamentoid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get colaboradorid => $state.composableBuilder(
      column: $state.table.colaboradorid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nometreinamento => $state.composableBuilder(
      column: $state.table.nometreinamento,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get dataconclusao => $state.composableBuilder(
      column: $state.table.dataconclusao,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get certificado => $state.composableBuilder(
      column: $state.table.certificado,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CapacitacaotreinamentossTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CapacitacaotreinamentossTable> {
  $$CapacitacaotreinamentossTableOrderingComposer(super.$state);
  ColumnOrderings<int> get treinamentoid => $state.composableBuilder(
      column: $state.table.treinamentoid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get colaboradorid => $state.composableBuilder(
      column: $state.table.colaboradorid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nometreinamento => $state.composableBuilder(
      column: $state.table.nometreinamento,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get dataconclusao => $state.composableBuilder(
      column: $state.table.dataconclusao,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get certificado => $state.composableBuilder(
      column: $state.table.certificado,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$CapacitacaotreinamentossTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CapacitacaotreinamentossTable,
    Capacitacaotreinamentos,
    $$CapacitacaotreinamentossTableFilterComposer,
    $$CapacitacaotreinamentossTableOrderingComposer,
    $$CapacitacaotreinamentossTableCreateCompanionBuilder,
    $$CapacitacaotreinamentossTableUpdateCompanionBuilder,
    (
      Capacitacaotreinamentos,
      BaseReferences<_$AppDatabase, $CapacitacaotreinamentossTable,
          Capacitacaotreinamentos>
    ),
    Capacitacaotreinamentos,
    PrefetchHooks Function()> {
  $$CapacitacaotreinamentossTableTableManager(
      _$AppDatabase db, $CapacitacaotreinamentossTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$CapacitacaotreinamentossTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$CapacitacaotreinamentossTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int?> treinamentoid = const Value.absent(),
            Value<int?> colaboradorid = const Value.absent(),
            Value<String?> nometreinamento = const Value.absent(),
            Value<DateTime?> dataconclusao = const Value.absent(),
            Value<bool?> certificado = const Value.absent(),
          }) =>
              CapacitacaotreinamentossCompanion(
            treinamentoid: treinamentoid,
            colaboradorid: colaboradorid,
            nometreinamento: nometreinamento,
            dataconclusao: dataconclusao,
            certificado: certificado,
          ),
          createCompanionCallback: ({
            Value<int?> treinamentoid = const Value.absent(),
            Value<int?> colaboradorid = const Value.absent(),
            Value<String?> nometreinamento = const Value.absent(),
            Value<DateTime?> dataconclusao = const Value.absent(),
            Value<bool?> certificado = const Value.absent(),
          }) =>
              CapacitacaotreinamentossCompanion.insert(
            treinamentoid: treinamentoid,
            colaboradorid: colaboradorid,
            nometreinamento: nometreinamento,
            dataconclusao: dataconclusao,
            certificado: certificado,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CapacitacaotreinamentossTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $CapacitacaotreinamentossTable,
        Capacitacaotreinamentos,
        $$CapacitacaotreinamentossTableFilterComposer,
        $$CapacitacaotreinamentossTableOrderingComposer,
        $$CapacitacaotreinamentossTableCreateCompanionBuilder,
        $$CapacitacaotreinamentossTableUpdateCompanionBuilder,
        (
          Capacitacaotreinamentos,
          BaseReferences<_$AppDatabase, $CapacitacaotreinamentossTable,
              Capacitacaotreinamentos>
        ),
        Capacitacaotreinamentos,
        PrefetchHooks Function()>;
typedef $$FeedbacksupervisoressTableCreateCompanionBuilder
    = FeedbacksupervisoressCompanion Function({
  Value<int?> feedbackid,
  Value<int?> supervisoridSupervisores,
  Value<int?> colaboradorid,
  Value<String?> feedback,
  Value<DateTime?> datafeedback,
});
typedef $$FeedbacksupervisoressTableUpdateCompanionBuilder
    = FeedbacksupervisoressCompanion Function({
  Value<int?> feedbackid,
  Value<int?> supervisoridSupervisores,
  Value<int?> colaboradorid,
  Value<String?> feedback,
  Value<DateTime?> datafeedback,
});

class $$FeedbacksupervisoressTableFilterComposer
    extends FilterComposer<_$AppDatabase, $FeedbacksupervisoressTable> {
  $$FeedbacksupervisoressTableFilterComposer(super.$state);
  ColumnFilters<int> get feedbackid => $state.composableBuilder(
      column: $state.table.feedbackid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get supervisoridSupervisores => $state.composableBuilder(
      column: $state.table.supervisoridSupervisores,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get colaboradorid => $state.composableBuilder(
      column: $state.table.colaboradorid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get feedback => $state.composableBuilder(
      column: $state.table.feedback,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get datafeedback => $state.composableBuilder(
      column: $state.table.datafeedback,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$FeedbacksupervisoressTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $FeedbacksupervisoressTable> {
  $$FeedbacksupervisoressTableOrderingComposer(super.$state);
  ColumnOrderings<int> get feedbackid => $state.composableBuilder(
      column: $state.table.feedbackid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get supervisoridSupervisores => $state.composableBuilder(
      column: $state.table.supervisoridSupervisores,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get colaboradorid => $state.composableBuilder(
      column: $state.table.colaboradorid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get feedback => $state.composableBuilder(
      column: $state.table.feedback,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get datafeedback => $state.composableBuilder(
      column: $state.table.datafeedback,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$FeedbacksupervisoressTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FeedbacksupervisoressTable,
    Feedbacksupervisores,
    $$FeedbacksupervisoressTableFilterComposer,
    $$FeedbacksupervisoressTableOrderingComposer,
    $$FeedbacksupervisoressTableCreateCompanionBuilder,
    $$FeedbacksupervisoressTableUpdateCompanionBuilder,
    (
      Feedbacksupervisores,
      BaseReferences<_$AppDatabase, $FeedbacksupervisoressTable,
          Feedbacksupervisores>
    ),
    Feedbacksupervisores,
    PrefetchHooks Function()> {
  $$FeedbacksupervisoressTableTableManager(
      _$AppDatabase db, $FeedbacksupervisoressTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$FeedbacksupervisoressTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$FeedbacksupervisoressTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int?> feedbackid = const Value.absent(),
            Value<int?> supervisoridSupervisores = const Value.absent(),
            Value<int?> colaboradorid = const Value.absent(),
            Value<String?> feedback = const Value.absent(),
            Value<DateTime?> datafeedback = const Value.absent(),
          }) =>
              FeedbacksupervisoressCompanion(
            feedbackid: feedbackid,
            supervisoridSupervisores: supervisoridSupervisores,
            colaboradorid: colaboradorid,
            feedback: feedback,
            datafeedback: datafeedback,
          ),
          createCompanionCallback: ({
            Value<int?> feedbackid = const Value.absent(),
            Value<int?> supervisoridSupervisores = const Value.absent(),
            Value<int?> colaboradorid = const Value.absent(),
            Value<String?> feedback = const Value.absent(),
            Value<DateTime?> datafeedback = const Value.absent(),
          }) =>
              FeedbacksupervisoressCompanion.insert(
            feedbackid: feedbackid,
            supervisoridSupervisores: supervisoridSupervisores,
            colaboradorid: colaboradorid,
            feedback: feedback,
            datafeedback: datafeedback,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FeedbacksupervisoressTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $FeedbacksupervisoressTable,
        Feedbacksupervisores,
        $$FeedbacksupervisoressTableFilterComposer,
        $$FeedbacksupervisoressTableOrderingComposer,
        $$FeedbacksupervisoressTableCreateCompanionBuilder,
        $$FeedbacksupervisoressTableUpdateCompanionBuilder,
        (
          Feedbacksupervisores,
          BaseReferences<_$AppDatabase, $FeedbacksupervisoressTable,
              Feedbacksupervisores>
        ),
        Feedbacksupervisores,
        PrefetchHooks Function()>;
typedef $$ResolucaoproblemassTableCreateCompanionBuilder
    = ResolucaoproblemassCompanion Function({
  Value<int?> resolucaoid,
  Value<int?> colaboradorid,
  Value<String?> descricaoproblemaresolvido,
  Value<DateTime?> dataresolucao,
  Value<int?> avaliacaoresolucao,
});
typedef $$ResolucaoproblemassTableUpdateCompanionBuilder
    = ResolucaoproblemassCompanion Function({
  Value<int?> resolucaoid,
  Value<int?> colaboradorid,
  Value<String?> descricaoproblemaresolvido,
  Value<DateTime?> dataresolucao,
  Value<int?> avaliacaoresolucao,
});

class $$ResolucaoproblemassTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ResolucaoproblemassTable> {
  $$ResolucaoproblemassTableFilterComposer(super.$state);
  ColumnFilters<int> get resolucaoid => $state.composableBuilder(
      column: $state.table.resolucaoid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get colaboradorid => $state.composableBuilder(
      column: $state.table.colaboradorid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get descricaoproblemaresolvido =>
      $state.composableBuilder(
          column: $state.table.descricaoproblemaresolvido,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get dataresolucao => $state.composableBuilder(
      column: $state.table.dataresolucao,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get avaliacaoresolucao => $state.composableBuilder(
      column: $state.table.avaliacaoresolucao,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ResolucaoproblemassTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ResolucaoproblemassTable> {
  $$ResolucaoproblemassTableOrderingComposer(super.$state);
  ColumnOrderings<int> get resolucaoid => $state.composableBuilder(
      column: $state.table.resolucaoid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get colaboradorid => $state.composableBuilder(
      column: $state.table.colaboradorid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get descricaoproblemaresolvido =>
      $state.composableBuilder(
          column: $state.table.descricaoproblemaresolvido,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get dataresolucao => $state.composableBuilder(
      column: $state.table.dataresolucao,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get avaliacaoresolucao => $state.composableBuilder(
      column: $state.table.avaliacaoresolucao,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ResolucaoproblemassTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ResolucaoproblemassTable,
    Resolucaoproblemas,
    $$ResolucaoproblemassTableFilterComposer,
    $$ResolucaoproblemassTableOrderingComposer,
    $$ResolucaoproblemassTableCreateCompanionBuilder,
    $$ResolucaoproblemassTableUpdateCompanionBuilder,
    (
      Resolucaoproblemas,
      BaseReferences<_$AppDatabase, $ResolucaoproblemassTable,
          Resolucaoproblemas>
    ),
    Resolucaoproblemas,
    PrefetchHooks Function()> {
  $$ResolucaoproblemassTableTableManager(
      _$AppDatabase db, $ResolucaoproblemassTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$ResolucaoproblemassTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$ResolucaoproblemassTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int?> resolucaoid = const Value.absent(),
            Value<int?> colaboradorid = const Value.absent(),
            Value<String?> descricaoproblemaresolvido = const Value.absent(),
            Value<DateTime?> dataresolucao = const Value.absent(),
            Value<int?> avaliacaoresolucao = const Value.absent(),
          }) =>
              ResolucaoproblemassCompanion(
            resolucaoid: resolucaoid,
            colaboradorid: colaboradorid,
            descricaoproblemaresolvido: descricaoproblemaresolvido,
            dataresolucao: dataresolucao,
            avaliacaoresolucao: avaliacaoresolucao,
          ),
          createCompanionCallback: ({
            Value<int?> resolucaoid = const Value.absent(),
            Value<int?> colaboradorid = const Value.absent(),
            Value<String?> descricaoproblemaresolvido = const Value.absent(),
            Value<DateTime?> dataresolucao = const Value.absent(),
            Value<int?> avaliacaoresolucao = const Value.absent(),
          }) =>
              ResolucaoproblemassCompanion.insert(
            resolucaoid: resolucaoid,
            colaboradorid: colaboradorid,
            descricaoproblemaresolvido: descricaoproblemaresolvido,
            dataresolucao: dataresolucao,
            avaliacaoresolucao: avaliacaoresolucao,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ResolucaoproblemassTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ResolucaoproblemassTable,
    Resolucaoproblemas,
    $$ResolucaoproblemassTableFilterComposer,
    $$ResolucaoproblemassTableOrderingComposer,
    $$ResolucaoproblemassTableCreateCompanionBuilder,
    $$ResolucaoproblemassTableUpdateCompanionBuilder,
    (
      Resolucaoproblemas,
      BaseReferences<_$AppDatabase, $ResolucaoproblemassTable,
          Resolucaoproblemas>
    ),
    Resolucaoproblemas,
    PrefetchHooks Function()>;
typedef $$AssiduidadepontualidadesTableCreateCompanionBuilder
    = AssiduidadepontualidadesCompanion Function({
  Value<int?> assiduidadeid,
  Value<int?> colaboradorid,
  Value<int?> faltasinjustificadas,
  Value<int?> atrasos,
  Value<DateTime?> dataregistro,
});
typedef $$AssiduidadepontualidadesTableUpdateCompanionBuilder
    = AssiduidadepontualidadesCompanion Function({
  Value<int?> assiduidadeid,
  Value<int?> colaboradorid,
  Value<int?> faltasinjustificadas,
  Value<int?> atrasos,
  Value<DateTime?> dataregistro,
});

class $$AssiduidadepontualidadesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AssiduidadepontualidadesTable> {
  $$AssiduidadepontualidadesTableFilterComposer(super.$state);
  ColumnFilters<int> get assiduidadeid => $state.composableBuilder(
      column: $state.table.assiduidadeid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get colaboradorid => $state.composableBuilder(
      column: $state.table.colaboradorid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get faltasinjustificadas => $state.composableBuilder(
      column: $state.table.faltasinjustificadas,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get atrasos => $state.composableBuilder(
      column: $state.table.atrasos,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get dataregistro => $state.composableBuilder(
      column: $state.table.dataregistro,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AssiduidadepontualidadesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AssiduidadepontualidadesTable> {
  $$AssiduidadepontualidadesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get assiduidadeid => $state.composableBuilder(
      column: $state.table.assiduidadeid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get colaboradorid => $state.composableBuilder(
      column: $state.table.colaboradorid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get faltasinjustificadas => $state.composableBuilder(
      column: $state.table.faltasinjustificadas,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get atrasos => $state.composableBuilder(
      column: $state.table.atrasos,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get dataregistro => $state.composableBuilder(
      column: $state.table.dataregistro,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$AssiduidadepontualidadesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AssiduidadepontualidadesTable,
    Assiduidadepontualidade,
    $$AssiduidadepontualidadesTableFilterComposer,
    $$AssiduidadepontualidadesTableOrderingComposer,
    $$AssiduidadepontualidadesTableCreateCompanionBuilder,
    $$AssiduidadepontualidadesTableUpdateCompanionBuilder,
    (
      Assiduidadepontualidade,
      BaseReferences<_$AppDatabase, $AssiduidadepontualidadesTable,
          Assiduidadepontualidade>
    ),
    Assiduidadepontualidade,
    PrefetchHooks Function()> {
  $$AssiduidadepontualidadesTableTableManager(
      _$AppDatabase db, $AssiduidadepontualidadesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$AssiduidadepontualidadesTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$AssiduidadepontualidadesTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int?> assiduidadeid = const Value.absent(),
            Value<int?> colaboradorid = const Value.absent(),
            Value<int?> faltasinjustificadas = const Value.absent(),
            Value<int?> atrasos = const Value.absent(),
            Value<DateTime?> dataregistro = const Value.absent(),
          }) =>
              AssiduidadepontualidadesCompanion(
            assiduidadeid: assiduidadeid,
            colaboradorid: colaboradorid,
            faltasinjustificadas: faltasinjustificadas,
            atrasos: atrasos,
            dataregistro: dataregistro,
          ),
          createCompanionCallback: ({
            Value<int?> assiduidadeid = const Value.absent(),
            Value<int?> colaboradorid = const Value.absent(),
            Value<int?> faltasinjustificadas = const Value.absent(),
            Value<int?> atrasos = const Value.absent(),
            Value<DateTime?> dataregistro = const Value.absent(),
          }) =>
              AssiduidadepontualidadesCompanion.insert(
            assiduidadeid: assiduidadeid,
            colaboradorid: colaboradorid,
            faltasinjustificadas: faltasinjustificadas,
            atrasos: atrasos,
            dataregistro: dataregistro,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AssiduidadepontualidadesTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $AssiduidadepontualidadesTable,
        Assiduidadepontualidade,
        $$AssiduidadepontualidadesTableFilterComposer,
        $$AssiduidadepontualidadesTableOrderingComposer,
        $$AssiduidadepontualidadesTableCreateCompanionBuilder,
        $$AssiduidadepontualidadesTableUpdateCompanionBuilder,
        (
          Assiduidadepontualidade,
          BaseReferences<_$AppDatabase, $AssiduidadepontualidadesTable,
              Assiduidadepontualidade>
        ),
        Assiduidadepontualidade,
        PrefetchHooks Function()>;
typedef $$ColaboradoressTableCreateCompanionBuilder = ColaboradoressCompanion
    Function({
  Value<int?> colaboradorid,
  Value<String?> nome,
  Value<String?> cargoatual,
  Value<DateTime?> dataadmissao,
  Value<int?> experienciaatual,
  Value<String?> telefone,
  Value<String?> status,
});
typedef $$ColaboradoressTableUpdateCompanionBuilder = ColaboradoressCompanion
    Function({
  Value<int?> colaboradorid,
  Value<String?> nome,
  Value<String?> cargoatual,
  Value<DateTime?> dataadmissao,
  Value<int?> experienciaatual,
  Value<String?> telefone,
  Value<String?> status,
});

class $$ColaboradoressTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ColaboradoressTable> {
  $$ColaboradoressTableFilterComposer(super.$state);
  ColumnFilters<int> get colaboradorid => $state.composableBuilder(
      column: $state.table.colaboradorid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nome => $state.composableBuilder(
      column: $state.table.nome,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get cargoatual => $state.composableBuilder(
      column: $state.table.cargoatual,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get dataadmissao => $state.composableBuilder(
      column: $state.table.dataadmissao,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get experienciaatual => $state.composableBuilder(
      column: $state.table.experienciaatual,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get telefone => $state.composableBuilder(
      column: $state.table.telefone,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ColaboradoressTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ColaboradoressTable> {
  $$ColaboradoressTableOrderingComposer(super.$state);
  ColumnOrderings<int> get colaboradorid => $state.composableBuilder(
      column: $state.table.colaboradorid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nome => $state.composableBuilder(
      column: $state.table.nome,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get cargoatual => $state.composableBuilder(
      column: $state.table.cargoatual,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get dataadmissao => $state.composableBuilder(
      column: $state.table.dataadmissao,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get experienciaatual => $state.composableBuilder(
      column: $state.table.experienciaatual,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get telefone => $state.composableBuilder(
      column: $state.table.telefone,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ColaboradoressTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ColaboradoressTable,
    Colaboradores,
    $$ColaboradoressTableFilterComposer,
    $$ColaboradoressTableOrderingComposer,
    $$ColaboradoressTableCreateCompanionBuilder,
    $$ColaboradoressTableUpdateCompanionBuilder,
    (
      Colaboradores,
      BaseReferences<_$AppDatabase, $ColaboradoressTable, Colaboradores>
    ),
    Colaboradores,
    PrefetchHooks Function()> {
  $$ColaboradoressTableTableManager(
      _$AppDatabase db, $ColaboradoressTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ColaboradoressTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ColaboradoressTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int?> colaboradorid = const Value.absent(),
            Value<String?> nome = const Value.absent(),
            Value<String?> cargoatual = const Value.absent(),
            Value<DateTime?> dataadmissao = const Value.absent(),
            Value<int?> experienciaatual = const Value.absent(),
            Value<String?> telefone = const Value.absent(),
            Value<String?> status = const Value.absent(),
          }) =>
              ColaboradoressCompanion(
            colaboradorid: colaboradorid,
            nome: nome,
            cargoatual: cargoatual,
            dataadmissao: dataadmissao,
            experienciaatual: experienciaatual,
            telefone: telefone,
            status: status,
          ),
          createCompanionCallback: ({
            Value<int?> colaboradorid = const Value.absent(),
            Value<String?> nome = const Value.absent(),
            Value<String?> cargoatual = const Value.absent(),
            Value<DateTime?> dataadmissao = const Value.absent(),
            Value<int?> experienciaatual = const Value.absent(),
            Value<String?> telefone = const Value.absent(),
            Value<String?> status = const Value.absent(),
          }) =>
              ColaboradoressCompanion.insert(
            colaboradorid: colaboradorid,
            nome: nome,
            cargoatual: cargoatual,
            dataadmissao: dataadmissao,
            experienciaatual: experienciaatual,
            telefone: telefone,
            status: status,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ColaboradoressTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ColaboradoressTable,
    Colaboradores,
    $$ColaboradoressTableFilterComposer,
    $$ColaboradoressTableOrderingComposer,
    $$ColaboradoressTableCreateCompanionBuilder,
    $$ColaboradoressTableUpdateCompanionBuilder,
    (
      Colaboradores,
      BaseReferences<_$AppDatabase, $ColaboradoressTable, Colaboradores>
    ),
    Colaboradores,
    PrefetchHooks Function()>;
typedef $$SupervisoressTableCreateCompanionBuilder = SupervisoressCompanion
    Function({
  Value<int?> supervisorid,
  Value<String?> nome,
  Value<String?> cargo,
  Value<String?> email,
  Value<String?> telefone,
  Value<DateTime?> dataadmissao,
  Value<String?> status,
});
typedef $$SupervisoressTableUpdateCompanionBuilder = SupervisoressCompanion
    Function({
  Value<int?> supervisorid,
  Value<String?> nome,
  Value<String?> cargo,
  Value<String?> email,
  Value<String?> telefone,
  Value<DateTime?> dataadmissao,
  Value<String?> status,
});

class $$SupervisoressTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SupervisoressTable> {
  $$SupervisoressTableFilterComposer(super.$state);
  ColumnFilters<int> get supervisorid => $state.composableBuilder(
      column: $state.table.supervisorid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nome => $state.composableBuilder(
      column: $state.table.nome,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get cargo => $state.composableBuilder(
      column: $state.table.cargo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get telefone => $state.composableBuilder(
      column: $state.table.telefone,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get dataadmissao => $state.composableBuilder(
      column: $state.table.dataadmissao,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SupervisoressTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SupervisoressTable> {
  $$SupervisoressTableOrderingComposer(super.$state);
  ColumnOrderings<int> get supervisorid => $state.composableBuilder(
      column: $state.table.supervisorid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nome => $state.composableBuilder(
      column: $state.table.nome,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get cargo => $state.composableBuilder(
      column: $state.table.cargo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get telefone => $state.composableBuilder(
      column: $state.table.telefone,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get dataadmissao => $state.composableBuilder(
      column: $state.table.dataadmissao,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$SupervisoressTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SupervisoressTable,
    Supervisores,
    $$SupervisoressTableFilterComposer,
    $$SupervisoressTableOrderingComposer,
    $$SupervisoressTableCreateCompanionBuilder,
    $$SupervisoressTableUpdateCompanionBuilder,
    (
      Supervisores,
      BaseReferences<_$AppDatabase, $SupervisoressTable, Supervisores>
    ),
    Supervisores,
    PrefetchHooks Function()> {
  $$SupervisoressTableTableManager(_$AppDatabase db, $SupervisoressTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SupervisoressTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SupervisoressTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int?> supervisorid = const Value.absent(),
            Value<String?> nome = const Value.absent(),
            Value<String?> cargo = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> telefone = const Value.absent(),
            Value<DateTime?> dataadmissao = const Value.absent(),
            Value<String?> status = const Value.absent(),
          }) =>
              SupervisoressCompanion(
            supervisorid: supervisorid,
            nome: nome,
            cargo: cargo,
            email: email,
            telefone: telefone,
            dataadmissao: dataadmissao,
            status: status,
          ),
          createCompanionCallback: ({
            Value<int?> supervisorid = const Value.absent(),
            Value<String?> nome = const Value.absent(),
            Value<String?> cargo = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> telefone = const Value.absent(),
            Value<DateTime?> dataadmissao = const Value.absent(),
            Value<String?> status = const Value.absent(),
          }) =>
              SupervisoressCompanion.insert(
            supervisorid: supervisorid,
            nome: nome,
            cargo: cargo,
            email: email,
            telefone: telefone,
            dataadmissao: dataadmissao,
            status: status,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SupervisoressTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SupervisoressTable,
    Supervisores,
    $$SupervisoressTableFilterComposer,
    $$SupervisoressTableOrderingComposer,
    $$SupervisoressTableCreateCompanionBuilder,
    $$SupervisoressTableUpdateCompanionBuilder,
    (
      Supervisores,
      BaseReferences<_$AppDatabase, $SupervisoressTable, Supervisores>
    ),
    Supervisores,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ConhecimentotecnicosTableTableManager get conhecimentotecnicos =>
      $$ConhecimentotecnicosTableTableManager(_db, _db.conhecimentotecnicos);
  $$EngajamentoproatividadesTableTableManager get engajamentoproatividades =>
      $$EngajamentoproatividadesTableTableManager(
          _db, _db.engajamentoproatividades);
  $$CapacidadecomunicacaosTableTableManager get capacidadecomunicacaos =>
      $$CapacidadecomunicacaosTableTableManager(
          _db, _db.capacidadecomunicacaos);
  $$ResultadosatingidossTableTableManager get resultadosatingidoss =>
      $$ResultadosatingidossTableTableManager(_db, _db.resultadosatingidoss);
  $$CapacitacaotreinamentossTableTableManager get capacitacaotreinamentoss =>
      $$CapacitacaotreinamentossTableTableManager(
          _db, _db.capacitacaotreinamentoss);
  $$FeedbacksupervisoressTableTableManager get feedbacksupervisoress =>
      $$FeedbacksupervisoressTableTableManager(_db, _db.feedbacksupervisoress);
  $$ResolucaoproblemassTableTableManager get resolucaoproblemass =>
      $$ResolucaoproblemassTableTableManager(_db, _db.resolucaoproblemass);
  $$AssiduidadepontualidadesTableTableManager get assiduidadepontualidades =>
      $$AssiduidadepontualidadesTableTableManager(
          _db, _db.assiduidadepontualidades);
  $$ColaboradoressTableTableManager get colaboradoress =>
      $$ColaboradoressTableTableManager(_db, _db.colaboradoress);
  $$SupervisoressTableTableManager get supervisoress =>
      $$SupervisoressTableTableManager(_db, _db.supervisoress);
}
