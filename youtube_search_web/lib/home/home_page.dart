import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_search_web/home/controller/home_controller.dart';

import 'controller/home_state.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({Key? key, required this.controller}) : super(key: key);

  int defineGrid(context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) {
      return 4;
    } else if (width > 700 && width < 1200) {
      return 2;
    // } else if (width > 500 && width < 700) {
    //   return 2;
    } else {
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vídeos'),
      ),
      body: BlocBuilder<HomeController, HomeState>(
        bloc: controller..loadYoutuVideos(),
        builder: (context, state) {
          if (state is HomeStateLoading) {
            return CircularProgressIndicator();
          } else if (state is HomeStateLoadVideos) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: defineGrid(context),
                  childAspectRatio: 16/9, 
                ),
                itemCount: state.youtubeVideos.length,
                itemBuilder: (context, index) {
                  final video = state.youtubeVideos[index];
                  return Container(
                    height: 240,
                    padding: EdgeInsets.all(10),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          video.thumbnail,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: double.infinity,
                            color: Colors.black87,
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              video.title,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                });
          } else {
            return Center(child: Text('Erro ao buscar vídeos'));
          }
        },
      ),
    );
  }
}
