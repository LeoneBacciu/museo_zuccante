import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:museo_zuccante/core/colors.dart';
import 'package:museo_zuccante/core/string_utils.dart';
import 'package:museo_zuccante/features/home/presentation/bloc/home_bloc.dart';
import 'package:museo_zuccante/features/home/presentation/components/custom_header_delegate.dart';
import 'package:museo_zuccante/features/home/presentation/components/horizontal_card.dart';
import 'package:museo_zuccante/features/home/presentation/components/list_header.dart';
import 'package:museo_zuccante/features/home/presentation/components/top_visited_list.dart';
import 'package:museo_zuccante/models/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String filter = '';

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('error')));
          }
        },
        builder: (context, state) {
          if (state is HomeLoading) {
            return _buildLoading();
          }
          if (state is HomeLoaded) {
            return _buildLoaded(state.items);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildLoaded(List<Item> items) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: CustomHeaderDelegate(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Zuccante Museum",
                        style: TextStyle(color: Palette.white, fontSize: 20),
                      ),
                      TextField(
                        onChanged: (e) => setState(() => filter = e),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            fillColor: Palette.white,
                            filled: true,
                            hintText: 'Search...',
                            prefixIcon: const Icon(Icons.search),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 5)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        TopVisitedList(items: items.where((e) => e.highlighted).toList()),
        const SliverToBoxAdapter(
          child: ListHeader(
            title: "nEwS aNd ExIbItIoNs",
            height: 60,
          ),
        ),
        Builder(builder: (context) {
          final itemsFiltered =
              items.where((e) => e.title.icontains(filter)).toList();
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => HorizontalCard(item: itemsFiltered[index]),
              childCount: itemsFiltered.length,
            ),
          );
        }),
        SliverToBoxAdapter(
          child: Container(
            height: 40,
            color: Palette.primary,
          ),
        )
      ],
    );
  }
}
