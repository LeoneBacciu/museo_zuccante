import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:museo_zuccante/core/colors.dart';
import 'package:museo_zuccante/features/item/presentation/bloc/item_bloc.dart';
import 'package:museo_zuccante/models/item.dart';

class ItemPage extends StatefulWidget {
  final String id;

  const ItemPage({Key? key, required this.id}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  void initState() {
    BlocProvider.of<ItemBloc>(context).add(ItemLoad(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ItemBloc, ItemState>(
        listener: (context, state) {
          if (state is ItemError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('error')));
          }
        },
        builder: (context, state) {
          if (state is ItemLoading) {
            return _buildLoading();
          }
          if (state is ItemLoaded) {
            return _buildLoaded(state.item);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildLoaded(Item item) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: HeaderDelegate(item),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Item item;

  HeaderDelegate(this.item);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = shrinkOffset / maxExtent;
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: progress,
            child: const ColoredBox(
              color: Palette.primary,
            ),
          ),
          AnimatedOpacity(
            opacity: 1 - progress,
            duration: const Duration(milliseconds: 150),
            child: Image.network(
              item.poster,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topCenter,
                      colors: [Colors.black, Colors.transparent])),
            ),
          ),
          Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              item.title,
              style: const TextStyle(fontSize: 32, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 400;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
