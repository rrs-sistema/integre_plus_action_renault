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
      "INSERT INTO colaboradores (nome, cargoatual, dataadmissao, experienciaatual, telefone, status) VALUES ('Ana Souza', 'Operador de Máquinas', '2020-05-10', 40, '99999-1111', 'Ativo'), ('Carlos Silva', 'Operador de Máquinas', '2019-07-22', 50, '99999-2222', 'Ativo'), ('Beatriz Oliveira', 'Montador de Veículos', '2021-02-15', 30, '99999-3333', 'Ativo'), ('Daniel Costa', 'Operador de Máquinas', '2018-11-01', 70, '99999-4444', 'Ativo'), ('Elisa Santos', 'Montador de Veículos', '2021-10-30', 20, '99999-5555', 'Ativo'), ('Fernando Lima', 'Montador de Veículos', '2017-03-14', 90, '99999-6666', 'Ativo'), ('Gabriela Sousa', 'Operador de Máquinas', '2019-12-01', 45, '99999-7777', 'Ativo'), ('Henrique Almeida', 'Montador de Veículos', '2022-01-05', 15, '99999-8888', 'Ativo'), ('Isabela Freitas', 'Operador de Máquinas', '2020-06-11', 35, '99999-9999', 'Ativo'), ('João Pereira', 'Montador de Veículos', '2016-09-23', 100, '99999-1010', 'Ativo'), ('Karla Gomes', 'Operador de Máquinas', '2017-11-18', 85, '99999-1212', 'Ativo'), ('Lucas Fernandes', 'Montador de Veículos', '2020-03-20', 38, '99999-1313', 'Ativo'), ('Mariana Ribeiro', 'Operador de Máquinas', '2021-08-07', 25, '99999-1414', 'Ativo'), ('Nicolas Barros', 'Montador de Veículos', '2019-09-28', 55, '99999-1515', 'Ativo'), ('Olivia Fernandes', 'Operador de Máquinas', '2021-05-19', 28, '99999-1616', 'Ativo'), ('Paulo Henrique', 'Montador de Veículos', '2018-04-12', 65, '99999-1717', 'Ativo'), ('Renata Lima', 'Operador de Máquinas', '2020-10-22', 34, '99999-1818', 'Ativo'), ('Sérgio Costa', 'Montador de Veículos', '2017-08-15', 88, '99999-1919', 'Ativo'), ('Tânia Mendes', 'Operador de Máquinas', '2021-12-29', 10, '99999-2020', 'Ativo'), ('Ulisses Neves', 'Montador de Veículos', '2016-07-07', 110, '99999-2121', 'Ativo'), ('Viviane Castro', 'Operador de Máquinas', '2021-09-11', 22, '99999-2222', 'Ativo'), ('Wagner Lopes', 'Montador de Veículos', '2018-06-01', 60, '99999-2323', 'Ativo'), ('Xavier Martins', 'Operador de Máquinas', '2020-02-28', 42, '99999-2424', 'Ativo'), ('Yara Nunes', 'Montador de Veículos', '2021-03-15', 18, '99999-2525', 'Ativo'), ('Zilda Rocha', 'Operador de Máquinas', '2019-01-20', 58, '99999-2626', 'Ativo');");

// Supervisores
  await db.customStatement(
      "INSERT INTO Supervisores (supervisorid, nome, cargo, email, telefone, dataadmissao, status) VALUES (101, 'Carlos Pereira', 'Supervisor de Produção', 'carlos.pereira@empresa.com', '99999-0101', '2015-03-15', 'Ativo'), (102, 'Mariana Silva', 'Supervisor de Qualidade', 'mariana.silva@empresa.com', '99999-0202', '2016-07-22', 'Ativo'), (103, 'Roberto Almeida', 'Supervisor de Manutenção', 'roberto.almeida@empresa.com', '99999-0303', '2017-11-05', 'Ativo'), (104, 'Fernanda Costa', 'Supervisor de Logística', 'fernanda.costa@empresa.com', '99999-0404', '2018-02-18', 'Ativo'), (105, 'Juliano Souza', 'Supervisor de Segurança', 'juliano.souza@empresa.com', '99999-0505', '2019-05-30', 'Ativo');");

