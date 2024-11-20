import '../models/cidades.dart';
import '../models/pontos.dart';
import '../models/subCategoria.dart';
import '../models/localizacao.dart';

const List<Cidade> cidadesDisponiveis = [
  Cidade(
    id: 'cidade1',
    nome: 'Parnaíba',
    subCategorias: [
      'complexosHistoricos',
      'atracoesNaturais',
    ],
  ),
  Cidade(
    id: 'cidade2',
    nome: 'Luis Correia',
    subCategorias: [
      'igrejas',
      'praias',
    ],
  ),
  Cidade(
    id: 'cidade3',
    nome: 'Cajueiro da Praia',
    subCategorias: [
      'atracoesEcologicas',
    ],
  ),
];

const List <SubCategoria> tiposDePontosHistoricos = [
  SubCategoria(
    id: 'complexosHistoricos',
    nome: 'Complexos Históricos',
    cidadeId: 'cidade1',
    pontos: [
      'p1',
    ],
  ),
  SubCategoria(
    id: 'igrejas',
    nome: 'Igrejas',
    cidadeId: 'cidade2',
    pontos: [
      'p10',
    ],
  ),
  SubCategoria(
    id: 'praias',
    nome: 'Praias',
    cidadeId: 'cidade2',
    pontos: [
      'p11', 
      'p12',
      'p17',
      'p18',
      'p19', 
      'p20', 
    ],
  ),
  SubCategoria(
    id: 'atracoesNaturais',
    nome: 'Atrações Naturais',
    cidadeId: 'cidade1',
    pontos: [
      'p2',
      'p3',
    ],
  ),
  SubCategoria(
    id: 'atracoesEcologicas',
    nome: 'Atrações Ecológicas',
    cidadeId: 'cidade3',
    pontos: [
      'p14',
    ],
  ),
];

