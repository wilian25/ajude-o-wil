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

List<Map<String, dynamic>> listaDeClientes = [{'nome': 'Ana','idade':'20',"cpf":'4235142314'},{'nome': 'wilian','idade':'18','cpf':'3423533232'}];
List<Map<String, dynamic>> listaDeProdutos = [{'nome':'fogao','preco':'1200.00'},{'nome':'geladeira','preco':'2500.00'}];

void main(List<String> args) {
  MenuPricipal();
  
  }
  
    MenuPricipal(){
      while(true){
    print("Digite o numero fornecido para a opcao desejada:");
    print('1.Clientes');
    print('2.Produtos');
    print('3.Estoque');
    print('4.Venda');
    print('5.Controle de clientes');
    print('6.controle de Vendas');
    print('7.sair');
    
    int? resposta = int.parse(stdin.readLineSync()!);

switch(resposta){
     case 1:
        sistemadeClientes();
        break;
      case 2:
        sistemadeProdutos();
        break;
      case 3:
        controleDeEstoque();
        break;
      case 4:
        registrarVenda();
        break;
      case 5:
        relatorioClientesCadastrados();
        break;
      case 6:
        relatorioTotalVendas();
        break;
      case 7:
      print("Sistema de cadastros cancelado!!!");
      break;
      default:
      print('opcao invalida!.tente novamente!');
      return MenuPricipal();
}

      }
    }
    
      void sistemadeClientes(){
      print('BEM VINDO AO SISTEMA DE CADASTRO DE CLIENTES!!!');
      while(true){
      print('O que você deseja fazer na lista de cliente: "inserir", "buscar", "deletar","sair"');
      String? resposta = stdin.readLineSync();

      if (resposta == 'inserir') {
        inserirCliente();
      }
      else if (resposta == 'buscar'){
        print('Digite o nome do cliente:');

        String? nomeCliente = stdin.readLineSync();
        
        buscarCliente(nomeCliente);
          
        
      }
        else if(resposta=='deletar'){
          print('Digite o nome do cliente que vc deseja deletar:');
          String? nome = stdin.readLineSync();
          if(nome!=null){
          deletar(listaDeClientes,nome);
          }
        print(listaDeClientes);
        }
        else if(resposta=='sair'){
          print("Sitema de cadastro cancelado");
          break;

        }
           
      }
      
      }
   void inserirCliente() {
  Map<String, dynamic> cadastro = {};
  print('--------------------------');
  print('Digite o seu nome: ');
  cadastro['nome'] = stdin.readLineSync();

  print('Digite a sua idade: ');
  cadastro['idade'] = stdin.readLineSync();

  print('Digite a sua cidade: ');
  cadastro['cidade'] = stdin.readLineSync();

  print('Digite o seu estado: ');
  cadastro['estado'] = stdin.readLineSync();

  listaDeClientes.add(cadastro);
  relatorioClientesCadastrados();
}

     sistemadeProdutos(){
        print('BEM VINDO AO SISTEMA DE CADASTRO DE PRODUTOS!!!');
        print('O que vc deseja fazer na lista de Produtos: "inserir", "buscar", "deletar"');
         String? resposta = stdin.readLineSync();
         if (resposta == 'inserir') {
        inserirProdutos();
      }
        else if (resposta == 'buscar') {
        print('Digite o nome do produto que vc deseja buscar:');
        String? nomeproduto = stdin.readLineSync();
        
          buscarProduto(nomeproduto);
          //print(produto != null ? produto : 'Produto não encontrado.');
          
        
      } else if (resposta == 'deletar') {
          print('Digite o nome do Produto que vc deseja deletar:');
          String? nome = stdin.readLineSync();
          if(nome!=null){
          deletar(listaDeProdutos,nome);
          }
          print(listaDeProdutos);
        }
       
}   
  

  void deletar(List<Map<String, dynamic>> lista, String nome) {
  lista.removeWhere((element) => element['nome'] == nome);
}
    void inserirProdutos() {
    Map<String,dynamic>Produtos={};
    print('***********PRODUTOS*************');
    print('digite o nome do produto:');
    Produtos['nome do produto'] = stdin.readLineSync();

     print('digite o preco do produto:');
    Produtos['preco'] = stdin.readLineSync();
    print(listaDeProdutos);
    
    listaDeProdutos.add(Produtos);

    
  }
  void controleDeEstoque() {
  print('*** Controle de Estoque ***');
  print('Qual produto você deseja verificar o estoque?');
  String? produto = stdin.readLineSync();
  try{
    
    print(listaDeProdutos.firstWhere((item) => item['nome'] == produto));

  }catch(e) {
      print('Produto não encontrado');
      
  }

  
  }

  //if (produtoEncontrado == produto) {
  //  print('Estoque do produto $produto: ${produtoEncontrado['quantidade']}');
  //} else{
  //  print('Produto não encontrado.');
  //}


void registrarVenda() {
  print('Digite o nome do produto vendido:');
  String? produto = stdin.readLineSync();
  var produtoEncontrado = listaDeProdutos.firstWhere((item) => item['nome'] == produto);
  if (produtoEncontrado != null){
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

void relatorioClientesCadastrados() {
  print('*** Relatório de Clientes Cadastrados ***');
  listaDeClientes.forEach((cliente) {
    print('Nome: ${cliente['nome']}, Idade: ${cliente['idade']}, CPF: ${cliente['cpf']}');
  });
}

void relatorioTotalVendas() {
  print('*** Relatório de Total de Vendas ***');
  double totalVendas = 0;
  for (var produto in listaDeProdutos) {
    double precoUnitario = double.parse(produto['preco'].toString());
    int quantidade = produto['quantidade'];
    totalVendas += precoUnitario * quantidade;
  }
  print('Total de vendas: $totalVendas');
}


 
buscarCliente(String? nomeProcurado) {
  try{
    
    print(listaDeClientes.firstWhere((obj) => obj['nome'] == nomeProcurado));

  }catch(e) {

      print('Cliente não encontrado');
      
  }
}
buscarProduto(String? nomep){
  try{
    
    print(listaDeProdutos.firstWhere((item) => item['nome'] == nomep));

  }catch(e) {
      print('Produto não encontrado');
      
  }

}