//1. Tabela: ConhecimentoTecnico
  await db.customStatement(
      "INSERT INTO conhecimentotecnico (colaboradorid, descricaoconhecimento, nivelconhecimento, dataavaliacao) VALUES (1, 'Operação de Máquinas CNC', 'Avançado', '2023-06-10'), (2, 'Manutenção Preventiva', 'Intermediário', '2023-06-12'), (3, 'Soldagem', 'Básico', '2023-06-15'), (4, 'Montagem de Veículos', 'Avançado', '2023-06-17'), (5, 'Operação de Máquinas CNC', 'Intermediário', '2023-06-18'), (6, 'Manutenção Preventiva', 'Avançado', '2023-06-20'), (7, 'Montagem de Veículos', 'Básico', '2023-06-22'), (8, 'Operação de Máquinas CNC', 'Intermediário', '2023-06-24'), (9, 'Soldagem', 'Avançado', '2023-06-26'), (10, 'Montagem de Veículos', 'Avançado', '2023-06-28'), (11, 'Operação de Máquinas CNC', 'Básico', '2023-07-01'), (12, 'Manutenção Preventiva', 'Intermediário', '2023-07-03'), (13, 'Soldagem', 'Avançado', '2023-07-05'), (14, 'Montagem de Veículos', 'Intermediário', '2023-07-07'), (15, 'Operação de Máquinas CNC', 'Básico', '2023-07-09'), (16, 'Manutenção Preventiva', 'Avançado', '2023-07-11'), (17, 'Montagem de Veículos', 'Intermediário', '2023-07-13'), (18, 'Operação de Máquinas CNC', 'Avançado', '2023-07-15'), (19, 'Soldagem', 'Intermediário', '2023-07-17'), (20, 'Montagem de Veículos', 'Avançado', '2023-07-19'), (21, 'Operação de Máquinas CNC', 'Básico', '2023-07-21'), (22, 'Manutenção Preventiva', 'Intermediário', '2023-07-23'), (23, 'Soldagem', 'Avançado', '2023-07-25'), (24, 'Montagem de Veículos', 'Intermediário', '2023-07-27'), (25, 'Operação de Máquinas CNC', 'Básico', '2023-07-29');");

//2. Tabela: EngajamentoProatividade
  await db.customStatement(
      "INSERT INTO engajamentoproatividade (colaboradorid, pontuacaoengajamento, propostasmelhoria, dataavaliacao) VALUES (1, 85, 5, '2023-07-10'), (2, 90, 3, '2023-07-12'), (3, 75, 2, '2023-07-14'), (4, 88, 4, '2023-07-16'), (5, 92, 6, '2023-07-18'), (6, 70, 1, '2023-07-20'), (7, 95, 7, '2023-07-22'), (8, 60, 2, '2023-07-24'), (9, 85, 5, '2023-07-26'), (10, 90, 4, '2023-07-28'), (11, 75, 3, '2023-08-01'), (12, 88, 5, '2023-08-03'), (13, 92, 6, '2023-08-05'), (14, 70, 2, '2023-08-07'), (15, 95, 8, '2023-08-09'), (16, 60, 3, '2023-08-11'), (17, 85, 4, '2023-08-13'), (18, 90, 5, '2023-08-15'), (19, 75, 6, '2023-08-17'), (20, 88, 7, '2023-08-19'), (21, 92, 3, '2023-08-21'), (22, 70, 2, '2023-08-23'), (23, 95, 9, '2023-08-25'), (24, 60, 1, '2023-08-27'), (25, 85, 5, '2023-08-29');");

