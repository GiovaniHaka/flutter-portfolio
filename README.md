# Ricky & Morty (pt_BR)

Este aplicativo contém 3 telas:

a. Lista de personagens - exibe uma lista de personagens da série Rick & Morty, mostrando uma imagem, o nome, a espécie, e o número de episódios que o personagem já participou. Nesta mesma tela, é possível realizar uma busca/filtragem de personagens a partir do nome ou da espécie. Também é possível adicionar personagens a lista de favoritos.

b. Detalhes do personagem - exibe os detalhes do personagem selecionado, exibindo sua foto, detalhes específicos, origem, localização e episódios. É possível adicionar o personagem aos favoritos.

c. Personagens favoritos - exibe uma lista de personagens que foram adicionados aos favoritos, sendo possível removê-los.

---
## Arquitetura

O projeto foi desenvolvido utilizando a arquitetura em camadas, sendo inspirada no livro Clean Architecture, Robert Cecil Martin. Esta arquitetura permite o realizar um desenvolvimento baseado em testes, com criação de contratos e interfaces para classes, seguindo pricípios de responsabilidade única. São as camadas:

- domain: camada que contém os modelos e casos de uso de cada feature.

- data: contendo geralmente duas pastas, sendo elas "repositories" que conecta a camada de domain à fo external, realizando também a função de adapters, e a pasta "sources" que realiza conexão externa com os dados.

- presentation: esta camada contém a interface do aplicativo, e realiza a interação direta com o usuário.

 Nas camadas de apresentação, foi utilizado o padrão MVC (Model, View Controller), o que facilita na integração da interface com as camadas de domínio e modelos. 
 
 Também foi utilizado programação funcional, que facilita a propagação de informação através das camadas, bem como o tratamento e exibição de erros ao usuário. 
 
 Por fim, foi desenvolvido um gerencimento de estados, que permite alterar o estado da interface, através da interação do usuário com o aplicativo.

---
## Executando Aplicação

