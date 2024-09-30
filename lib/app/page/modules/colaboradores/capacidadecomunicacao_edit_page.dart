import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/shared_widget_imports.dart';
import 'package:integre_plus_action_renault/app/controller/capacidadecomunicacao_controller.dart';
import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/input/input_imports.dart';

class CapacidadecomunicacaoEditPage extends StatelessWidget {
	CapacidadecomunicacaoEditPage({Key? key}) : super(key: key);
	final capacidadecomunicacaoController = Get.find<CapacidadecomunicacaoController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: capacidadecomunicacaoController.scaffoldKey,	
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('Capacidadecomunicacao - ${'editing'.tr}'),
					actions: [
						saveButton(onPressed: capacidadecomunicacaoController.save),
						cancelAndExitButton(onPressed: capacidadecomunicacaoController.preventDataLoss),
					]
				),				
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: capacidadecomunicacaoController.formKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: capacidadecomunicacaoController.scrollController,
							child: SingleChildScrollView(
								controller: capacidadecomunicacaoController.scrollController,
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
															controller: capacidadecomunicacaoController.avaliacaocomunicacaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Avaliacaocomunicacao',
																labelText: 'Avaliação comunicação',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																capacidadecomunicacaoController.capacidadecomunicacaoModel.avaliacaocomunicacao = int.tryParse(text);
																capacidadecomunicacaoController.formWasChanged = true;
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
															controller: capacidadecomunicacaoController.feedbackcomunicacaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Feedbackcomunicacao',
																labelText: 'Feedback comunicação',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																capacidadecomunicacaoController.capacidadecomunicacaoModel.feedbackcomunicacao = text;
																capacidadecomunicacaoController.formWasChanged = true;
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
