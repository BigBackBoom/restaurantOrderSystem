import 'package:flutter/cupertino.dart';
import 'package:letme_app/app/blocs/home/store_detail/store_detail_bloc.dart';
import 'package:letme_app/app/blocs/home/store_detail/store_detail_menu_bloc.dart';
import 'package:letme_app/app/blocs/home/store_detail/store_detail_review_bloc.dart';
import 'package:letme_app/app/blocs/home/store_detail/store_detail_rules_bloc.dart';
import 'package:letme_app/app/widgets/screens/home/store_detail/store_detail_template.dart';
import 'package:provider/provider.dart';

class StoreDetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final int id = ModalRoute.of(context).settings.arguments;

    return MultiProvider(
      providers: [
        Provider<StoreDetailBloc>(
          create: (context) => StoreDetailBloc(id),
          dispose: (context, bloc) => bloc.dispose(),
        ),
        Provider<StoreDetailReviewBloc>(
          create: (context) => StoreDetailReviewBloc(id),
          dispose: (context, bloc) => bloc.dispose(),
        ),
        Provider<StoreDetailMenuBloc>(
          create: (context) => StoreDetailMenuBloc(id),
          dispose: (context, bloc) => bloc.dispose(),
        ),
        Provider<StoreDetailRulesBloc>(
          create: (context) => StoreDetailRulesBloc(id),
          dispose: (context, bloc) => bloc.dispose(),
        ),
      ],
      child: StoreDetailTemplate(),
    );
  }
}
