import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/shared_widget_imports.dart';
import 'package:integre_plus_action_renault/app/controller/resultadosatingidos_controller.dart';
import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/input/input_imports.dart';

class ResultadosatingidosEditPage extends StatelessWidget {
	ResultadosatingidosEditPage({Key? key}) : super(key: key);
	final resultadosatingidosController = Get.find<ResultadosatingidosController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: resultadosatingidosController.scaffoldKey,	
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('Resultadosatingidos - ${'editing'.tr}'),
					actions: [
						saveButton(onPressed: resultadosatingidosController.save),
						cancelAndExitButton(onPressed: resultadosatingidosController.preventDataLoss),
					]
				),				
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: resultadosatingidosController.formKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: resultadosatingidosController.scrollController,
							child: SingleChildScrollView(
								controller: resultadosatingidosController.scrollController,
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
															controller: resultadosatingidosController.metasatingidasController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Metasatingidas',
																labelText: 'Metas atingidas',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																resultadosatingidosController.resultadosatingidosModel.metasatingidas = int.tryParse(text);
																resultadosatingidosController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: resultadosatingidosController.pontuacaoprodutividadeController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Pontuacaoprodutividade',
																labelText: 'Pontuação produtividade',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																resultadosatingidosController.resultadosatingidosModel.pontuacaoprodutividade = int.tryParse(text);
																resultadosatingidosController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: resultadosatingidosController.defeitosproduzidosController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Defeitosproduzidos',
																labelText: 'Defeitos produzidos',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																resultadosatingidosController.resultadosatingidosModel.defeitosproduzidos = int.tryParse(text);
																resultadosatingidosController.formWasChanged = true;
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
