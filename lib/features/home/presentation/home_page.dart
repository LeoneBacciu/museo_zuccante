import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:museo_zuccante/features/home/presentation/bloc/home_bloc.dart';
import 'package:museo_zuccante/features/home/presentation/components/custom_header_delegate.dart';
import 'package:museo_zuccante/models/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            height: 100,
            child: Container(
              child: TextField(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = items[index % items.length];
              return ListTile(
                leading: Image.network(item.poster),
                title: Text(item.title),
                onTap: () => Navigator.pushNamed(context, '/item/${item.id}'),
              );
            },
            childCount: 100,
          ),
        ),
      ],
    );
  }
}
