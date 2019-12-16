# IDDog

### Descrição

ID Dog é um aplicativo iOS que lista imagens de quatro raças de cachorro sendo eles: husky, labrador, hound e pug da api da idwall.
O Aplicativo foi construído usando a arquitetura MVVM mais a camada de Router para navegação entre as telas.
Este projeto usa cocoapods para gerencias as dependências.

É usado:
- Alamofire: usado para fazer chamadas HTTP no servidor da idwall.
- AlamofireImage: usado para fazer cache das imagens

## Requisitos
- Xcode 10.2.1
- iOS 9
- Swift 4.2

## Instruções de como executar o projeto

**Using Terminal:**
1. `git clone https://github.com/cesar-paiva/iddog.git`
2. `cd iddog`
3. `pod install` (requires [CocoaPods](https://cocoapods.org))
4. Open `iddog.xcworkspace` in Xcode 10.2 or higher.

## Dependências

Eu fiz uso dos seguintes projetos e, portanto, pode ser útil estar familiarizado com eles:

### 3rd party

* [Alamofire](https://github.com/Alamofire/Alamofire)
* [AlamofireImage](https://github.com/Alamofire/AlamofireImage)