Para executar este aplicativo é necessário realizar a instalação prévia de Dart e Flutter em sua máquina. É possível realizar a instalação a partir da documentação oficial, encontrada [aqui](https://docs.flutter.dev/get-started/install). Este projeto foi desenvolvido em Flutter (3.3.7) e Dart (2.18.4), sendo assim, será necessária a instalação de versões semelhantes ou posteriores ao sdk utilizado. 

O projeto não possui dependências específicas para cada sistema operacional, portanto a execução do aplicativo será semelhante para Andorid e IOS. 

Inicie clonando o repositório em sua máquina.


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

Pacote utilizado para utilização de protocolos Http, utilizado para comunicação entre o aplicativo e apis externas, como por exemplo https://rickandmortyapi.com/. Escolhido pela simplicidade em sua utilização.

### ```dartz``` (^0.10.1)

Este pacote foi utilizado com intuito de facilitar a programação funcional, mais especfificamente utilizando a classe Either, mantendo assim maior confiabilidade de código e tratamento de erros.

### ```rx_notifier``` (^1.1.0)

Este pacote foi utilizado para desenvovler o gerencimento de estado da aplicação. Basicamente este pacote simplifica a utilização do ValueNotifier, sendo uma reatividade nativa do Flutter.
  
### ```cached_network_image``` (^3.2.2)

Este pacote serviu para exibir imagens através de urls, mantendo-as armazenadas em cache, diminuindo a quantidade de pacote de dados utilizados nas exibições de imagens no aplicativo.
  
### ```intl``` (^0.17.0)

Pacote utilizado para converter e formatar uma data (DateTime) em um texto (String).
  
### ```hive``` (^2.2.3)

Banco de dados não relacional, utilizado para armazenar dados referentes aos personagens que foram favoritados. Como este aplicativo necessita armazer apenas chaves chaves, um banco não relacional é mais simples e intuitivo de se trabalhar.

### ```hive_flutter``` (^1.1.0)

Extensão do pacote Hive.
  
### ```mockito``` (^5.3.2)

Framework que facilita a criação de Mocks, que foi utilizado no desenvolvimento dos testes para injeção de dependências nas classes de teste.

<br/>

# Ricky & Morty (en_US)

This app contains 3 screens:

a. Character List - displays a list of characters from Rick & Morty series, showing a picture, name, species, and the number of episodes the character has participated. On this same screen, it is possible to search/filter characters based on name or species. It is also possible to add characters to the favorites list.

b. Character Details - displays details for the selected character, showing their picture, specific details, origin, location and episodes. Also it is possible to add the character to favorites.

c. Favorite Characters - displays a list of characters that have been added to favorites, and eventually can be removed.

---
## Architecture

The project was developed using layered architecture, being inspired by the book Clean Architecture, by Robert Cecil Martin. This architecture allows test driven development, with the creation of contracts and interfaces for classes, following principles of single responsibility. These are the layers:

- domain: layer that contains the models and usecases of each feature.

- data: generally containing two folders, namely "repositories" which connects the domain layer to the external layer, also performing the function of adapters, and the folder "sources" which performs external connection with the data.

- presentation: this layer contains the application's interface, and performs direct interaction with the user.

In the presentation layers, was used MVC (Model, View Controller) pattern, which facilitates the integration of the interface with the domain and model layers.
 
Functional programming was also used, which facilitates the propagation of information through the layers, as well as the treatment and display of errors to the user.
 
Finally, a state management was developed, which allows changing the state of the interface, through the user's interaction with the application.

---
## Getting Started

To run this application, you must first install Dart and Flutter on your machine. It is possible to perform the installation from the official documents, found [here](https://docs.flutter.dev/get-started/install). This project was developed in Flutter (3.3.7) and Dart (2.18.4), therefore, it will be necessary to install versions similar to or later than the SDK used.

The project does not have specific dependencies for each operating system, so the application's execution will be similar for Andorid and IOS. 

Start by cloning the repository on your machine.

<details><summary>iOS</summary><p>

1. Make sure you are running the program on a MacOS.

2. Make sure the version of XCode used is updated.

3. Run the Simulator (iOS emulator) on your machine, with an iOS system equal to or greater than version 14.0. Recommended to use "iPhone 14 Pro".

4. In the project directory (the same directory where the pubspec.yaml file is located) run the command:
```
flutter pub get
```

5. Then, still in the same directory, to run the program in the Simulator, execute the command:
```
flutter run
```

Note: in the event of any failure, run the command ```flutter doctor``` to check any problem with the sdk or installations in the framework.

</p></details>


<details><summary>Android</summary><p>

1. Make sure you have Android Studio installed, as well as Android dependencies and SDKs.

2. Run the Android Emulator (Android emulator) on your machine, with Adnroid system equal to or greater than sdk 30.0 (Android 11).

3. In the project directory (the same directory where the pubspec.yaml file is located) run the command:
```
flutter pub get
```

4. Then, still in the same directory, to run the program on the emulator, execute the command:
```
flutter run
```

Note: in the event of any failure, run the command ```flutter doctor``` to check any problem with the sdk or installations in the framework.

</p></details>

---
## Executando Testes

1. In the project's directory (the same directory where the pubspec.yaml file is located) run the command to ensure that the project's dependencies have been installed:
```
flutter pub get
```

2. Then, in the same directory, to run the tests, execute the command:
```
flutter test
```

---
## Pacotes

### ```dio``` (^4.0.6)

Package used for using Http protocols, used for communication between the application and external APIs, such as https://rickandmortyapi.com/

### ```dartz``` (^0.10.1)

This package was used in order to facilitate functional programming, more specifically using the "Either" class, helping maintaining greater code reliability and error handling.

### ```rx_notifier``` (^1.1.0)

This package was used to develop State Management. Basically, this package simplifies the use of ValueNotifier, a native flutter reactivity.
  
### ```cached_network_image``` (^3.2.2)

This package served to display images through urls, keeping them stored in cache.
  
### ```intl``` (^0.17.0)

Package used to convert and format a date (DateTime) into a pretty text (String).
  
### ```hive``` (^2.2.3)

NoSQL database, used to store data referring to the characters that were favorites.

### ```hive_flutter``` (^1.1.0)

Hive package extension.
  
### ```mockito``` (^5.3.2)

Framework that facilitates the creation of Mocks, used in tests development.