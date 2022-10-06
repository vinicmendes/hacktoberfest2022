# serveless-architecture

## O que é Serverless

- Arquitetura orientada a eventos
- Desenvolvimento de aplicação sem o gerenciamento de servidor
- Embora o nome seja *Serverless* existe sim um servidor por trás, porém não precisamos nos preocupar sim o provedor

## Vantagens

- Sem se preocupar com infraestrutura
- Auto Scaling => sem preocupação com escalonamento
- Redução de custos
- Paga somente pelo que usa
- Pouca configuração para produção

## Modelos

- BaaS -> backend as a service 
    - Firebase
- FaaS -> function as a service
    - AWS Lambda, Azure function, GCF

## Quando usar ?

Geralmente a arquitetura serverless é utilizada para processar códigos assíncronos que não tem necessidade de execução imediata e que podem causar um processamento desnecessário na aplicação principal hospedada em servidores comuns.

Importante frisar que toda função que utiliza esse modelo possui um limite de tempo de execução e é extremamente difícil de debugar ou testar, por isso, é importante que o serviço seja extremamente simples e tenha um objetivo bem definido com poucos efeitos colaterais.

Além disso, esses serviços são stateless e, por isso, não devem guardar nenhum estado entre cada execução pois cada nova execução pode reconstruir o servidor do total zero sem resquícios de uma execução anterior