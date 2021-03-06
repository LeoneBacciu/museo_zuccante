import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:museo_zuccante/core/colors.dart';
import 'package:museo_zuccante/core/custom_chip.dart';
import 'package:museo_zuccante/core/string_utils.dart';
import 'package:museo_zuccante/features/item/presentation/bloc/item_bloc.dart';
import 'package:museo_zuccante/features/item/presentation/components/header_delegate.dart';
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
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Palette.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomChip(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(item.company.poster),
                      ),
                      text: item.company.title,
                      height: 50,
                      onTap: () => Navigator.of(context).pushNamed('/company/${item.company.id}'),
                    ),
                    CustomChip(
                      leading: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Icon(Icons.pin_drop),
                      ),
                      text: item.room.title,
                      height: 50,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Palette.white,
                ),
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "aBoUt".evilToUpperCase(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        MarkdownBody(data: item.body),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Center(
                  child: Text(
                    "By ${item.author}",
                    style: const TextStyle(
                        fontSize: 15, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
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
