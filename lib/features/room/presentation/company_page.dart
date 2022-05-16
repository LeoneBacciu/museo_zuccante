import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:museo_zuccante/core/colors.dart';
import 'package:museo_zuccante/core/string_utils.dart';
import 'package:museo_zuccante/features/item/presentation/bloc/item_bloc.dart';
import 'package:museo_zuccante/features/room/presentation/components/header_delegate.dart';
import 'package:museo_zuccante/features/room/presentation/bloc/company_bloc.dart';
import 'package:museo_zuccante/models/company.dart';

class CompanyPage extends StatefulWidget {
  final String id;

  const CompanyPage({Key? key, required this.id}) : super(key: key);

  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  void initState() {
    BlocProvider.of<CompanyBloc>(context).add(CompanyLoad(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CompanyBloc, CompanyState>(
        listener: (context, state) {
          if (state is ItemError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('error')));
          }
        },
        builder: (context, state) {
          if (state is CompanyLoading) {
            return _buildLoading();
          }
          if (state is CompanyLoaded) {
            return _buildLoaded(state.room);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildLoaded(Company company) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: HeaderDelegate(company),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
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
                        MarkdownBody(data: company.body),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Center(
                  child: Text(
                    "By ${company}",
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
