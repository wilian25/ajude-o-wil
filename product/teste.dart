/*
 Implemente um exercício que simule as operações de:
a. Cadastro de Clientes (Inserir, Buscar e Deletar);
b. Cadastro de Produtos (Inserir, Buscar e Deletar);
c. Estoque;
d. Venda;
e. Relatório de Clientes Cadastrados;
f. Relatório de Total de Vendas.
2. Cada grupo deverá realizar para um segmento especifico.
Observação: Enviar o nome do grupo e segmento no grupo do WhatsApp. Lembrando que o
trabalho poderá ser realizado em grupo de no máximo duas pessoas.

*/
import 'dart:io';

List<Map<String,dynamic>>listadeClientes=[];
List<Map<String,dynamic>>listadeProdutos=[];
List<Map<String,dynamic>>listadeEstoque=[];
List<Map<String,dynamic>>listadeVendas=[];
void main(List<String> args) {
  MenuPricipal();
}
MenuPricipal(){
  print('BEM VINDO AO SISTEMA DE CADASTRO!!!');
  print('Por favor!.Insira um numero de acordo com a opca desejada!!');
  print('1-Clientes');
  print('2-Produtos');
  print('3-Estoque');
  print('4-Venda');
  print('5-relatorio de clientes cadastrados');
  print('6-relatorio de vendas');
  print('7-Sair');
  int? resposta = int.parse(stdin.readLineSync()!);

  switch(resposta){
    case 1 :
    sistemadeClientes();
    break;

    case 2 :
    sistemadeProdutos();
    break;

    case 3 :
    sistemadeEstoque();
    break;

    case 4 :
    sistemadeVendas();
    break;

    case 5 :
    relatoriodeClientesCadastrados();
    break;

    case 6 :
    relatoriodeVendas();
    break;

    case 7 :
    print('SISTEMA DE CADASTRO FINALIZADO!!!');
    break;

    default:
    print('opcao invalida.Tente novamente!!!');
    return MenuPricipal();
  }
}
void sistemadeClientes(){
   print('BEM VINDO AO SISTEMA DE CADASTRO DE CLIENTES!!!');
   print('insira a opcao desejada:');
   print('1-inserir');
   print('2-buscar');
   print('3-deletar');
  int? opcao=int.parse(stdin.readLineSync()!);
  print(opcao);
  switch(opcao){
  case 1 :
    print('Bem vindo ao sistema de inserir cliente!!!');
    Map<String,dynamic>listaDeClientes={};
    print('por favor.digite o nome do cliente que deseja INSERIR:');
    listaDeClientes['nome']=stdin.readLineSync();
    print('Digite a sua idade:');
    listaDeClientes['idade'] = stdin.readLineSync();
    print('digite o seu cidade:');
    listaDeClientes['cidade'] = stdin.readLineSync();
    print('digite o seu Estado:');
    listaDeClientes['Estado'] = stdin.readLineSync();

    listadeClientes.add(listaDeClientes);
    print(listaDeClientes);

    break;
 
  case 2 :
  
    print('BEM VINDO AO SISTEMA DE BUSCAR CLIENTE!!!');
    print('por favor.digite o nome do cliente que deseja BUSCAR:');
    String? nomeCliente = stdin.readLineSync();
    if(nomeCliente is String){
      var cliente = buscarPorNomeCliente(nomeCliente);
      print(cliente!=null? cliente : 'cliente nao encontrado!!!');

      break;
    }
  

  case 3 :

     print('BEM VINDO AO SISTEMA DE BUSCAR CLIENTE!!!');
    print('por favor.digite o nome do cliente que deseja DELETAR:');
    String? nome = stdin.readLineSync();
    if(nome != null){
      deletar(listadeClientes,nome);
      break;
    }
  
 
}

}

 void deletar(List<Map<String, dynamic>> listadeClientes, String nome) {
  listadeClientes.removeWhere((element) => element['nome'] == nome);
}

