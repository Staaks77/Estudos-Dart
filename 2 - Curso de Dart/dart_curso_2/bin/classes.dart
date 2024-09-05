void main() {
  Fruta fruta01 = Fruta("Laranja", 100.9, "Rosa", "Doce", 50);
  print(fruta01.nome);
  print(fruta01.cor);

  fruta01.estaMadura(10);

  Legumes mandioca = Legumes("Mandioca", 900.0, "Rosa", true);
  Fruta pera = Fruta("Pera", 50, "Amarelo", "Doce", 30);
  Nozes macadamia = Nozes("Macadamia", 3, "Marrom", "Doce", 5, 10);
  Citricas limao = Citricas("Limao", 100, "Verde", "Azedo", 5, 100);

  mandioca.printAlimento();
  pera.printAlimento();
  macadamia.printAlimento();
  limao.printAlimento();
  mandioca.cozinhar();
  limao.fazerSuco();

  pera.separarIngredientes();
  limao.assar();
  macadamia.separarIngredientes();
  macadamia.fazerMassa();
}

// Classe alimento(Pai)
class Alimento {
  String nome;
  double peso;
  String cor;

  // Método Construtor
  Alimento(this.nome, this.peso, this.cor);

  // Método
  void printAlimento() {
    print("Este(a) $nome pesa $peso gramas e é $cor.");
  }
}

// Classe fruta herdando atributos da classe pai(Alimento)
// Implements -> pegando a função abstrata BOLO
class Fruta extends Alimento implements Bolo {
  // Variaveis
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  // Inicialiando os construtores
  Fruta(
      String nome, double peso, String cor, this.sabor, this.diasDesdeColheita,
      {this.isMadura})
      : super(nome, peso, cor);

  // Método (Função dentro de classe se chama método)
  estaMadura(int diasParaMadura) {
    isMadura = diasDesdeColheita >= diasParaMadura;
    print(
        "A sua $nome foi colhida há $diasDesdeColheita dias e precisa de $diasParaMadura dias para poder comer. Ela está madura? $isMadura");
  }

  // Método fazer suco
  fazerSuco() {
    print("Você fez um ótimo suco de $nome");
  }

  // O override irá sobrescrever a função da classe bolo para atender essa classe em especifico
  @override
  void separarIngredientes() {
    print("Separando os ingredientes...");
  }

  @override
  void fazerMassa() {
    print("Fazendo a massa com ovos e leite ...");
  }

  @override
  void assar() {
    print("Assando...");
  }
}

// Classe Legumes herdando atributos da classe pai(Alimento)
// Implements -> pegando a função abstrata BOLO
class Legumes extends Alimento implements Bolo {
  bool isPrecisaCozinhar;

  // Método Construtor
  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar)
      : super(nome, peso, cor);

  // Método
  void cozinhar() {
    if (isPrecisaCozinhar) {
      print("Pronto, o $nome está cozinhando!");
    } else {
      print("Não precisa cozinhar!");
    }
  }

  // O override irá sobrescrever a função da classe bolo para atender essa classe em especifico
  @override
  void separarIngredientes() {}
  @override
  void fazerMassa() {}
  @override
  void assar() {}
}

// Classe Citricas herdando atributos da classe filha(Fruta)
class Citricas extends Fruta {
  double nivelAzedo;

  // Método Construtor
  Citricas(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.nivelAzedo)
      : super(nome, peso, cor, sabor, diasDesdeColheita);
}

// Classe Nozes hernando atributos da classe filha(Fruta)
class Nozes extends Fruta {
  double porcentagemOleoNatural;

  // Método Construtor
  Nozes(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.porcentagemOleoNatural)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  // Método
  void existeRefri(bool existe) {
    if (existe) {
      print("Existe refrigererante de nozes");
    } else {
      print("Não existe refrigerante de nozes");
    }
  }

  // O override irá sobrescrever a função da classe bolo para atender essa classe em especifico
  @override
  void separarIngredientes() {
    print("Tirando a casca...");
  }

  @override
  void fazerMassa() {
    print("Fazendo a massa do bolo de nozes...");
    // Caso eu queira trazer a funcionalidade da função fazer massa de frutas, eu consido trazer, até porque a classe Nozes está os atributos da classe Fruta
    super.fazerMassa();
  }

  @override
  void assar() {
    print("Assando um bolo de nozes...");
  }
}

// A abstração é um conceito
// Classe abstrata
abstract class Bolo {
  void separarIngredientes();

  void fazerMassa();

  void assar();
}
