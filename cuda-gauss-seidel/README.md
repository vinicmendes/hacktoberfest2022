# cuda-gauss-seidel

Este pequeno projeto contém a implementação do método de Gauss Seidel para equações lineares, usando NVIDIA CUDA para paralelizar cálculos usando uma GPU. O método de Gauss Seidel para resolver equações lineares é um método iterativo, no qual os valores para as variáveis dadas, que continuam mudando até que um certo limite de variância seja alcançado.

O objetivo deste projeto foi fornecer um tempo de resolução mais rápido do que a versão sequencial do código, que também é fornecida no repositório.

## Etapas de Paralelização

### Decomposição:
Como a arquitetura CUDA favorece a paralelização de grão fino, a unidade computacional é definida como todas as iterações que uma thread CUDA precisa realizar para atingir um valor delta menor que o limite.

### Atribuição:
A atribuição é bem clara: cada célula da matriz será emparelhada com um thread CUDA. No entanto, dado que as threads CUDA são agrupadas em pedaços de tamanho variável: quantas threads por bloco devemos definir? (isso determinará o número necessário de blocos para um determinado tamanho de matriz).

```c
int blocks_num = ceil((n-2) * (n-2) / threads_per_block)
```

### Orquestração: 
Em primeiro lugar, a matriz inicial precisa ser copiada do host (CPU para o dispositivo 8GPU) permitindo que os cálculos sejam iniciados.

A orquestração entre os diferentes threads CUDA é literalmente zero: cada thread recebe uma célula para transformar e nenhuma iteração é feita entre os threads. No entanto, há um caso especial a ser considerado: como grupos inteiros de threads são gerados, pode haver o caso de alguns threads do último grupo ficarem sem célula para computar.

Finalmente, os resultados calculados são copiados da memória do dispositivo (GPU) para a memória do host (CPU).

### Mapeamento: 
Todas as threads CUDA são executadas no mesmo dispositivo (GPU). Nenhum suporte multi-GPU é fornecido.

## Instalações

    $ sudo apt install nvidia-cuda-toolkit

## Shell

    $ chmod +x exec.sh
    $ ./exec