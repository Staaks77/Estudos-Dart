void main() {
  String nome = "Laranja";
  double peso = 100.2;
  String cor = "Verde";
  String sabor = "Doce";
  int diasColheita = 10;
  bool isMadura = funcEstaMadura(diasColheita);

  //print(isMadura);
  //print(funcEstaMadura(39));

  //mostrarMadura("maça", 3, peso: 1.4, cor: "azul");

  //int qntsDiasFaltam = funcAmadurecimento(10);
  //print("Faltam $qntsDiasFaltam dias para o amadurecimento.");

  funcFruta(nome: "Uva", cor: "Roxo", peso: 40.0, diasDesdeColheita: 49);
}

// Parametros é diferente de argumento
// Parametro é respectivo a função e argumento a chama da função.

//Parâmetros:
// 1 - Posicionais obrigatórios
// 2 - Nomeados opcionais -> Na função({String? cor}) no argumento -> cor:"vermelho" -> colocar entre chaves {}
// 3 - Parâmetros com "Padrão" -> um valor padrão desde o começo -> String cor = "Sem cor"
// 4 - Modificador "required" -> tornar um parametro obrigatório

// Função para mostrar os detalhes da fruta
mostrarMadura(String nome, int dias,
    {String cor = "Sem cor", required double peso}) {
  if (dias >= 30) {
    print("A $nome está madura");
  } else {
    print("A $nome não está madura");
  }

  print("A cor da $nome é $cor e o peso é $peso");
}

// Função para verificar se a fruta já está madura
bool funcEstaMadura(int dias) {
  if (dias >= 30) {
    return true;
  } else {
    return false;
  }
}

// Função para verificar quanto tempo falta para uma fruta amadurecer
int funcAmadurecimento(int diasAmadurecimento) {
  int dias = 30;
  int qndAmadurece = dias - diasAmadurecimento;
  return qndAmadurece;
}

// Função Fruta
funcFruta(
    {required String nome,
    String cor = "Sem cor",
    double peso = 0,
    required int diasDesdeColheita}) {
  int diasAmadurecer = 40;
  String condicao;

  if (diasDesdeColheita < 40) {
    condicao = "não está";
  } else {
    condicao = "está";
  }

  print(
      "A $nome pesa $peso gramas! Ela foi colhida há $diasDesdeColheita dias e precisa de $diasAmadurecer para amadurecer, logo a $nome $condicao madura");
}
