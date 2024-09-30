import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/shared_widget_imports.dart';
import 'package:integre_plus_action_renault/app/controller/assiduidadepontualidade_controller.dart';
import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/input/input_imports.dart';

class AssiduidadepontualidadeEditPage extends StatelessWidget {
	AssiduidadepontualidadeEditPage({Key? key}) : super(key: key);
	final assiduidadepontualidadeController = Get.find<AssiduidadepontualidadeController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: assiduidadepontualidadeController.scaffoldKey,	
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('Assiduidadepontualidade - ${'editing'.tr}'),
					actions: [
						saveButton(onPressed: assiduidadepontualidadeController.save),
						cancelAndExitButton(onPressed: assiduidadepontualidadeController.preventDataLoss),
					]
				),				
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: assiduidadepontualidadeController.formKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: assiduidadepontualidadeController.scrollController,
							child: SingleChildScrollView(
								controller: assiduidadepontualidadeController.scrollController,
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
															controller: assiduidadepontualidadeController.faltasinjustificadasController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Faltasinjustificadas',
																labelText: 'Faltasinjustificadas',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																assiduidadepontualidadeController.assiduidadepontualidadeModel.faltasinjustificadas = int.tryParse(text);
																assiduidadepontualidadeController.formWasChanged = true;
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
															controller: assiduidadepontualidadeController.atrasosController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Atrasos',
																labelText: 'Atrasos',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																assiduidadepontualidadeController.assiduidadepontualidadeModel.atrasos = int.tryParse(text);
																assiduidadepontualidadeController.formWasChanged = true;
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
																hintText: 'Informe os dados para o campo Dataregistro',
																labelText: 'Dataregistro',
																usePadding: true,
															),
															isEmpty: false,
															child: DatePickerItem(
																dateTime: assiduidadepontualidadeController.assiduidadepontualidadeModel.dataregistro,
																firstDate: DateTime.parse('1000-01-01'),
																lastDate: DateTime.parse('5000-01-01'),
																onChanged: (DateTime? value) {
																	assiduidadepontualidadeController.assiduidadepontualidadeModel.dataregistro = value;
																	assiduidadepontualidadeController.formWasChanged = true;
																},
															),
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
