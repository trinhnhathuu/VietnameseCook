import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/category_model.dart';
import '../providers/categories_providers.dart';

class CategoriesPage extends ConsumerWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(categoriesFutureProvider);
    final query = ref.watch(categoriesQueryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Categories (Riverpod + Dio)')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Tìm kiếm category...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      ref.read(categoriesQueryProvider.notifier).state = query.copyWith(
                        page: 1,
                        search: value,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: query.ordering,
                  hint: const Text('Sắp xếp'),
                  items: const [
                    DropdownMenuItem(value: 'sort_order', child: Text('sort_order')),
                    DropdownMenuItem(value: 'name_vi', child: Text('name_vi')),
                    DropdownMenuItem(value: 'created_at', child: Text('created_at')),
                  ],
                  onChanged: (value) {
                    ref.read(categoriesQueryProvider.notifier).state = query.copyWith(
                      page: 1,
                      ordering: value,
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: asyncValue.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text('Lỗi: ${err.toString()}')),
              data: (PaginatedResponse<CategoryModel> data) {
                if (data.results.isEmpty) {
                  return const Center(child: Text('Không có dữ liệu'));
                }
                return ListView.separated(
                  itemCount: data.results.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final item = data.results[index];
                    return ListTile(
                      title: Text(item.nameVi ?? item.name),
                      subtitle: Text('ID: ${item.id} • sort: ${item.sortOrder ?? '-'}'),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed:
                      query.page > 1
                          ? () {
                            ref.read(categoriesQueryProvider.notifier).state = query.copyWith(
                              page: query.page - 1,
                            );
                          }
                          : null,
                  child: const Text('Prev'),
                ),
                Text('Page ${query.page}'),
                ElevatedButton(
                  onPressed: () {
                    ref.read(categoriesQueryProvider.notifier).state = query.copyWith(
                      page: query.page + 1,
                    );
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
