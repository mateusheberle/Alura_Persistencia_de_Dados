manter os dados

persistência interna
    salvar informações no dispositivo
    recuperar informações

soluções:
    SQFLite
        criar banco de dados extensos
        muitos dados
        não suporta web
    Shared_Preferences
        fácil de aplicar
        infomações leves
    Path_provider
        acessar local de dados
        criar dado
        ler dado

pacotes: 
    bibliotecas da comunidade
    pub.dev
    
pubspec.yaml: 
    dependências vinda de fora

DAO
    data access object
    objeto de acesso a dados


static: 
    - mesmo valor para qualquer instancia criada com ela, independente do objeto
    - manter a informação única


funções do banco:
    - save: salvar dentro do banco
    - findAll: procurar todas as tarefas
    - find: buscar apenas uma tarefa específica
    - delete: deltar uma tarefa

base dos bancos de dados
    CRUD
        Create, Read, Update e Delete

[Documentação SQFlite - SQL](https://github.com/tekartik/sqflite/blob/master/sqflite/doc/sql.md)

banco de dados retorna objeto do tipo Map
keys - values

Shift + F6: renomear tudo

FutureBuilder: pegar informações que demorar e construir na tela

snapshot: responsável pelos dados que vem

ListView.builder: só constroe o que aparece na tela

switch (snapshot.connectionState):
    case ConnectionState.none: não ter nada
    case ConnectionState.waiting: esperando conexao
    case ConnectionState.active: estar produzindo
    case ConnectionState.done: já ter tudo que precisamos

then: depois disso