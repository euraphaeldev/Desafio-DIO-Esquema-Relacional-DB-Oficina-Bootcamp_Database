use oficina;

-- recuperando os dados dos clientes
select * from cliente;

-- recuperando dados das ordens de servico
select * from ordem_de_servico;

-- recuperando os dados sobre cadastros de veiculos por clientes
select idcliente, nome_completo, modelo, placa, cor from veiculo, cliente
where veiculoid_cliente=idcliente;

-- recuperando dados de em quais OS os mecanicos estão trabalhando e seus respectivos status
select mec_nome_completo as Mecanico, 
especialidade, 
os_descricao,
os_num, 
os_status, 
os_data_conclusao from mecanico, ordem_de_servico 
	where idmecanico = os_idmecanico;

