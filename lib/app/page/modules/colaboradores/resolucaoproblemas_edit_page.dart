import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/shared_widget_imports.dart';
import 'package:integre_plus_action_renault/app/controller/resolucaoproblemas_controller.dart';
import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/input/input_imports.dart';

class ResolucaoproblemasEditPage extends StatelessWidget {
	ResolucaoproblemasEditPage({Key? key}) : super(key: key);
	final resolucaoproblemasController = Get.find<ResolucaoproblemasController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: resolucaoproblemasController.scaffoldKey,	
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('Resolucaoproblemas - ${'editing'.tr}'),
					actions: [
						saveButton(onPressed: resolucaoproblemasController.save),
						cancelAndExitButton(onPressed: resolucaoproblemasController.preventDataLoss),
					]
				),				
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: resolucaoproblemasController.formKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: resolucaoproblemasController.scrollController,
							child: SingleChildScrollView(
								controller: resolucaoproblemasController.scrollController,
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
															maxLength: 450,
															maxLines: 3,
															controller: resolucaoproblemasController.descricaoproblemaresolvidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Descricaoproblemaresolvido',
																labelText: 'Problema resolvido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																resolucaoproblemasController.resolucaoproblemasModel.descricaoproblemaresolvido = text;
																resolucaoproblemasController.formWasChanged = true;
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
																hintText: 'Informe os dados para o campo Dataresolucao',
																labelText: 'Dataresolucao',
																usePadding: true,
															),
															isEmpty: false,
															child: DatePickerItem(
																dateTime: resolucaoproblemasController.resolucaoproblemasModel.dataresolucao,
																firstDate: DateTime.parse('1000-01-01'),
																lastDate: DateTime.parse('5000-01-01'),
																onChanged: (DateTime? value) {
																	resolucaoproblemasController.resolucaoproblemasModel.dataresolucao = value;
																	resolucaoproblemasController.formWasChanged = true;
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
															controller: resolucaoproblemasController.avaliacaoresolucaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Avaliacaoresolucao',
																labelText: 'Avaliacaoresolucao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																resolucaoproblemasController.resolucaoproblemasModel.avaliacaoresolucao = int.tryParse(text);
																resolucaoproblemasController.formWasChanged = true;
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
