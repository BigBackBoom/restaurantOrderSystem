import 'package:flutter/cupertino.dart';
import 'package:letme_app/app/blocs/home/store_detail/store_detail_bloc.dart';
import 'package:letme_app/app/blocs/home/store_detail/store_detail_menu_bloc.dart';
import 'package:letme_app/app/widgets/screens/home/store_detail/store_detail_template.dart';
import 'package:provider/provider.dart';

class StoreDetailPage extends StatelessWidget {
  final int id;

  StoreDetailPage({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<StoreDetailBloc>(
          create: (context) => StoreDetailBloc(id),
          dispose: (context, bloc) => bloc.dispose(),
        ),
        Provider<StoreDetailMenuBloc>(
          create: (context) => StoreDetailMenuBloc(id),
          dispose: (context, bloc) => bloc.dispose(),
        ),
      ],
      child: StoreDetailTemplate(),
    );
  }
}
