import 'package:flutter/cupertino.dart';
import 'package:letme_app/app/blocs/select_language/language_all_bloc.dart';
import 'package:letme_app/app/widgets/screens/select_language/select_language_page.dart';
import 'package:provider/provider.dart';

class SelectLanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<LanguageAllBloc>(
      create: (context) => LanguageAllBloc(),
      child: SelectLanguagePage(),
      dispose: (context, bloc) => bloc.dispose(),
    );
  }
}