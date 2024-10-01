import 'package:drift/drift.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/database/database_imports.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Conhecimentotecnicos,
    Engajamentoproatividades,
    Capacidadecomunicacaos,
    Resultadosatingidoss,
    Capacitacaotreinamentoss,
    Feedbacksupervisoress,
    Resolucaoproblemass,
    Assiduidadepontualidades,
    Colaboradoress,
    Supervisoress,
  ],
  daos: [
    ColaboradoresDao,
    SupervisoresDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor executor) : super(executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
          await _populateDatabase(this);
        },
      );
}

Future<void> _populateDatabase(db) async {
  await db.customStatement("CREATE TABLE HIDDEN_SETTINGS("
      "ID INTEGER PRIMARY KEY,"
      "APP_THEME TEXT"
      ")");
  await db
      .customStatement("INSERT INTO HIDDEN_SETTINGS (ID, APP_THEME) VALUES (1, 'ThemeMode.light')");

// Colaboradores
  await db.customStatement(
      "INSERT INTO colaboradores (nome, cargoatual, dataadmissao, experienciaatual, telefone, status) VALUES ('Ana Souza', 'Operador de Máquinas', '1589085106', 40, '99999-1111', 'Ativo'), ('Carlos Silva', 'Operador de Máquinas', '1560141106', 50, '99999-2222', 'Ativo'), ('Beatriz Oliveira', 'Montador de Veículos', '1612931506', 30, '99999-3333', 'Ativo'), ('Daniel Costa', 'Operador de Máquinas', '1541824306', 70, '99999-4444', 'Ativo'), ('Elisa Santos', 'Montador de Veículos', '1633840306', 20, '99999-5555', 'Ativo'), ('Fernando Lima', 'Montador de Veículos', '1489120306', 90, '99999-6666', 'Ativo'), ('Gabriela Sousa', 'Operador de Máquinas', '1575952306', 45, '99999-7777', 'Ativo'), ('Henrique Almeida', 'Montador de Veículos', '1641789106', 15, '99999-8888', 'Ativo'), ('Isabela Freitas', 'Operador de Máquinas', '1591763506', 35, '99999-9999', 'Ativo'), ('João Pereira', 'Montador de Veículos', '1473481906', 100, '99999-1010', 'Ativo'), ('Karla Gomes', 'Operador de Máquinas', '1510288306', 85, '99999-1212', 'Ativo'), ('Lucas Fernandes', 'Montador de Veículos', '1583814706', 38, '99999-1313', 'Ativo'), ('Mariana Ribeiro', 'Operador de Máquinas', '1628569906', 25, '99999-1414', 'Ativo'), ('Nicolas Barros', 'Montador de Veículos', '1568089906', 55, '99999-1515', 'Ativo'), ('Olivia Fernandes', 'Operador de Máquinas', '1621398706', 28, '99999-1616', 'Ativo');");

// Supervisores
  await db.customStatement(
      "INSERT INTO Supervisores (supervisorid, nome, cargo, email, telefone, dataadmissao, status) VALUES (101, 'Carlos Pereira', 'Supervisor de Produção', 'carlos.pereira@empresa.com', '99999-0101', '1426393906', 'Ativo'), (102, 'Mariana Silva', 'Supervisor de Qualidade', 'mariana.silva@empresa.com', '99999-0202', '1468322112', 'Ativo'), (103, 'Roberto Almeida', 'Supervisor de Manutenção', 'roberto.almeida@empresa.com', '99999-0303', '1510053312', 'Ativo'), (104, 'Fernanda Costa', 'Supervisor de Logística', 'fernanda.costa@empresa.com', '99999-0404', '1518088512', 'Ativo'), (105, 'Juliano Souza', 'Supervisor de Segurança', 'juliano.souza@empresa.com', '99999-0505', '1557314112', 'Ativo');");

//1. Tabela: ConhecimentoTecnico
  await db.customStatement(
      "INSERT INTO conhecimentotecnico (colaboradorid, descricaoconhecimento, nivelconhecimento, dataavaliacao) VALUES (1, 'Operação de Máquinas CNC', 'Avançado', '1677669312'), (2, 'Manutenção Preventiva', 'Intermediário', '1677669312'), (3, 'Soldagem', 'Básico', '1677669312'), (4, 'Montagem de Veículos', 'Avançado', '1677669312'), (5, 'Operação de Máquinas CNC', 'Intermediário', '1677669312'), (6, 'Manutenção Preventiva', 'Avançado', '1677669312'), (7, 'Montagem de Veículos', 'Básico', '1677669312'), (8, 'Operação de Máquinas CNC', 'Intermediário', '1677669312'), (9, 'Soldagem', 'Avançado', '1677669312'), (10, 'Montagem de Veículos', 'Avançado', '1677669312'), (11, 'Operação de Máquinas CNC', 'Básico', '1688210112'), (12, 'Manutenção Preventiva', 'Intermediário', '1688210112'), (13, 'Soldagem', 'Avançado', '1688210112'), (14, 'Montagem de Veículos', 'Intermediário', '1688210112');");

//2. Tabela: EngajamentoProatividade
  await db.customStatement(
      "INSERT INTO engajamentoproatividade (colaboradorid, pontuacaoengajamento, propostasmelhoria, dataavaliacao) VALUES (1, 85, 5, '1677669312'), (2, 90, 3, '1677669312'), (3, 75, 2, '1677669312'), (4, 88, 4, '1677669312'), (5, 92, 6, '1677669312'), (6, 70, 1, '1677669312'), (7, 95, 7, '1677669312'), (8, 60, 2, '1677669312'), (9, 85, 5, '1677669312'), (10, 90, 4, '1677669312'), (11, 75, 3, '1691493312'), (12, 88, 5, '1691493312'), (13, 92, 6, '1691493312'), (14, 70, 2, '1691493312'), (15, 95, 8, '1691493312'), (16, 60, 3, '1691493312'), (17, 85, 4, '1691493312'), (18, 90, 5, '1691493312'), (19, 75, 6, '1691493312'), (20, 88, 7, '1691493312'), (21, 92, 3, '1691493312'), (22, 70, 2, '1691493312'), (23, 95, 9, '1691493312'), (24, 60, 1, '1691493312'), (25, 85, 5, '1691493312');");

//3. Tabela: CapacidadeComunicacao
  await db.customStatement(
      "INSERT INTO capacidadecomunicacao (colaboradorid, avaliacaocomunicacao, dataavaliacao, feedbackcomunicacao) VALUES (1, 9, '1677669312', 'Excelente comunicação em equipe'), (2, 8, '1677669312', 'Boa interação com colegas'), (3, 7, '1677669312', 'Comunicação precisa melhorar'), (4, 9, '1677669312', 'Ótima capacidade de liderança'), (5, 8, '1677669312', 'Comunicação eficiente'), (6, 6, '1677669312', 'Precisa melhorar clareza nas instruções'), (7, 9, '1677669312', 'Boa interação em equipe'), (8, 7, '1677669312', 'Pode aprimorar comunicação'), (9, 8, '1677669312', 'Comunicação clara e eficiente'), (10, 9, '1677669312', 'Excelente oratória'), (11, 6, '1688210112', 'Precisa melhorar para liderança'), (12, 8, '1688210112', 'Boa comunicação com superiores'), (13, 9, '1688210112', 'Liderança forte e comunicação clara'), (14, 7, '1688210112', 'Precisa melhorar clareza com a equipe');");

//4. Tabela: ResultadosAtingidos
  await db.customStatement(
      "INSERT INTO resultadosatingidos (colaboradorid, metasatingidas, pontuacaoprodutividade, defeitosproduzidos, dataavaliacao) VALUES (1, 10, 95, 1, '1677669312'), (2, 8, 90, 2, '1677669312'), (3, 7, 85, 3, '1677669312'), (4, 9, 93, 1, '1677669312'), (5, 10, 96, 0, '1677669312'), (6, 6, 80, 4, '1677669312'), (7, 9, 92, 2, '1677669312'), (8, 5, 78, 3, '1677669312'), (9, 8, 90, 1, '1677669312'), (10, 10, 97, 0, '1677669312'), (11, 6, 82, 4, '1688210112'), (12, 7, 88, 2, '1688210112'), (13, 9, 92, 1, '1688210112'), (14, 5, 75, 5, '1688210112'), (15, 10, 95, 0, '1688210112');");

//5. Tabela: CapacitacaoTreinamentos
  await db.customStatement(
      "INSERT INTO capacitacaotreinamentos (colaboradorid, nometreinamento, dataconclusao, certificado) VALUES  (1, 'Liderança e Gestão de Equipes', '1654686912', TRUE), (2, 'Lean Manufacturing', '1620472512', TRUE), (3, 'Segurança no Trabalho', '1677669312', FALSE), (4, 'Gestão de Processos', '1654686912', TRUE), (5, 'Liderança e Gestão de Equipes', '1638962112', TRUE), (6, 'Lean Manufacturing', '1678274112', TRUE), (7, 'Segurança no Trabalho', '1623150912', FALSE), (8, 'Gestão de Processos', '1654686912', TRUE), (9, 'Liderança e Gestão de Equipes', '1678274112', TRUE), (10, 'Lean Manufacturing', '1623150912', TRUE), (11, 'Segurança no Trabalho', '1654686912', FALSE), (12, 'Gestão de Processos', '1654686912', TRUE), (13, 'Liderança e Gestão de Equipes', '1678274112', TRUE), (14, 'Lean Manufacturing', '1654686912', TRUE), (15, 'Segurança no Trabalho', '1654686912', FALSE);");

//6. Tabela: FeedbackSupervisores
  await db.customStatement(
      "INSERT INTO feedbacksupervisores (colaboradorid, supervisorid_supervisores, feedback, datafeedback) VALUES  (1, 101, 'Excelente desempenho e potencial de liderança', '1691493312'), (2, 102, 'Bom desempenho, mas precisa desenvolver mais habilidades técnicas', '1691493312'), (3, 103, 'Cumpre suas funções, mas pode melhorar em comunicação', '1691493312'), (4, 104, 'Destaca-se na equipe, ótimo trabalho em equipe', '1691493312'), (5, 105, 'Muito engajado, mas precisa melhorar a capacidade de delegar', '1691493312'), (6, 101, 'Pode melhorar sua assiduidade', '1691493312'), (7, 102, 'Ótima postura, já desenvolveu habilidades de liderança', '1691493312'), (8, 103, 'Focado e eficiente, mas precisa de mais treinamentos', '1691493312'), (9, 104, 'Desempenho consistente, com bom potencial', '1691493312'), (10, 105, 'Liderança sólida e engajamento alto', '1691493312'), (11, 101, 'Precisa melhorar comunicação e resolução de problemas', '1691493312'), (12, 102, 'Bom desempenho geral, mas pode ser mais proativo', '1691493312'), (13, 103, 'Excelente em gestão de conflitos', '1691493312'), (14, 104, 'Deveria focar em melhorar os aspectos técnicos', '1691493312'), (15, 105, 'Liderança nata e ótimo desempenho', '1691493312');");

//7. Tabela: ResolucaoProblemas
  await db.customStatement(
      "INSERT INTO resolucaoproblemas (colaboradorid, descricaoproblemaresolvido, dataresolucao, avaliacaoresolucao) VALUES (1, 'Problema na linha de montagem resolvido em tempo recorde', '1688210112', 9), (2, 'Erros na produção corrigidos em uma semana', '1688210112', 8), (3, 'Atrasos no processo de soldagem ajustados', '1688210112', 7), (4, 'Problema na máquina CNC resolvido rapidamente', '1688210112', 9), (5, 'Falha na comunicação entre equipes resolvida', '1688210112', 8), (6, 'Defeito na montagem de peças solucionado', '1688210112', 6), (7, 'Erros de produção identificados e corrigidos', '1688210112', 9), (8, 'Problema de segurança na linha de produção resolvido', '1688210112', 7), (9, 'Ajustes no processo de fabricação implementados com sucesso', '1688210112', 8), (10, 'Desperdício de material na produção reduzido', '1688210112', 9), (11, 'Problema de falha na máquina solucionado', '1688210112', 6), (12, 'Falha na comunicação interna ajustada', '1688210112', 8), (13, 'Erro de montagem solucionado rapidamente', '1688210112', 9), (14, 'Problema técnico na linha de produção resolvido', '1688210112', 7), (15, 'Defeito em peça corrigido', '1688210112', 9);");

//8. Tabela: AssiduidadePontualidade
  await db.customStatement(
      "INSERT INTO assiduidadepontualidade (colaboradorid, faltasinjustificadas, atrasos, dataregistro) VALUES (1, 0, 1, '1677669312'), (2, 1, 2, '1677669312'), (3, 0, 0, '1677669312'), (4, 0, 1, '1677669312'), (5, 0, 0, '1677669312'), (6, 2, 3, '1677669312'), (7, 0, 0, '1677669312'), (8, 1, 1, '1677669312'), (9, 0, 0, '1677669312'), (10, 0, 1, '1677669312'), (11, 1, 2, '1677669312'), (12, 0, 0, '1677669312'), (13, 0, 0, '1677669312'), (14, 0, 1, '1677669312');");
}
