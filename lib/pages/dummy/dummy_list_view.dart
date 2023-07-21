import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../hivedb/repository_data.dart';
import 'dummy_api_call.dart';

class DummyListView extends StatefulWidget {
  const DummyListView({Key? key}) : super(key: key);

  @override
  State<DummyListView> createState() => _DummyListViewState();
}

class _DummyListViewState extends State<DummyListView> {
  late Future<List<RepositoryData>> _repositoryListFuture;

  @override
  void initState() {
    super.initState();
    _repositoryListFuture = DummyApiCall().apiCall();
  }



  @override
  Widget build(BuildContext context) {
    DummyApiCall dummyApiCall = DummyApiCall();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Repository List'),
        ),
        body: FutureBuilder<List<RepositoryData>>(
          future: _repositoryListFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              final repositoryList = snapshot.data!;
              if (repositoryList.isEmpty) {
                return const Center(
                  child: Text('Nothing in this List'),
                );
              } else {
                return RefreshIndicator(
                  onRefresh: dummyApiCall.updateData,
                  child: ListView.builder(
                    itemCount: repositoryList.length,
                    itemBuilder: (context, index) {
                      final repositoryData = repositoryList[index];
                      return ListTile(
                        leading: CachedNetworkImage(
                          imageUrl: repositoryData.imageUrl.toString(),
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                        title: Text(repositoryData.name),
                        subtitle: Text('Price: \$${repositoryData.price.toStringAsFixed(2)}'),
                      );
                    },
                  ),
                );
              }
            } else {
              return const Center(
                child: Text('No data available'),
              );
            }
          },
        ),
      ),
    );
  }
}
