import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/shared_widget_imports.dart';
import 'package:integre_plus_action_renault/app/controller/engajamentoproatividade_controller.dart';
import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/input/input_imports.dart';

class EngajamentoproatividadeEditPage extends StatelessWidget {
  EngajamentoproatividadeEditPage({Key? key}) : super(key: key);
  final engajamentoproatividadeController = Get.find<EngajamentoproatividadeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: engajamentoproatividadeController.scaffoldKey,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Engajamentoproatividade - ${'editing'.tr}'),
          actions: [
            saveButton(onPressed: engajamentoproatividadeController.save),
            cancelAndExitButton(onPressed: engajamentoproatividadeController.preventDataLoss),
          ]),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Form(
          key: engajamentoproatividadeController.formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Scrollbar(
            controller: engajamentoproatividadeController.scrollController,
            child: SingleChildScrollView(
              controller: engajamentoproatividadeController.scrollController,
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
                            controller:
                                engajamentoproatividadeController.pontuacaoengajamentoController,
                            decoration: inputDecoration(
                              hintText: 'Informe os dados para o campo Pontuacaoengajamento',
                              labelText: 'Pontuação engajamento',
                              usePadding: true,
                            ),
                            onSaved: (String? value) {},
                            onChanged: (text) {
                              engajamentoproatividadeController.engajamentoproatividadeModel
                                  .pontuacaoengajamento = int.tryParse(text);
                              engajamentoproatividadeController.formWasChanged = true;
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
                            controller:
                                engajamentoproatividadeController.propostasmelhoriaController,
                            decoration: inputDecoration(
                              hintText: 'Informe os dados para o campo Propostasmelhoria',
                              labelText: 'Propostas melhoria',
                              usePadding: true,
                            ),
                            onSaved: (String? value) {},
                            onChanged: (text) {
                              engajamentoproatividadeController.engajamentoproatividadeModel
                                  .propostasmelhoria = int.tryParse(text);
                              engajamentoproatividadeController.formWasChanged = true;
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
