import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sales_master/features/client/presentation/viewmodels/allClient.viewmodel.dart';

class ClientPage extends ConsumerWidget {
  const ClientPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(clientViewModelProvider(int.parse(id)));
    final surfaceVariant =
        Theme.of(context).colorScheme.surfaceVariant.withOpacity(.6);

    return Scaffold(
      body: product.when(
        data: (product) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: false,
                snap: false,
                pinned: false,
                expandedHeight: 180,
                scrolledUnderElevation: 3,
                elevation: 3,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.trash,
                      size: 20,
                    ),
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        product.name ?? '',
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: surfaceVariant,
                                      borderRadius: BorderRadius.circular(14)),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '1200 \$',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: surfaceVariant,
                                      borderRadius: BorderRadius.circular(14)),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '600 \$',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 300,
                          child: Container(
                            decoration: BoxDecoration(
                              color: surfaceVariant,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: ListView(
                              children: const [
                                ListTile(
                                  title: Text('12-3-2022'),
                                  trailing: Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ),
                                ListTile(
                                  title: Text('11-4-2022'),
                                  trailing: Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ),
                                ListTile(
                                  title: Text('10-5-2022'),
                                  trailing: Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ),
                                ListTile(
                                  title: Text('9-6-2022'),
                                  trailing: Icon(
                                    Icons.check_box_outline_blank_sharp,
                                    color: Colors.red,
                                  ),
                                ),
                                ListTile(
                                  title: Text('8-7-2022'),
                                  trailing: Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) {
          return const Center(
            child: Text('Error'),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.edit,
        ),
      ),
    );
  }
}
