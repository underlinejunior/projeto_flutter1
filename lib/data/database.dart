import '../models/cidades.dart';
import '../models/pontos.dart';
import '../models/subCategoria.dart';
import '../models/localizacao.dart';

const List<Cidade> cidadesDisponiveis = [
  Cidade(
    id: 'cidade1',
    nome: 'Parnaíba',
    subCategorias: ['historicosCulturais', 'naturaisEcologicos'],
  ),
  Cidade(
    id: 'cidade2',
    nome: 'Luis Correia',
    subCategorias: ['historicosCulturais', 'praias'],
  ),
  Cidade(
    id: 'cidade3',
    nome: 'Cajueiro da Praia',
    subCategorias: ['naturaisEcologicos', 'praias'],
  ),
];

const List<SubCategoria> tiposDePontos = [
  SubCategoria(
    id: 'historicosCulturais',
    nome: 'Históricos e Culturais',
    pontos: ['p1', 'p10', 'p21', 'p27'],
  ),
  SubCategoria(
    id: 'naturaisEcologicos',
    nome: 'Naturais e Ecológicos',
    pontos: ['p2', 'p23', 'p24', 'p34', 'p35'],
  ),
  SubCategoria(
    id: 'praias',
    nome: 'Praias',
    pontos: ['p22', 'p26', 'p31', 'p33', 'p35', 'p36', 'p37', 'p38'],
  ),
];

const List<Ponto> pontosDeInteresse = [
  // Pontos de Parnaíba
  Ponto(
    id: 'p1',
    nome: 'Porto das Barcas',
    descricao: 'Complexo histórico com restaurantes, artesanato e cultura local.',
    cidadeId: 'cidade1',
    subCategoriaId: 'historicosCulturais',
    urlImagem: 'assets/porto_das_barcas.jpg',
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
    descricao: 'O único delta em mar aberto das Américas, com rica biodiversidade.',
    cidadeId: 'cidade1',
    subCategoriaId: 'naturaisEcologicos',
    urlImagem: 'assets/delta.jpg',
    localizacao: Localizacao(latitude: -2.863656, longitude: -41.713559),
    caracteristicas: [
      'Passeios de barco',
      'Observação de caranguejos e aves',
      'Praias isoladas',
    ],
    melhorHorarioParaVisitar: 'Manhã',
  ),
  Ponto(
    id: 'p21',
    nome: 'Lagoa do Portinho',
    descricao: 'Lagoa com vista panórica ideal para relaxar.',
    cidadeId: 'cidade1',
    subCategoriaId: 'historicosCulturais',
    urlImagem: 'assets/lagoa_portinho.png',
    localizacao: Localizacao(latitude: -2.877412, longitude: -41.738125),
    caracteristicas: [
      'Vista panorâmica',
      'Trilhas próximas',
      'Natureza exuberante',
    ],
    melhorHorarioParaVisitar: 'Manhã',
  ),
  Ponto(
    id: 'p27',
    nome: 'Casarão Simplício Dias',
    descricao: 'Símbolo histórico com arquitetura colonial, rico em cultura.',
    cidadeId: 'cidade1',
    subCategoriaId: 'historicosCulturais',
    urlImagem: 'assets/casarao_simplicio.jpg',
    localizacao: Localizacao(latitude: -2.900567, longitude: -41.776234),
    caracteristicas: [
      'Arquitetura histórica',
      'Visitas guiadas disponíveis',
      'Marco cultural',
    ],
    melhorHorarioParaVisitar: 'Tarde',
  ),

  // Pontos de Luís Correia
  Ponto(
    id: 'p10',
    nome: 'Igreja Matriz de Nossa Senhora da Conceição',
    descricao: 'Uma das igrejas mais antigas da região, com arquitetura colonial.',
    cidadeId: 'cidade2',
    subCategoriaId: 'historicosCulturais',
    urlImagem: 'assets/matriz-lc.jpg',
    localizacao: Localizacao(latitude: -2.882578, longitude: -41.658914),
    caracteristicas: [
      'Arquitetura colonial',
      'Patrimônio cultural',
      'Ponto de peregrinação',
    ],
    melhorHorarioParaVisitar: 'Manhã',
  ),
  Ponto(
    id: 'p22',
    nome: 'Praia do Arrombado',
    descricao: 'Praia com ondas fortes, ideal para surfistas e caminhadas.',
    cidadeId: 'cidade2',
    subCategoriaId: 'praias',
    urlImagem: 'assets/arrombado.jpg',
    localizacao: Localizacao(latitude: -2.914567, longitude: -41.573214),
    caracteristicas: [
      'Ótima para surfe',
      'Beleza selvagem',
      'Areias extensas',
    ],
    melhorHorarioParaVisitar: 'Tarde',
  ),
  Ponto(
    id: 'p31',
    nome: 'Praia Peito de Moça',
    descricao: 'Praia com ondas fortes, buscada por surfistas e amantes da natureza.',
    cidadeId: 'cidade2',
    subCategoriaId: 'praias',
    urlImagem: 'assets/peito_de_moca.jpg',
    localizacao: Localizacao(latitude: -2.906789, longitude: -41.574123),
    caracteristicas: [
      'Paisagens rústicas',
      'Pouco movimento',
      'Ótima para surfe',
    ],
    melhorHorarioParaVisitar: 'Manhã',
  ),
  Ponto(
    id: 'p36',
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
    id: 'p37',
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
    id: 'p38',
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

  // Pontos de Cajueiro da Praia
  Ponto(
    id: 'p33',
    nome: 'Praia de Barra Grande',
    descricao: 'Famosa por suas condições para kitesurf e infraestrutura acolhedora.',
    cidadeId: 'cidade3',
    subCategoriaId: 'praias',
    urlImagem: 'assets/barra_grande.jpg',
    localizacao: Localizacao(latitude: -2.902128, longitude: -41.403214),
    caracteristicas: [
      'Kitesurf',
      'Restaurantes e bares',
      'Pousadas aconchegantes',
    ],
    melhorHorarioParaVisitar: 'Manhã',
  ),
  Ponto(
    id: 'p34',
    nome: 'Projeto Peixe-Boi Marinho',
    descricao: 'Iniciativa de preservação ambiental focada no peixe-boi marinho.',
    cidadeId: 'cidade3',
    subCategoriaId: 'naturaisEcologicos',
    urlImagem: 'assets/peixe-boi.png',
    localizacao: Localizacao(latitude: -2.925698, longitude: -41.473001),
    caracteristicas: [
      'Passeios educativos',
      'Conservação ambiental',
      'Riqueza de biodiversidade',
    ],
    melhorHorarioParaVisitar: 'Manhã',
  ),
  Ponto(
    id: 'p35',
    nome: 'Praia de Morro Branco',
    descricao: 'Praia tranquila com areias claras e coqueiros ao longo da orla.',
    cidadeId: 'cidade3',
    subCategoriaId: 'praias',
    urlImagem: 'assets/morro_branco.jpg',
    localizacao: Localizacao(latitude: -2.912345, longitude: -41.410567),
    caracteristicas: [
      'Paisagens paradisíacas',
      'Águas mornas',
      'Tranquilidade',
    ],
    melhorHorarioParaVisitar: 'Tarde',
  ),
];