//3. Tabela: CapacidadeComunicacao
  await db.customStatement(
      "INSERT INTO capacidadecomunicacao (colaboradorid, avaliacaocomunicacao, dataavaliacao, feedbackcomunicacao) VALUES (1, 9, '2023-06-10', 'Excelente comunicação em equipe'), (2, 8, '2023-06-12', 'Boa interação com colegas'), (3, 7, '2023-06-15', 'Comunicação precisa melhorar'), (4, 9, '2023-06-17', 'Ótima capacidade de liderança'), (5, 8, '2023-06-18', 'Comunicação eficiente'), (6, 6, '2023-06-20', 'Precisa melhorar clareza nas instruções'), (7, 9, '2023-06-22', 'Boa interação em equipe'), (8, 7, '2023-06-24', 'Pode aprimorar comunicação'), (9, 8, '2023-06-26', 'Comunicação clara e eficiente'), (10, 9, '2023-06-28', 'Excelente oratória'), (11, 6, '2023-07-01', 'Precisa melhorar para liderança'), (12, 8, '2023-07-03', 'Boa comunicação com superiores'), (13, 9, '2023-07-05', 'Liderança forte e comunicação clara'), (14, 7, '2023-07-07', 'Precisa melhorar clareza com a equipe'), (15, 9, '2023-07-09', 'Grande capacidade de influenciar o grupo'), (16, 6, '2023-07-11', 'Instruções pouco claras'), (17, 8, '2023-07-13', 'Comunicação com pares é boa'), (18, 9, '2023-07-15', 'Instruções bem recebidas'), (19, 7, '2023-07-17', 'Precisa melhorar no trabalho em grupo'), (20, 9, '2023-07-19', 'Ótima capacidade de comunicação'), (21, 6, '2023-07-21', 'A comunicação ainda precisa de ajustes'), (22, 8, '2023-07-23', 'Comunicação boa com equipe'), (23, 9, '2023-07-25', 'Excelente comunicador'), (24, 7, '2023-07-27', 'Pode melhorar clareza'), (25, 8, '2023-07-29', 'Boa interação com superiores');");

//4. Tabela: ResultadosAtingidos
  await db.customStatement(
      "INSERT INTO resultadosatingidos (colaboradorid, metasatingidas, pontuacaoprodutividade, defeitosproduzidos, dataavaliacao) VALUES (1, 10, 95, 1, '2023-06-10'), (2, 8, 90, 2, '2023-06-12'), (3, 7, 85, 3, '2023-06-15'), (4, 9, 93, 1, '2023-06-17'), (5, 10, 96, 0, '2023-06-18'), (6, 6, 80, 4, '2023-06-20'), (7, 9, 92, 2, '2023-06-22'), (8, 5, 78, 3, '2023-06-24'), (9, 8, 90, 1, '2023-06-26'), (10, 10, 97, 0, '2023-06-28'), (11, 6, 82, 4, '2023-07-01'), (12, 7, 88, 2, '2023-07-03'), (13, 9, 92, 1, '2023-07-05'), (14, 5, 75, 5, '2023-07-07'), (15, 10, 95, 0, '2023-07-09'), (16, 6, 80, 3, '2023-07-11'), (17, 8, 89, 2, '2023-07-13'), (18, 10, 96, 1, '2023-07-15'), (19, 5, 78, 4, '2023-07-17'), (20, 9, 93, 0, '2023-07-19'), (21, 6, 81, 3, '2023-07-21'), (22, 8, 88, 2, '2023-07-23'), (23, 10, 95, 0, '2023-07-25'), (24, 5, 74, 5, '2023-07-27'), (25, 9, 91, 1, '2023-07-29');");

