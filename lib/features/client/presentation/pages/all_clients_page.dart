import 'package:flutter/material.dart';
import 'package:sales_master/features/client/presentation/pages/add_client_page.dart';
import 'package:sales_master/features/client/presentation/widgets/all_client.page/sliver_appbar.clients.dart';
import 'package:sales_master/features/client/presentation/widgets/all_client.page/sliver_list.clients.dart';

class AllClientsPage extends StatelessWidget {
  const AllClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor:
              Theme.of(context).colorScheme.background.withOpacity(.6),
          toolbarHeight: 0,
        ),
        body: const CustomScrollView(
          slivers: <Widget>[
            AllClientsSliverAppbar(),
            AllClientsSliverList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 2,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const AddClientDialog();
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
