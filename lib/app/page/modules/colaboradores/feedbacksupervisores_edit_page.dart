import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/shared_widget_imports.dart';
import 'package:integre_plus_action_renault/app/controller/feedbacksupervisores_controller.dart';
import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/input/input_imports.dart';

class FeedbacksupervisoresEditPage extends StatelessWidget {
	FeedbacksupervisoresEditPage({Key? key}) : super(key: key);
	final feedbacksupervisoresController = Get.find<FeedbacksupervisoresController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: feedbacksupervisoresController.scaffoldKey,	
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('Feedback supervisor - ${'editing'.tr}'),
					actions: [
						saveButton(onPressed: feedbacksupervisoresController.save),
						cancelAndExitButton(onPressed: feedbacksupervisoresController.preventDataLoss),
					]
				),				
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: feedbacksupervisoresController.formKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: feedbacksupervisoresController.scrollController,
							child: SingleChildScrollView(
								controller: feedbacksupervisoresController.scrollController,
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
													child: Row(
														children: <Widget>[
															Expanded(
																flex: 1,
																child: SizedBox(
																	child: TextFormField(
																		controller: feedbacksupervisoresController.supervisoresModelController,
																		validator: ValidateFormField.validateMandatory,
																		readOnly: true,
																		decoration: inputDecoration(
																			hintText: 'Importar Supervisores',
																			labelText: 'Supervisorid Supervisores *',
																			usePadding: true,
																		),
																		onSaved: (String? value) {},
																		onChanged: (text) {},
																	),
																),
															),
															Expanded(
																flex: 0,
																child: lookupButton(onPressed: feedbacksupervisoresController.callSupervisoresLookup),
															),
														],
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
															maxLength: 450,
															maxLines: 3,
															controller: feedbacksupervisoresController.feedbackController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Feedback',
																labelText: 'Feedback',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																feedbacksupervisoresController.feedbacksupervisoresModel.feedback = text;
																feedbacksupervisoresController.formWasChanged = true;
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