//5. Tabela: CapacitacaoTreinamentos
  await db.customStatement(
      "INSERT INTO capacitacaotreinamentos (colaboradorid, nometreinamento, dataconclusao, certificado) VALUES  (1, 'Liderança e Gestão de Equipes', '2022-05-10', TRUE), (2, 'Lean Manufacturing', '2021-08-15', TRUE), (3, 'Segurança no Trabalho', '2023-01-12', FALSE), (4, 'Gestão de Processos', '2022-06-20', TRUE), (5, 'Liderança e Gestão de Equipes', '2021-12-10', TRUE), (6, 'Lean Manufacturing', '2023-03-18', TRUE), (7, 'Segurança no Trabalho', '2021-04-25', FALSE), (8, 'Gestão de Processos', '2022-08-17', TRUE), (9, 'Liderança e Gestão de Equipes', '2023-02-10', TRUE), (10, 'Lean Manufacturing', '2021-05-15', TRUE), (11, 'Segurança no Trabalho', '2022-07-10', FALSE), (12, 'Gestão de Processos', '2022-09-30', TRUE), (13, 'Liderança e Gestão de Equipes', '2023-04-10', TRUE), (14, 'Lean Manufacturing', '2022-01-18', TRUE), (15, 'Segurança no Trabalho', '2022-10-12', FALSE), (16, 'Gestão de Processos', '2023-02-25', TRUE), (17, 'Liderança e Gestão de Equipes', '2021-11-10', TRUE), (18, 'Lean Manufacturing', '2022-05-30', TRUE), (19, 'Segurança no Trabalho', '2023-06-10', FALSE), (20, 'Gestão de Processos', '2021-03-22', TRUE), (21, 'Liderança e Gestão de Equipes', '2022-12-10', TRUE), (22, 'Lean Manufacturing', '2021-08-19', TRUE), (23, 'Segurança no Trabalho', '2023-03-15', FALSE), (24, 'Gestão de Processos', '2022-06-10', TRUE), (25, 'Liderança e Gestão de Equipes', '2023-07-01', TRUE);");

//6. Tabela: FeedbackSupervisores
  await db.customStatement(
      "INSERT INTO feedbacksupervisores (colaboradorid, supervisorid_supervisores, feedback, datafeedback) VALUES  (1, 101, 'Excelente desempenho e potencial de liderança', '2023-08-01'), (2, 102, 'Bom desempenho, mas precisa desenvolver mais habilidades técnicas', '2023-08-02'), (3, 103, 'Cumpre suas funções, mas pode melhorar em comunicação', '2023-08-03'), (4, 104, 'Destaca-se na equipe, ótimo trabalho em equipe', '2023-08-04'), (5, 105, 'Muito engajado, mas precisa melhorar a capacidade de delegar', '2023-08-05'), (6, 101, 'Pode melhorar sua assiduidade', '2023-08-06'), (7, 102, 'Ótima postura, já desenvolveu habilidades de liderança', '2023-08-07'), (8, 103, 'Focado e eficiente, mas precisa de mais treinamentos', '2023-08-08'), (9, 104, 'Desempenho consistente, com bom potencial', '2023-08-09'), (10, 105, 'Liderança sólida e engajamento alto', '2023-08-10'), (11, 101, 'Precisa melhorar comunicação e resolução de problemas', '2023-08-11'), (12, 102, 'Bom desempenho geral, mas pode ser mais proativo', '2023-08-12'), (13, 103, 'Excelente em gestão de conflitos', '2023-08-13'), (14, 104, 'Deveria focar em melhorar os aspectos técnicos', '2023-08-14'), (15, 105, 'Liderança nata e ótimo desempenho', '2023-08-15'), (16, 101, 'Pode desenvolver mais autonomia', '2023-08-16'), (17, 102, 'Excelente capacidade de resolver problemas', '2023-08-17'), (18, 103, 'Muito bom, apenas melhorar engajamento', '2023-08-18'), (19, 104, 'Competente, mas precisa ser mais assertivo nas decisões', '2023-08-19'), (20, 105, 'Líder completo, pronto para novos desafios', '2023-08-20'), (21, 101, 'Bom desempenho, mas precisa melhorar sua comunicação', '2023-08-21'), (22, 102, 'Muito competente, preparado para o próximo nível', '2023-08-22'), (23, 103, 'Desempenho excelente em todas as áreas', '2023-08-23'), (24, 104, 'Precisa ser mais proativo, mas bom tecnicamente', '2023-08-24'), (25, 105, 'Potencial enorme, futuro líder da empresa', '2023-08-25');");

