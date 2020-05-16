import 'package:flutter/cupertino.dart';
import 'package:letme_app/app/blocs/home/search/search_bloc.dart';
import 'package:letme_app/app/widgets/screens/home/search/search_template.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => SearchBloc(),
      child: SearchTemplate(),
      dispose: (context, bloc) => bloc.dispose(),
    );
  }
}