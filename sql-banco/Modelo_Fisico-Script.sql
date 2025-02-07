CREATE database	pridehub_banco;
use pridehub_banco;

CREATE TABLE eventos (
data DATETIME,
local VARCHAR(50),
categoria VARCHAR(20),
descricao VARCHAR(500),
titulo VARCHAR(50),
id_evento VARCHAR(10) PRIMARY KEY,
id_ong VARCHAR(10)
);

CREATE TABLE pride_hub (
nome VARCHAR(50),
site VARCHAR(100),
email VARCHAR(100),
descricao VARCHAR(50),
telefone VARCHAR(100),
id_ong VARCHAR(10) PRIMARY KEY
);

CREATE TABLE funcionarios (
nome VARCHAR(10),
funcao VARCHAR(10),
telefone VARCHAR(10),
especialidade VARCHAR(10),
id_func VARCHAR(10) PRIMARY KEY,
id_ong VARCHAR(10),
FOREIGN KEY(id_ong) REFERENCES pride_hub (id_ong)
);

CREATE TABLE oferece (
id_func VARCHAR(10),
id_atend VARCHAR(10),
FOREIGN KEY(id_func) REFERENCES funcionarios (id_func)
);

CREATE TABLE atendimento (
id_func VARCHAR(20),
id_cpf_cnpj VARCHAR(10),
data_aten DATETIME,
decricao VARCHAR(500),
id_atend VARCHAR(10) PRIMARY KEY
);

CREATE TABLE Conteudo (
Id_Conteudo VARCHAR(10) PRIMARY KEY,
Titulo VARCHAR(25),
autor VARCHAR(50),
tipo VARCHAR(10),
descricao VARCHAR(200)
);

CREATE TABLE acessa (
Id_Conteudo VARCHAR(10),
id_cpf_cnpj VARCHAR(20),
FOREIGN KEY(Id_Conteudo) REFERENCES Conteudo (Id_Conteudo)
);

CREATE TABLE publico_alvo (
id_publico VARCHAR(10) PRIMARY KEY,
descricao VARCHAR(200),
faixa_etaria VARCHAR(10),
tipo VARCHAR(10)
);

CREATE TABLE Usuario (
telefone NUMERIC(11),
email VARCHAR(30),
senha VARCHAR(10),
nome_razaoSocial VARCHAR(30),
id_cpf_cnpj VARCHAR(20) PRIMARY KEY,
id_ong VARCHAR(10),
FOREIGN KEY(id_ong) REFERENCES pride_hub (id_ong)
);

CREATE TABLE buscar (
id_atend VARCHAR(10),
id_cpf_cnpj VARCHAR(20),
FOREIGN KEY(id_atend) REFERENCES atendimento (id_atend),
FOREIGN KEY(id_cpf_cnpj) REFERENCES Usuario (id_cpf_cnpj)
);

CREATE TABLE relaciona (
id_cpf_cnpj VARCHAR(20),
id_publico VARCHAR(10),
FOREIGN KEY(id_cpf_cnpj) REFERENCES Usuario (id_cpf_cnpj),
FOREIGN KEY(id_publico) REFERENCES publico_alvo (id_publico)
);

CREATE TABLE avaliacao (
id_ava VARCHAR(10) PRIMARY KEY,
nota INTEGER,
comentario VARCHAR(500),
data_ava DATETIME,
id_cpf_cnpj VARCHAR(20),
Id_Conteudo VARCHAR(10),
FOREIGN KEY(id_cpf_cnpj) REFERENCES Usuario (id_cpf_cnpj),
FOREIGN KEY(Id_Conteudo) REFERENCES Conteudo (Id_Conteudo)
);

ALTER TABLE eventos ADD FOREIGN KEY(id_ong) REFERENCES pride_hub (id_ong);
ALTER TABLE oferece ADD FOREIGN KEY(id_atend) REFERENCES atendimento (id_atend);
ALTER TABLE atendimento ADD FOREIGN KEY(id_cpf_cnpj) REFERENCES Usuario (id_cpf_cnpj);
ALTER TABLE acessa ADD FOREIGN KEY(id_cpf_cnpj) REFERENCES Usuario (id_cpf_cnpj);