//7. Tabela: ResolucaoProblemas
  await db.customStatement(
      "INSERT INTO resolucaoproblemas (colaboradorid, descricaoproblemaresolvido, dataresolucao, avaliacaoresolucao) VALUES (1, 'Problema na linha de montagem resolvido em tempo recorde', '2023-07-01', 9), (2, 'Erros na produção corrigidos em uma semana', '2023-07-02', 8), (3, 'Atrasos no processo de soldagem ajustados', '2023-07-03', 7), (4, 'Problema na máquina CNC resolvido rapidamente', '2023-07-04', 9), (5, 'Falha na comunicação entre equipes resolvida', '2023-07-05', 8), (6, 'Defeito na montagem de peças solucionado', '2023-07-06', 6), (7, 'Erros de produção identificados e corrigidos', '2023-07-07', 9), (8, 'Problema de segurança na linha de produção resolvido', '2023-07-08', 7), (9, 'Ajustes no processo de fabricação implementados com sucesso', '2023-07-09', 8), (10, 'Desperdício de material na produção reduzido', '2023-07-10', 9), (11, 'Problema de falha na máquina solucionado', '2023-07-11', 6), (12, 'Falha na comunicação interna ajustada', '2023-07-12', 8), (13, 'Erro de montagem solucionado rapidamente', '2023-07-13', 9), (14, 'Problema técnico na linha de produção resolvido', '2023-07-14', 7), (15, 'Defeito em peça corrigido', '2023-07-15', 9), (16, 'Erros no processo de fabricação ajustados', '2023-07-16', 6), (17, 'Falha em equipamento resolvida', '2023-07-17', 8), (18, 'Problema com matéria-prima resolvido', '2023-07-18', 9), (19, 'Atraso na produção ajustado', '2023-07-19', 7), (20, 'Defeito em série corrigido rapidamente', '2023-07-20', 9), (21, 'Problema na entrega resolvido', '2023-07-21', 6), (22, 'Falha no controle de qualidade ajustada', '2023-07-22', 8), (23, 'Problema no fornecimento de peças resolvido', '2023-07-23', 9), (24, 'Erros em planilha de controle corrigidos', '2023-07-24', 7), (25, 'Ajustes no tempo de produção implementados', '2023-07-25', 9);");

//8. Tabela: AssiduidadePontualidade
  await db.customStatement(
      "INSERT INTO assiduidadepontualidade (colaboradorid, faltasinjustificadas, atrasos, dataregistro) VALUES (1, 0, 1, '2023-06-01'), (2, 1, 2, '2023-06-02'), (3, 0, 0, '2023-06-03'), (4, 0, 1, '2023-06-04'), (5, 0, 0, '2023-06-05'), (6, 2, 3, '2023-06-06'), (7, 0, 0, '2023-06-07'), (8, 1, 1, '2023-06-08'), (9, 0, 0, '2023-06-09'), (10, 0, 1, '2023-06-10'), (11, 1, 2, '2023-06-11'), (12, 0, 0, '2023-06-12'), (13, 0, 0, '2023-06-13'), (14, 0, 1, '2023-06-14'), (15, 0, 0, '2023-06-15'), (16, 2, 3, '2023-06-16'), (17, 0, 1, '2023-06-17'), (18, 1, 0, '2023-06-18'), (19, 0, 0, '2023-06-19'), (20, 0, 0, '2023-06-20'), (21, 1, 2, '2023-06-21'), (22, 0, 0, '2023-06-22'), (23, 0, 1, '2023-06-23'), (24, 0, 0, '2023-06-24'), (25, 0, 1, '2023-06-25');");
}
