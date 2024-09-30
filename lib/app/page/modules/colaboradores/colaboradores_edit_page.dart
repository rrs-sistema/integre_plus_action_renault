import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/controller/colaboradores_controller.dart';
import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/input/input_imports.dart';

class ColaboradoresEditPage extends StatelessWidget {
	ColaboradoresEditPage({Key? key}) : super(key: key);
	final colaboradoresController = Get.find<ColaboradoresController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: colaboradoresController.colaboradoresEditPageScaffoldKey,				
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: colaboradoresController.colaboradoresEditPageFormKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: colaboradoresController.scrollController,
							child: SingleChildScrollView(
								controller: colaboradoresController.scrollController,
								child: BootstrapContainer(
									fluid: true,
									padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
									children: <Widget>[
										const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
												BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															maxLength: 100,
															controller: colaboradoresController.nomeController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Nome',
																labelText: 'Nome',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																colaboradoresController.colaboradoresModel.nome = text;
																colaboradoresController.formWasChanged = true;
															},
														),
													),
												),
											],
										),
										const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
												BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															maxLength: 100,
															controller: colaboradoresController.cargoatualController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cargoatual',
																labelText: 'Cargo atual',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																colaboradoresController.colaboradoresModel.cargoatual = text;
																colaboradoresController.formWasChanged = true;
															},
														),
													),
												),
											],
										),
										const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
												BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: InputDecorator(
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Dataadmissao',
																labelText: 'Data admissão',
																usePadding: true,
															),
															isEmpty: false,
															child: DatePickerItem(
																dateTime: colaboradoresController.colaboradoresModel.dataadmissao,
																firstDate: DateTime.parse('1000-01-01'),
																lastDate: DateTime.parse('5000-01-01'),
																onChanged: (DateTime? value) {
																	colaboradoresController.colaboradoresModel.dataadmissao = value;
																	colaboradoresController.formWasChanged = true;
																},
															),
														),
													),
												),
											],
										),
										const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
												BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: colaboradoresController.experienciaatualController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Experienciaatual',
																labelText: 'Experiência atual',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																colaboradoresController.colaboradoresModel.experienciaatual = int.tryParse(text);
																colaboradoresController.formWasChanged = true;
															},
														),
													),
												),
											],
										),
										const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
												BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															maxLength: 20,
															controller: colaboradoresController.telefoneController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Telefone',
																labelText: 'Telefone',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																colaboradoresController.colaboradoresModel.telefone = text;
																colaboradoresController.formWasChanged = true;
															},
														),
													),
												),
											],
										),
										const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
												BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															maxLength: 50,
															controller: colaboradoresController.statusController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Status',
																labelText: 'Status',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																colaboradoresController.colaboradoresModel.status = text;
																colaboradoresController.formWasChanged = true;
															},
														),
													),
												),
											],
										),
										const Divider(
											indent: 10,
											endIndent: 10,
											thickness: 2,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
												BootstrapCol(
													sizes: 'col-12',
													child: Text(
														'field_is_mandatory'.tr,
														style: Theme.of(context).textTheme.bodySmall,
													),
												),
											],
										),
										const SizedBox(height: 10.0),
									],
								),
							),
						),
					),
				),
			);
	}
}
