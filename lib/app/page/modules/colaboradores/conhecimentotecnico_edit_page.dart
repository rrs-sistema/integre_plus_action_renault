import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/shared_widget_imports.dart';
import 'package:integre_plus_action_renault/app/controller/conhecimentotecnico_controller.dart';
import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/input/input_imports.dart';

class ConhecimentotecnicoEditPage extends StatelessWidget {
	ConhecimentotecnicoEditPage({Key? key}) : super(key: key);
	final conhecimentotecnicoController = Get.find<ConhecimentotecnicoController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: conhecimentotecnicoController.scaffoldKey,	
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('Conhecimentotecnico - ${'editing'.tr}'),
					actions: [
						saveButton(onPressed: conhecimentotecnicoController.save),
						cancelAndExitButton(onPressed: conhecimentotecnicoController.preventDataLoss),
					]
				),				
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: conhecimentotecnicoController.formKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: conhecimentotecnicoController.scrollController,
							child: SingleChildScrollView(
								controller: conhecimentotecnicoController.scrollController,
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
															maxLength: 200,
															controller: conhecimentotecnicoController.descricaoconhecimentoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Descricaoconhecimento',
																labelText: 'Descrição conhecimento',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																conhecimentotecnicoController.conhecimentotecnicoModel.descricaoconhecimento = text;
																conhecimentotecnicoController.formWasChanged = true;
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
															controller: conhecimentotecnicoController.nivelconhecimentoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Nivelconhecimento',
																labelText: 'Nivel conhecimento',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																conhecimentotecnicoController.conhecimentotecnicoModel.nivelconhecimento = text;
																conhecimentotecnicoController.formWasChanged = true;
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
