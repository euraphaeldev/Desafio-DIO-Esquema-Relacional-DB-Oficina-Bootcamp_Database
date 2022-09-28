-- Implantando o Esquema Relacional DB Oficina DIO Desafio de Projeto

CREATE DATABASE oficina;
USE oficina;

CREATE TABLE cliente (
	idcliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nome_completo VARCHAR(60) NOT NULL,
    cpf CHAR(11) NOT NULL,
    telefone VARCHAR(45) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    email VARCHAR(60)
);

ALTER TABLE cliente AUTO_INCREMENT = 1;

CREATE TABLE veiculo (
	idveiculo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    placa VARCHAR(45) UNIQUE NOT NULL,
    modelo VARCHAR(45) NOT NULL,
    cor VARCHAR(45) NOT NULL,
    veiculoid_cliente INT,
    CONSTRAINT fk_veiculoid_cliente FOREIGN KEY (veiculoid_cliente) REFERENCES cliente(idcliente)
);



CREATE TABLE mecanico (
	idmecanico INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    mec_nome_completo VARCHAR(60) NOT NULL,
    especialidade VARCHAR(45) NOT NULL
);

CREATE TABLE pecas (
	idpecas INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    peca_nome VARCHAR(45) NOT NULL,
    peca_valor FLOAT DEFAULT 0.0
);

CREATE TABLE fornecedor (
	idfornecedor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    fornecedor_nome VARCHAR(60) NOT NULL,
    fornecedor_cnpj VARCHAR(14) NOT NULL,
    fornecedor_endereco VARCHAR(120) NOT NULL
);

CREATE TABLE estoque (
	idestoque INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    estoque_nome VARCHAR(70) NOT NULL,
    estoque_cidade VARCHAR(70) NOT NULL,
    estoque_estado CHAR(2) NOT NULL
);

CREATE TABLE servico (
	idservico INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    servico_nome VARCHAR(45) NOT NULL,
    servico_descricao VARCHAR(250) NOT NULL
);

CREATE TABLE ordem_de_servico (
	idordem_de_servico INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    os_num INT NOT NULL,
    os_status ENUM('Aberta', 'Finalizada', 'Em espera') NOT NULL,
    os_descricao VARCHAR(250) NOT NULL,
    os_data_conclusao DATE NOT NULL,
    os_valor_total FLOAT NOT NULL DEFAULT 0,
    
    os_idmecanico INT,
    os_idcliente INT,
    os_idveiculo INT,
    os_idpeca INT,
    os_idservico INT,
    
    CONSTRAINT fk_os_idmecanico FOREIGN KEY (os_idmecanico) REFERENCES mecanico(idmecanico),
    CONSTRAINT fk_os_idcliente FOREIGN KEY (os_idcliente) REFERENCES cliente(idcliente),
    CONSTRAINT fk_os_idveiculo FOREIGN KEY (os_idveiculo) REFERENCES veiculo(idveiculo),
    CONSTRAINT fk_os_idpeca FOREIGN KEY (os_idpeca) REFERENCES pecas(idpecas),
    CONSTRAINT fk_os_idservico FOREIGN KEY (os_idservico) REFERENCES servico(idservico)
);

CREATE TABLE mecanico_servico (
	idMS_mecanico INT,
    idMS_servico INT,
    PRIMARY KEY (idMS_mecanico, idMS_servico),
    CONSTRAINT fk_idMS_mecanico FOREIGN KEY (idMS_mecanico) REFERENCES mecanico(idmecanico),
    CONSTRAINT fk_idMS_servico FOREIGN KEY (idMS_servico) REFERENCES servico(idservico)
);

CREATE TABLE estoque_pecas (
	idEP_estoque INT,
    idEP_pecas INT,
    quantidade INT,
    PRIMARY KEY (idEP_estoque, idEP_pecas),
    CONSTRAINT fk_idEP_estoque FOREIGN KEY (idEP_estoque) REFERENCES estoque(idestoque),
    CONSTRAINT fk_idEP_pecas FOREIGN KEY (idEP_pecas) REFERENCES pecas(idpecas)
);

CREATE TABLE pecas_fornecedor (
	idPF_peca INT,
    idPF_fornecedor INT,
    quantidade INT,
    PRIMARY KEY (idPF_peca, idPF_fornecedor),
    CONSTRAINT fk_idPF_peca FOREIGN KEY (idPF_peca) REFERENCES pecas(idpecas),
    CONSTRAINT fk_idPF_fornecedor FOREIGN KEY (idPF_fornecedor) REFERENCES fornecedor(idfornecedor)
);