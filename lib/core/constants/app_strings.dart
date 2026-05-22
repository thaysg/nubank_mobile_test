class AppStrings {
  AppStrings._();

  static const homeTitle = 'Link Shortener';
  static const homeSubtitle =
      'Encurte links e acesse seus favoritos\nde forma rápida e fácil.';

  static const inputCardTitle = 'Encurtar link';
  static const inputCardSubtitle = 'Cole o link longo abaixo para encurtá-lo.';
  static const inputHint = 'Cole ou digite um link aqui';
  static const shortenButton = 'Encurtar link';

  static const historyTitle = 'Links encurtados';
  static const historyClear = 'Limpar';
  static const historyEmpty = 'Nenhum link encurtado ainda.';

  static const copySuccess = 'Link copiado!';

  static const navShortener = 'Encurtador';
  static const navAbout = 'Sobre';

  static const errorPrefix = 'Erro: ';
  static const retry = 'Tentar novamente';
  static const errorUnknown = 'Algo deu errado.';
  static const errorNoInternet = 'Sem conexão com a internet.';
  static const errorNotFound = 'URL não encontrada.';
  static const errorInvalidUrl =
      'Insira uma URL válida (ex: https://google.com)';

  static String errorServer(int code) => 'Erro no servidor ($code).';
}
