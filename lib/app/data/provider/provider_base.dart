import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/message_dialog.dart';

class ProviderBase {
	Future handleResultError(String? body, Map<String, String>? headers, {Exception? exception}) async {
		if (Session.waitDialogIsOpen) {
			closeWaitDialogBox();
		}

		String erro = 'Error: ${DateTime.now().toIso8601String()} - Exception: ${exception?.toString() ?? ''}';
		StackTrace stack = StackTrace.fromString('Message: ${body?.toString() ?? ''}');
		showErrorDialog('$erro\n\n$stack');
	}

}