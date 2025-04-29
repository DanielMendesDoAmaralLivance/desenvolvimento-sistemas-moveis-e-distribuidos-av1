# 🚀 Fast Location App

**Fast Location App** é um aplicativo Flutter simples e funcional que permite a consulta de endereços por meio de seus CEPs, além de ser possível traçar rotas até o último endereço consultado. Ele também salva o histórico de buscas localmente usando Hive e MobX para gerenciamento de estado.

## 📦 Dependências

O projeto utiliza as seguintes dependências principais:

- [dio](https://pub.dev/packages/dio) – para requisições HTTP
- [mobx](https://pub.dev/packages/mobx) + [flutter_mobx](https://pub.dev/packages/flutter_mobx) – gerenciamento de estado reativo
- [hive](https://pub.dev/packages/hive) + [hive_flutter](https://pub.dev/packages/hive_flutter) – armazenamento local
- [map_launcher](https://pub.dev/packages/map_launcher) – para abrir mapas externos
- [geocoding](https://pub.dev/packages/geocoding) – para converter endereços em coordenadas

## 🛠️ Como executar localmente

### 1. Clone o repositório

```bash
git clone https://github.com/DanielMendesDoAmaralLivance/desenvolvimento-sistemas-moveis-e-distribuidos-av1.git
cd desenvolvimento-sistemas-moveis-e-distribuidos-av1
```

### 2. Instale as dependências

```bash
flutter pub get
```

### 3. Gere os arquivos `.g.dart` (MobX e Hive)

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Execute o app

Conecte um dispositivo ou inicie um emulador, e então:

```bash
flutter run
```

## 💡 Observações

- O app exige permissão de localização e acesso à internet.
- Certifique-se de testar em um dispositivo físico para funcionalidades como mapa e localização.
- Em caso de erro com o `map_launcher`, a versão `^3.5.0` foi escolhida por compatibilidade.

## 📄 Licença

Este projeto é de uso pessoal/educacional. Sem fins comerciais.