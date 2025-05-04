import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ms_undraw/ms_undraw.dart';
import 'package:sales_master/features/client/presentation/pages/client_page.dart';
import 'package:sales_master/features/client/presentation/viewmodels/allClient.viewmodel.dart';

class AllClientsSliverList extends ConsumerWidget {
  const AllClientsSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allClientsProvider = ref.watch(allClientViewModelProvider);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
      sliver: allClientsProvider.when(
        data: (clients) {
          return clients.isNotEmpty
              ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final client = clients[index];
                      return Container(
                        padding: const EdgeInsets.all(6),
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Theme.of(context)
                              .colorScheme
                              .surfaceVariant
                              .withOpacity(.5),
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          leading: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            radius: 24.0,
                            child: Text(
                              client.name != null && client.name!.isNotEmpty
                                  ? client.name![0].toUpperCase()
                                  : '?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                            ),
                          ),
                          title: Text(
                            client.name ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                          ),
                          subtitle: Text(
                            client.email ?? '',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant
                                  .withOpacity(.6),
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 24.0,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ClientPage(
                                  id: client.id.toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    childCount: clients.length,
                  ),
                )
              : SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 150.h,
                      horizontal: 50.w,
                    ),
                    child: SizedBox(
                      height: 200.h,
                      width: 200.w,
                      child: UnDraw(
                        color: Theme.of(context).colorScheme.primary,
                        illustration: UnDrawIllustration.people,
                        placeholder: const SizedBox.shrink(),
                      ),
                    ),
                  ),
                );
        },
        error: (error, stackTrace) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('Something went wrong'),
            ),
          );
        },
        loading: () {
          return SliverToBoxAdapter(
            child: Center(
              heightFactor: 10.h,
              child: const CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
