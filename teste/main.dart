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

List<Map<String, dynamic>> listaDePessoas = [];

main(){
sistemadeCadastro(){

}

  print("BEM VINDO AO SISTEMA DE CADASTRO!!!");
  print("*********************************");

  print("Digite a opcao Desejada:|inserir|,|buscar|,|deletar|");
  String? resposta = stdin.readLineSync();

if(resposta=='inserir'){
var cliente=new Map();
print("Digite o seu nome:");
cliente['nome'] = stdin.readLineSync();
print("digite a sua idade:");
cliente['idade'] = stdin.readLineSync();
print("digite o seu cpf:");
cliente['cpf'] = stdin.readLineSync();
print(cliente['cliente']);
}

if(resposta=='deletar'){
    var cliente=new Map();
    cliente['nome'] = stdin.readLineSync();
    cliente['idade'] = stdin.readLineSync();
    cliente['cpf'] = stdin.readLineSync();
    cliente.clear();
    print(cliente['cliente']);
}
if(resposta=='buscar'){
  var cliente = new Map();

}


  
  limparTela() {
  // Limpar terminal.
  print('\x1B[2J\x1b[0;0H');
}
  
     while(resposta=='sair'){
    print("Sistema de cadastro encerrado!!!");
    break;
   
  }

}
