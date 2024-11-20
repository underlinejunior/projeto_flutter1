# Aplicativo de Pontos Turísticos do Litoral Piauiense 🌊

## 📖 Descrição

Este aplicativo foi desenvolvido em Flutter para listar e organizar os **pontos turísticos do litoral piauiense**, classificados por tipos (praias, restaurantes, atrativos culturais, etc.) e cidades. Ele busca oferecer uma experiência intuitiva para ajudar os usuários a explorar as belezas da região.

---

## 🛠️ Tecnologias Utilizadas

- **Linguagem:** Dart  
- **Framework:** Flutter  

---

## 🚀 Funcionalidades

- **Listagem de Pontos Turísticos:**  
  Visualize os locais organizados por categorias e cidades.
  
- **Detalhes do Local:**  
  Acesse informações detalhadas de cada ponto turístico, incluindo descrições e imagens.


## 📂 Estrutura do Projeto

├── assets/
├── lib/ 
├── main.dart 
│├── data/
**Telas do aplicativo**
 │├── screens/
**Modelos de dados** 
  │├── models/ 
  │├──widgets/ 
  

---

## 🌐 Como Executar

### Requisitos
- **Flutter SDK** instalado ([Guia de instalação](https://docs.flutter.dev/get-started/install))
- **Git**

### Passos

1. **Clone o repositório:**
   ```
   git clone https://github.com/underlinejunior/projeto_flutter1.git

2. **Instale as dependências:**
    ```
    flutter pub get
    

3. **Execute o aplicativo:**
   
    ```
    flutter run


## 📊 Exemplos de Dados
Cidades
```
Cidade(
    id: 'cidade1',
    nome: 'Parnaíba',
    subCategorias: [
      'complexosHistoricos',
      'atracoesNaturais',
    ],
)
```
Tipos de pontos turisticos
```
SubCategoria(
    id: 'complexosHistoricos',
    nome: 'Complexos Históricos',
    cidadeId: 'cidade1',
    pontos: [
      'p1',
    ],
  ),
  ```
 Pontos turisticos
```
 Ponto(
    id: 'p1',
    nome: 'Porto das Barcas',
    descricao: 'Um charmoso complexo histórico com restaurantes...',
    cidadeId: 'cidade1',
    subCategoriaId: 'complexosHistoricos',
    urlImagem: '../assets/porto_das_barcas.jpg',
    localizacao: Localizacao(latitude: -2.902828, longitude: -41.775462),
    caracteristicas: [
      'Construções históricas',
      'Artesanato local',
      'Gastronomia típica',
    ],
    melhorHorarioParaVisitar: 'Tarde para o pôr do sol',
  ),
```
## Pontos túristicos cadastrados
**Parnaíba**
    - 'Porto das Barcas'
    - 'Delta do Parnaíba',
    - 'Pedra do Sal',
**Luis Correia**
    - 'Igreja Matriz de Nossa Senhora da Conceição',
    - 'Praia de Atalaia',
    - 'Praia do Coqueiro',
    - 'Praia do Macapá',
    - 'Praia do Arrombado',
    - 'Praia de Maramar',
    - 'Praia de Carnaubinha',
**Cajueiro da Praia** 
    - 'Projeto Peixe-Boi Marinho',
    - 'Praia de Barra Grande',
    - 'Mangue Seco',

## 📧 Contato
Caso tenha dúvidas ou sugestões, entre em contato:

**Nome:** Evaldo Júnior
**E-mail:** [texjunior86@gmail.com](mailto:texjunior86@gmail.com)
**GitHub:** [underlinejunior](http:\\github.com\underlinejunior)