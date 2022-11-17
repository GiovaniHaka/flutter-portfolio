# Ricky & Morty

Este aplicativo contém 3 telas:

a. Lista de personagens - exibe uma lista de personagens da série Rick & Morty, mostrando uma imagem, o nome, a espécie, e o número de episódios que o personagem já participou. Nesta mesma tela, é possível realizar uma busca/filtragem de personagens a partir do nome ou da espécie. Também é possível adicionar personagens a lista de favoritos.

b. Detalhes do personagem - exibe os detalhes do personagem selecionado, exibindo sua foto, detalhes específicos, origem, localização e episódios. É possível adicionar o personage aos favoritos.

c. Personagens favoritos - exibe uma lista de personagens que foram adicionados aos favoritos, sendo possível removê-los.

---
## Executando Aplicação

Para executar este aplicativo é necessário realizar a instalação prévia de Dart e Flutter em sua máquina. É possível realizar a instalação a partir da documentação oficial, encontrada aqui. Este projeto foi desenvolvido em Flutter (3.3.7) e Dart (2.18.4), sendo assim, será necessária a instalação de versões semelhantes ou posteriores ao sdk utilizado. 

O projeto não possui dependências específicas para cada sistema operacional, portanto a execução do aplicativo será semelhante para Andorid e IOS. Inicie clonando o repositório em sua máquina.


<details><summary>iOS</summary><p>

1. Certifique-se que está executando o programa em um sitema Mac.

2. Certifique-se que a versão utilizada do XCode esteja atualizada.

3. Execute o Simulator (emulador iOS) em sua máquina, com sistema iOS igual ou superior a versão 14.0. Recomendado utilizar "iPhone 14 Pro".

4. No diretório do projeto (o mesmo diretório que se encontra o arquivo pubspec.yaml) execute o comando:
```
flutter pub get
```

5. Em seguida, ainda no mesmo diretório, para executar o programa no Simulator, execute o comando:
```
flutter run
```

Obs: na ocorrência de alguma falha, execute o comando ```flutter doctor``` para verificar qualquer problema de sdk ou instalações no framework.

</p></details>


<details><summary>Android</summary><p>

1. Certifique-se que possua Android Studio instalado, bem como as dependências e sdks do Android.

2. Execute o Android Emulator (emulador Android) em sua máquina, com sistema Adnroid igual ou superior ao sdk 30.0 (Android 11).

3. No diretório do projeto (o mesmo diretório que se encontra o arquivo pubspec.yaml) execute o comando:
```
flutter pub get
```

4. Em seguida, ainda no mesmo diretório, para executar o programa no emulador, execute o comando:
```
flutter run
```

Obs: na ocorrência de alguma falha, execute o comando ```flutter doctor``` para verificar qualquer problema de sdk ou instalações no framework.

</p></details>

---
## Executando Testes

1. No diretório do projeto (o mesmo diretório que se encontra o arquivo pubspec.yaml) execute o comando, para garantir que as dependencias do projeto tenham sido instaladas:
```
flutter pub get
```

2. Em seguida, no mesmo diretório, para rodar os testes, execute o comando:
```
flutter test
```

---
## Pacotes

### ```dio``` (^4.0.6)

Pacote utilizado para utilização de protocolos Http, utilizado para comunicação entre o aplicativo e apis externas, como por exemplo https://rickandmortyapi.com/

### ```dartz``` (^0.10.1)

Este pacote foi utilizado com intuito de facilitar a programação funcional, mais especfificamente utilizando a classe Either, mantendo assim maior confiabilidade de código e trataemtno de erros.

### ```rx_notifier``` (^1.1.0)

Este pacote foi utilizado para desenvovler o gerencimento de estado da aplicação. Basicamente este pacote simplifica a utilização do ValueNotifier, uma reatividade nativa do Flutter.
  
### ```cached_network_image``` (^3.2.2)

Este pacote serviu para exibir imagens através de urls, mantendo-as armazenadas em cache, diminuindo a quantidade de pacote de dados utilizados nas exibições de imagens no aplicativo.
  
### ```intl``` (^0.17.0)

Pacote utilizado para converter e formatar uma data (DateTime) em um texto (String).
  
### ```hive``` (^2.2.3)

Banco de dados não relacional, utilizado para armazenar dados referentes aos personagens que foram favoritados.

### ```hive_flutter``` (^1.1.0)

Extensão do pacote Hive.
  
### ```mockito``` (^5.3.2)

Framework que facilita a criação de Mcks, utilizado no desenvolvimento dos testes.
