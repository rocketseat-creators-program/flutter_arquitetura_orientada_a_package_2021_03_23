<img src="https://storage.googleapis.com/golden-wind/experts-club/capa-github.svg" />

# Flutter - Arquitetura orientada a packages 

Nesse vídeo vou mostrar uma estratégia de arquitetura de código orientada a Package. 
Essa arquitetura irá te ajudar no reaproveitamento da sua regra de negócio, evitando uma duplicidade de código. 
Iremos também consumir a API do Google para leitura do meu canal no Youtube com DIO e para completar ainda vamos apresentar o desenvolvimento utilizando os packages Modular e Flutter Bloc.


## Para criação dos projetos: 

***Mobile***
```
flutter create --project-name=youtube_search_web --org br.com.rocketseat --platforms android,ios -i swift -a kotlin ./youtube_search_mobile
```

***Web***
```
flutter create --project-name=youtube_search_web --org br.com.rocketseat --platforms web ./youtube_search_web
```

Para rodar o projeto você deve alterar o arquivo youtube_repository.dart.

Crie uma chave no google cloud (https://cloud.google.com/) para o service **YouTube Data API v3** 

Altere a linha: 
```
String googleKey = const String.fromEnvironment('GOOGLE_KEY', defaultValue: '');
```

Para:
```
String googleKey = 'SUA_CREDENCIAL';
```



## Expert

| [<img src="https://avatars.githubusercontent.com/u/20157178?s=400&u=e3e485b5e3bb7b6194b351b0e4b34303740bae1e&v=4" width="75px;"/>](https://github.com/rodrigorahman) |
| :-: |
|[Rodrigo Rahman](https://github.com/rodrigorahman)|