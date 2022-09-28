use oficina;

show tables;
desc veiculo;

INSERT INTO cliente (
	idcliente,
    nome_completo,
    cpf,
    telefone,
    endereco,
    email
) VALUES (1, 'Raphael Pereira', '12345678901', '88988998899', 'Rua 1, Cidade 1, Estado 1', 'cliente1@clientes.com.br'),
		 (2, 'Joana Alves', '23456789012', '990011331122', 'Rua 2, Cidade 2, Estado 3', 'cliente2@clientes.com.br'),
         (3, 'Luan Gonçalves', '34567890123', '113322456678', 'Rua 3, Cidade 3, Estado 3', 'cliente3@clientes.com.br'),
         (4, 'Carina Andrade', '45678901234', '232123334567', 'Rua 4, Cidade 4, Estado 4', 'cliente4@clientes.com.br');
         
INSERT INTO veiculo (
	idveiculo,
    placa,
    modelo,
    cor,
    veiculoid_cliente
) VALUES (1 , 'qsk1122', 'fiesta', 'preto',3),
		 (2 , 'abc3344', 'corsa', 'branco', 4),
         (3 , 'def5566', 'sandero', 'vermelho', 4),
         (4 , 'ghi7788', 'sandero', 'amarelo', 2),
         (5 , 'jkl9900', 'fiesta', 'vermelho', 1),
         (6 , 'mno1010', 'corsa', 'vermelho', 3),
         (7 , 'pqr2121', 'civic', 'preto', 4);

desc mecanico;

INSERT INTO mecanico (
	idmecanico,
    mec_nome_completo,
    especialidade
) VALUES (1, 'Joao Paulo', 'Elétrica Automotiva'),
		 (2, 'Antonio Carlos', 'Injeção Eletrônica'),
         (3, 'Carlos Marion', 'Suspensão'),
         (4, 'Mario Cortez', 'Mecânico Geral'),
         (5, 'Juan Farias', 'Gerente Mecânico');
         
DESC pecas;

INSERT INTO pecas (
	idpecas,
    peca_nome,
    peca_valor
) VALUES (1, 'Vela de ignição', 19.90),
		 (2, 'Módulo de Injeção Eletrônica', 1590.90),
         (3, 'Parabrisa', 3000),
         (4, 'Central Multimídia', 4500),
         (5, 'Óleo Sintético RLub 50/50 1L', 45.90),
         (6, 'Pneu Aro 13', 359.90),
         (7, 'Lampada Halogênea h1', 14.90),
         (8, 'Kit Lampadas de Xenônio h4/2', 259.90),
         (9, 'Kit Alto Falantes 2 Portas', 129.90),
         (10, 'Kit Amortecedor 2w4', 890.90),
         (11, 'Kit Motor novo', 10990.90);

DESC fornecedor;

INSERT INTO fornecedor (
	idfornecedor,
    fornecedor_nome,
    fornecedor_cnpj,
    fornecedor_endereco
    ) VALUES (1, 'Major AutoPeças', '32142321000121', 'Rua do fornecedor 1, cidade do fornecedor 1, estado do fornecedor 1'),
			 (2, 'SoAuto Peças', '12345212000198', 'Rua do fornecedor 2, cidade do fornecedor 2, estado do fornecedor 2'),
             (3, 'Baratao AutoPeças', '45674321000121', 'Rua do fornecedor 3, cidade do fornecedor 3, estado do fornecedor 3'),
             (4, 'Melhor Preço AutoPeças', '54665234000121', 'Rua do fornecedor 4, cidade do fornecedor 4, estado do fornecedor 4'),
             (5, 'Top AutoPeças', '89007234000133', 'Rua do fornecedor 5, cidade do fornecedor 5, estado do fornecedor 5');
         
DESC estoque;

INSERT INTO estoque (
	idestoque,
    estoque_nome,
    estoque_cidade,
    estoque_estado
) VALUES (1, 'Estoque Principal', 'João Pessoa', 'PB'),
		 (2, 'Estoque Sertao', 'Patos', 'PB'),
         (3, 'Estoque Porto', 'Cabedelo', 'PB');
         
DESC servico;

INSERT INTO servico (
	idservico,
    servico_nome,
    servico_descricao
) VALUES (1, 'Elétrica', 'Conserto da parte elérica'),
		 (2, 'Motor', 'Conserto relativo ao motor'),
         (3, 'Injeção Eletrônica', 'Consertos na Injeção Eletrônica'),
         (4, 'Prevenção', 'Manutenção preventiva do veiculo'),
         (5, 'Vistoria', 'Vistoria da condição veicular'),
         (6, 'Manutenção', 'Troca de componentes'),
         (7, 'Limpeza', 'Limpeza de componentes');
         
DESC ordem_de_servico;

INSERT INTO ordem_de_servico (
	idordem_de_servico,
    os_num,
    os_status,
    os_descricao,
    os_data_conclusao,
    os_valor_total,
    os_idmecanico,
    os_idcliente,
    os_idveiculo,
    os_idpeca,
    os_idservico
) VALUES (1, 154, 'Aberta', 'Troca de componentes eletrônicos', '2022-09-30', 4759.90, 1, 2, 4, 9, 1),
		 (2, 278, 'Em espera', 'Troca de amortecedores', '2022-10-31', 890.90, 3, 1, 5, 10, 6),
         (3, 392, 'Finalizada', 'Refazer o motor', '2021-03-15', 10890.90, 4, 3, 1, 11, 2),
         (4, 399, 'Aberta', 'Trocar as velas de ignição', '2022-10-04', 19.90, 4, 3, 6, 1, 2),
         (5, 403, 'Em espera', 'Troca de Parabrisas e ECU', '2022-11-10', 4590.90, 2, 4, 7, 2, 3);
         
DESC mecanico_servico;

INSERT INTO mecanico_servico (
	idMS_mecanico,
    idMS_servico
) VALUES (1, 1),
		 (2, 3),
         (3, 6),
         (4, 2),
         (5, 5);
         
DESC estoque_pecas;

INSERT INTO estoque_pecas(
	idEP_estoque,
    idEP_pecas,
    quantidade
) VALUES (1, 1, 200), (1, 2, 50), (1, 3, 7), (1, 4, 15), (1, 5, 300),
		 (2, 1, 654), (2, 3, 4), (2, 6, 94), (2, 7, 27), (2, 8, 197),
         (3, 9, 178), (3, 10, 32), (3, 11, 65), (3, 4, 33), (3, 2, 41);
         
DESC pecas_fornecedor;

INSERT INTO pecas_fornecedor (
	idPF_peca,
    idPF_fornecedor,
    quantidade
) VALUES (1, 1, 200), (2, 1, 20), (3, 1, 11), (4, 1, 15),
		 (1, 2, 654), (2, 2, 33), (3, 2, 1), (4, 2, 8), (5, 2, 91),
		 (6, 3, 90), (7, 3, 27), (8, 3, 98), (9, 3, 77), (10, 3, 32),
		 (2, 4, 31), (5, 4, 159), (8, 4, 99), (4, 4, 22), (11, 4, 20),
		 (3, 5, 291), (7, 5, 21), (9, 5, 3), (2, 5, 17), (6, 5, 5);


         
		 
         