void sistemadeProdutos(){
   print('BEM VINDO AO SISTEMA DE CADASTRO DE PRODUTOS!!!');
   print('insira a opcao desejada:');
   print('1-inserir');
   print('2-buscar');
   print('3-deletar');
   int? opcao = int.parse(stdin.readLineSync()!);
   
   switch(opcao){
    case 1 :
    
      print('BEM VINDO AO SISTEMA DE INSERIR PRODUTOS!!!');
      Map<String,dynamic>Produtos={};
      print('Digite o nome do produto');
      Produtos ['nome'] = stdin.readLineSync();
      print('Digite o preco do produto');
      Produtos ['preco'] = stdin.readLineSync();
    
      listadeProdutos.add(Produtos);
      break;
  

    case 2 :
   
      print('BEM VINDO AO PROCESSO DE BUSCAR PRODUTO!!!');
      print('Digite o nome do produto que voce deseja buscar:');
      String? nomeProduto = stdin.readLineSync();
      if(nomeProduto is String){
        var Produtos = buscarPorNomeProduto(nomeProduto);
        print(Produtos!=null? Produtos : 'cliente nao encontrado!!!');
      }else{
          print('Produto nao encontrado!!!');
          break;
      }
      
       

     case 3 :
      print('BEM VINDO AO PROCESSO DE DELETAR PRODUTO!!!');
      print('digite o nome do produto a ser deletado:');
      String? nome = stdin.readLineSync();
      if(nome != null){
      deletar(listadeProdutos,nome);
    }else{
      print('produto para ser deletado nao encontrado!!!');
      break;
    }
  
    }

   }

sistemadeEstoque(){
  print('BEM VINDO AO SISTEMA DE ESTOQUE!!!');
  print('Digite o nome do produto que deseja verificar');
  String? produto = stdin.readLineSync();
  var produtoEncontrado = listadeProdutos.firstWhere((item) => item['nome'] == produto);
  if(produtoEncontrado ==produtoEncontrado ){
     print('Estoque do produto $produto: ${produtoEncontrado['quantidade']}');
  }else{
     print('produto nao encotrado!!!');
  }
}
void sistemadeVendas() {
  print('Digite o nome do produto vendido:');
  String? produto = stdin.readLineSync();
  var produtoEncontrado = listadeProdutos.firstWhere((item) => item['nome'] == produto);
  if (produtoEncontrado == produto){
    print('Produto não encontrado.');
    return;
  }

  print('Digite a quantidade vendida:');
  String? quantidadeString = stdin.readLineSync();
  int quantidade = int.tryParse(quantidadeString ?? '') ?? 0;
  if (quantidade <= 0) {
    print('Quantidade inválida.');
    return;
  }

  if (quantidade > produtoEncontrado['quantidade']) {
    print('Quantidade insuficiente em estoque.');
    return;
  }

  double precoUnitario = double.parse(produtoEncontrado['preco'].toString());
  double total = precoUnitario * quantidade;
  print('Total da venda: $total');

  // Atualizar estoque
  produtoEncontrado['quantidade'] -= quantidade;

  print('Venda registrada com sucesso!');
}
void relatoriodeClientesCadastrados() {
  print('*** Relatório de Clientes Cadastrados ***');
  listadeClientes.forEach((cadastro) {
    print('Nome: ${cadastro['nome']}, Idade: ${cadastro['idade']}, CPF: ${cadastro['cpf']}');
  });
}

void relatoriodeVendas() {
  print('*** Relatório de Total de Vendas ***');
  double totalVendas = 0;
  for (var produto in listadeProdutos) {
    double precoUnitario = double.parse(produto['preco'].toString());
    int quantidade = produto['quantidade'];
    totalVendas += precoUnitario * quantidade;
  }
  print('Total de vendas: $totalVendas');
}
buscarPorNomeCliente(String nome) {
  //FIRSTWHERE retorna o primeiro item da lista que satisfaça a condição.
  return listadeClientes.firstWhere((obj) => obj['nome'] == nome);
}
buscarPorNomeProduto(String nome) {
  //FIRSTWHERE retorna o primeiro item da lista que satisfaça a condição.
  return listadeProdutos.firstWhere((obj) => obj['nome'] == nome);
}
