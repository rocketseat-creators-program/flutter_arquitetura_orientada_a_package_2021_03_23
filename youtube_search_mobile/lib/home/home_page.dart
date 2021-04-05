import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_search_mobile/home/controller/home_controller.dart';

import 'controller/home_state.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({Key? key, required this.controller}) : super(key: key);

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
            return ListView.builder(
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
                            child: Text(video.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        )
                      ],
                    ),
                  );
                });
          } else{
            return Center(child: Text('Erro ao buscar vídeos'));
          }
        },
      ),
    );
  }
}
