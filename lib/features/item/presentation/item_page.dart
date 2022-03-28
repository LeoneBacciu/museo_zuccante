import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      appBar: AppBar(),
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
    return Center(
      child: Text(item.title),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
