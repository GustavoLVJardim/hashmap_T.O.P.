# Ruby HashMap Implementation

Este projeto implementa um HashMap em Ruby utilizando arrays e listas encadeadas (Linked Lists) para resolver colisões por encadeamento separado.

## Funcionalidades

- Adicionar (`set`) chave-valor
- Buscar valor pela chave (`get`)
- Remover entrada pela chave (`remove`)
- Verificar existência de chave (`has?`)
- Retornar todas as chaves (`keys`)
- Retornar todos os valores (`values`)
- Retornar todas as entradas (pares chave-valor) (`entries`)
- Limpar todas as entradas (`clear`)

## Estrutura

- `@buckets`: array que armazena as listas encadeadas para cada índice gerado pelo hash
- Cada bucket é uma Linked List onde armazenamos arrays com `[chave, valor]`

## Como usar

1. Inicialize a estrutura HashMap
2. Use os métodos para manipular os dados: `set`, `get`, `remove`, etc.

## Testes

Foram realizados testes para verificar o correto funcionamento dos métodos, garantindo que colisões são tratadas corretamente e que os dados são armazenados e recuperados conforme esperado.

---

## Como contribuir

Contribuições são bem-vindas! Abra uma issue para discutir melhorias ou bugs.

---

## Autor

Seu Nome

---

## Licença

Este projeto está sob a licença MIT.

