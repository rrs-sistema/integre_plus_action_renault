import 'package:flutter/material.dart';
import 'package:integre_plus_action_renault/app/data/dto/dto.dart';
import 'package:integre_plus_action_renault/app/infra/colors.dart';

class ExpenseWidget extends StatelessWidget {
  final ConhecimentoTecnicoDto expense;

  const ExpenseWidget({Key? key, required this.expense}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Row(
        children: [
          Container(
            height: 10,
            width: 10,
            margin: const EdgeInsets.only(right: 18),
            decoration: BoxDecoration(
              color: getColor(expense.index!),
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              "${expense.nivelConhecimento} - ${expense.percentualColaborador!.round()}%",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
