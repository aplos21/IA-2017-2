# [Estados Cidades IBGE](https://github.com/chandez/Estados-Cidades-IBGE)
> Atualizado em 13/04/2017

Os dados se encontram com o código oficial do IBGE.
- `27` Estados
- `5.570` Municípios
- `5` Regiões (Norte, Nordeste, Sudeste, Sul, Centro-Oeste)


## Regiao

| id * | nome |
|:--:|:--------:|
| INT | VARCHAR(50) |

```sql
CREATE TABLE Regiao (
  Id    INT         NOT NULL AUTO_INCREMENT,
  Nome  VARCHAR(50) NOT NULL,
  PRIMARY KEY (Id)
);
```

## Estado

| id * | codigouf | nome | uf | regiao |
|:--:|:--------:|:----:|:--:|:-------:
| INT | INT | VARCHAR(50) | char(2) | INT |

```sql
CREATE TABLE Estado (
    Id       INT          NOT NULL AUTO_INCREMENT,
    CodigoUf INT          NOT NULL,
    Nome     VARCHAR (50) NOT NULL,
    Uf       CHAR(2)      NOT NULL,
    Regiao   INT          NOT NULL,
    PRIMARY KEY (Id)
);
```


## Municipio

| id * | codigo | nome | uf |
|:--:|:--------:|:----:|:--:|
| INT | INT | VARCHAR(50) | char(2)

```sql
CREATE TABLE Municipio (
  Id      INT           NOT NULL AUTO_INCREMENT,
  Codigo  INT           NOT NULL,
  Nome    VARCHAR(255)  NOT NULL,
  Uf      CHAR(2)       NOT NULL,
  PRIMARY KEY (Id)
);
```
