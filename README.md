# Projeto de Persistência de Dados em Flutter

Este projeto tem como objetivo demonstrar como manter e recuperar dados no dispositivo utilizando diferentes soluções de persistência de dados em Flutter.

## Funcionalidades

### Persistência Interna
O projeto oferece métodos para:
- **Salvar informações** no dispositivo
- **Recuperar informações** armazenadas

## Soluções de Persistência

- **SQFLite**  
  - Ideal para criar bancos de dados extensos com grande quantidade de dados.
  - **Limitação**: Não oferece suporte para aplicações web.

- **Shared Preferences**  
  - Solução simples para armazenar informações leves.
  - Fácil de implementar.

- **Path Provider**  
  - Acessa o diretório de dados do dispositivo para criar e ler arquivos.
  
## Pacotes Utilizados
As bibliotecas usadas neste projeto são pacotes da comunidade disponíveis no [pub.dev](https://pub.dev).

### Dependências Externas

Listadas no arquivo `pubspec.yaml`, as dependências externas fornecem as ferramentas necessárias para a implementação das soluções de persistência.

## DAO (Data Access Object)

O DAO é um padrão que abstrai o acesso a dados no banco. Ele permite a interação com o banco de dados por meio de métodos como:

- **save**: Salvar dados no banco de dados
- **findAll**: Buscar todas as tarefas
- **find**: Buscar uma tarefa específica
- **delete**: Remover uma tarefa do banco de dados

### Valor `static`

Utilizado para manter o mesmo valor entre todas as instâncias de uma classe. Garantindo que a informação permaneça única e compartilhada.

## Estrutura CRUD

O projeto segue a estrutura básica de um banco de dados:

- **Create**: Criar novos dados
- **Read**: Ler dados armazenados
- **Update**: Atualizar dados existentes
- **Delete**: Excluir dados do banco

## Funções do Banco de Dados

O banco de dados retorna um objeto do tipo `Map`, onde as informações são armazenadas em pares de **chave**-**valor**.

Para mais detalhes sobre a implementação SQL no SQFlite, acesse a [documentação oficial](https://github.com/tekartik/sqflite/blob/master/sqflite/doc/sql.md).

## Ferramentas Utilizadas

- **Shift + F6**: Para renomear variáveis e funções facilmente no projeto.
- **FutureBuilder**: Para construir componentes de interface a partir de dados assíncronos.
- **ListView.builder**: Para construir listas dinâmicas, renderizando apenas os itens visíveis.

## Estado de Conexão

Utilizamos o `snapshot.connectionState` para tratar o estado dos dados recebidos:

- **ConnectionState.none**: Não há conexão
- **ConnectionState.waiting**: Aguardando conexão
- **ConnectionState.active**: Dados estão sendo processados
- **ConnectionState.done**: Todos os dados foram recebidos

## Promises com `then`

O método `then` é utilizado para encadear ações a serem realizadas após a conclusão de uma operação assíncrona.

---

Este projeto demonstra as diferentes abordagens de persistência de dados, focando na escolha da solução mais adequada conforme o cenário e a quantidade de dados a serem manipulados.
