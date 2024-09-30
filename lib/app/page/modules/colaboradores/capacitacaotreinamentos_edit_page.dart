import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/shared_widget_imports.dart';
import 'package:integre_plus_action_renault/app/controller/capacitacaotreinamentos_controller.dart';
import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/input/input_imports.dart';

class CapacitacaotreinamentosEditPage extends StatelessWidget {
  CapacitacaotreinamentosEditPage({Key? key}) : super(key: key);
  final capacitacaotreinamentosController = Get.find<CapacitacaotreinamentosController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: capacitacaotreinamentosController.scaffoldKey,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Capacitacaotreinamentos - ${'editing'.tr}'),
          actions: [
            saveButton(onPressed: capacitacaotreinamentosController.save),
            cancelAndExitButton(onPressed: capacitacaotreinamentosController.preventDataLoss),
          ]),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Form(
          key: capacitacaotreinamentosController.formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Scrollbar(
            controller: capacitacaotreinamentosController.scrollController,
            child: SingleChildScrollView(
              controller: capacitacaotreinamentosController.scrollController,
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
                            maxLength: 150,
                            controller: capacitacaotreinamentosController.nometreinamentoController,
                            decoration: inputDecoration(
                              hintText: 'Informe os dados para o campo Nometreinamento',
                              labelText: 'Nome treinamento',
                              usePadding: true,
                            ),
                            onSaved: (String? value) {},
                            onChanged: (text) {
                              capacitacaotreinamentosController
                                  .capacitacaotreinamentosModel.nometreinamento = text;
                              capacitacaotreinamentosController.formWasChanged = true;
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
                              hintText: 'Informe os dados para o campo Dataconclusao',
                              labelText: 'Data conclusão',
                              usePadding: true,
                            ),
                            isEmpty: false,
                            child: DatePickerItem(
                              dateTime: capacitacaotreinamentosController
                                  .capacitacaotreinamentosModel.dataconclusao,
                              firstDate: DateTime.parse('1000-01-01'),
                              lastDate: DateTime.parse('5000-01-01'),
                              onChanged: (DateTime? value) {
                                capacitacaotreinamentosController
                                    .capacitacaotreinamentosModel.dataconclusao = value;
                                capacitacaotreinamentosController.formWasChanged = true;
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
                            controller: capacitacaotreinamentosController.certificadoController,
                            decoration: inputDecoration(
                              hintText: 'Informe os dados para o campo Certificado',
                              labelText: 'Certificado',
                              usePadding: true,
                            ),
                            onSaved: (String? value) {},
                            onChanged: (text) {
                              capacitacaotreinamentosController
                                  .capacitacaotreinamentosModel.certificado = text == 'S';
                              capacitacaotreinamentosController.formWasChanged = true;
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