const List <Ponto> pontosDeInteresse = [
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
  Ponto(
    id: 'p2',
    nome: 'Delta do Parnaíba',
    descricao: 'O único delta das Américas em mar aberto...',
    cidadeId: 'cidade1',
    subCategoriaId: 'atracoesNaturais',
    urlImagem: '../assets/delta-do-parnaiba.jpg',
    localizacao: Localizacao(latitude: -2.863656, longitude: -41.713559),
    caracteristicas: [
      'Passeios de barco',
      'Observação de caranguejos e aves',
      'Praias isoladas',
    ],
    melhorHorarioParaVisitar: 'Manhã',
  ),
  Ponto(
    id: 'p3',
    nome: 'Pedra do Sal',
    descricao: 'Praia conhecida pelas formações rochosas e ondas fortes...',
    cidadeId: 'cidade1',
    subCategoriaId: 'atracoesNaturais',
    urlImagem: '../assets/pedra-do-sal.jpg',
    localizacao: Localizacao(latitude: -2.891123, longitude: -41.716789),
    caracteristicas: [
      'Surf',
      'Formações rochosas únicas',
      'Pôr do sol inesquecível',
    ],
    melhorHorarioParaVisitar: 'Tarde',
  ),
  Ponto(
    id: 'p10',
    nome: 'Igreja Matriz de Nossa Senhora da Conceição',
    descricao: 'Uma das igrejas mais antigas da região...',
    cidadeId: 'cidade2',
    subCategoriaId: 'igrejas',
    urlImagem: '../assets/matriz-lc.jpg',
    localizacao: Localizacao(latitude: -2.882578, longitude: -41.658914),
    caracteristicas: [
      'Arquitetura colonial',
      'Patrimônio cultural',
      'Ponto de peregrinação',
    ],
    melhorHorarioParaVisitar: 'Manhã',
  ),
  Ponto(
    id: 'p11',
    nome: 'Praia de Atalaia',
    descricao: 'Praia urbana famosa por sua infraestrutura e águas calmas...',
    cidadeId: 'cidade2',
    subCategoriaId: 'praias',
    urlImagem: '../assets/atalaia.jpg',
    localizacao: Localizacao(latitude: -2.896541, longitude: -41.657012),
    caracteristicas: [
      'Restaurantes à beira-mar',
      'Águas tranquilas',
      'Fácil acesso',
    ],
    melhorHorarioParaVisitar: 'Tarde',
  ),
  Ponto(
    id: 'p12',
    nome: 'Praia do Coqueiro',
    descricao: 'Praia tranquila com coqueiros ao longo da orla...',
    cidadeId: 'cidade2',
    subCategoriaId: 'praias',
    urlImagem: '../assets/coqueiro.jpg',
    localizacao: Localizacao(latitude: -2.904321, longitude: -41.569874),
    caracteristicas: [
      'Ideal para relaxar',
      'Beleza natural',
      'Cabanas e quiosques',
    ],
    melhorHorarioParaVisitar: 'Manhã',
  ),
  Ponto(
    id: 'p14',
    nome: 'Projeto Peixe-Boi Marinho',
    descricao: 'Iniciativa de preservação de uma espécie em extinção...',
    cidadeId: 'cidade3',
    subCategoriaId: 'atracoesEcologicas',
    urlImagem: '../assets/peixe-boi.png',
    localizacao: Localizacao(latitude: -2.925698, longitude: -41.473001),
    caracteristicas: [
      'Conservação ambiental',
      'Observação de animais',
      'Passeios educativos',
    ],
    melhorHorarioParaVisitar: 'Manhã',
  ),
  Ponto(
    id: 'p15',
    nome: 'Praia de Barra Grande',
    descricao: 'Destino paradisíaco conhecido pelo kitesurf...',
    cidadeId: 'cidade3',
    subCategoriaId: 'atracoesEcologicas',
    urlImagem: '../assets/Barra-Grande.jpg',
    localizacao: Localizacao(latitude: -2.901342, longitude: -41.447521),
    caracteristicas: [
      'Kitesurf',
      'Pousadas aconchegantes',
      'Águas cristalinas',
    ],
    melhorHorarioParaVisitar: 'Tarde',
  ),
  Ponto(
    id: 'p16',
    nome: 'Mangue Seco',
    descricao: 'Área de manguezais preservados para trilhas ecológicas...',
    cidadeId: 'cidade3',
    subCategoriaId: 'atracoesEcologicas',
    urlImagem: '../assets/mangue-seco.jpg',
    localizacao: Localizacao(latitude: -2.915678, longitude: -41.462987),
    caracteristicas: [
      'Trilhas ecológicas',
      'Paisagens únicas',
      'Riqueza de biodiversidade',
    ],
    melhorHorarioParaVisitar: 'Manhã',
  ),
  Ponto(
    id: 'p17',
    nome: 'Praia do Macapá',
    descricao: 'Praia isolada, com paisagens paradisíacas e piscinas naturais...',
    cidadeId: 'cidade2',
    subCategoriaId: 'praias',
    urlImagem: '../assets/macapa.jpg',
    localizacao: Localizacao(latitude: -2.914563, longitude: -41.561784),
    caracteristicas: [
      'Piscinas naturais',
      'Local isolado',
      'Ideal para relaxar e fugir do agito',
    ],
    melhorHorarioParaVisitar: 'Manhã',
  ),
  Ponto(
    id: 'p18',
    nome: 'Praia do Arrombado',
    descricao: 'Praia com ondas fortes, atraindo surfistas e amantes da natureza...',
    cidadeId: 'cidade2',
    subCategoriaId: 'praias',
    urlImagem: '../assets/arrombado.jpg',
    localizacao: Localizacao(latitude: -2.897645, longitude: -41.573219),
    caracteristicas: [
      'Ótimo para surfe',
      'Areias extensas',
      'Beleza rústica',
    ],
    melhorHorarioParaVisitar: 'Tarde',
  ),
  Ponto(
    id: 'p19',
    nome: 'Praia de Maramar',
    descricao: 'Conhecida pelas águas mornas e tranquilas, excelente para famílias...',
    cidadeId: 'cidade2',
    subCategoriaId: 'praias',
    urlImagem: '../assets/maramar.jpg',
    localizacao: Localizacao(latitude: -2.904325, longitude: -41.549874),
    caracteristicas: [
      'Águas calmas',
      'Ambiente familiar',
      'Restaurantes e bares',
    ],
    melhorHorarioParaVisitar: 'Manhã',
  ),
  Ponto(
    id: 'p20',
    nome: 'Praia de Carnaubinha',
    descricao: 'Pequena e aconchegante, com pousadas charmosas e tranquilidade...',
    cidadeId: 'cidade2',
    subCategoriaId: 'praias',
    urlImagem: '../assets/carnaubinha.jpg',
    localizacao: Localizacao(latitude: -2.910124, longitude: -41.538671),
    caracteristicas: [
      'Praia tranquila',
      'Pousadas próximas',
      'Águas mornas',
    ],
    melhorHorarioParaVisitar: 'Tarde',
  ),
];
