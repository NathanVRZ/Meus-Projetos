use wellbalas;

create table produtos(idProduto int primary key auto_increment,
	nome varchar(45),
    quantidade varchar(65)
);

create table lojas(idLojas int primary key auto_increment,
	Loja varchar(45),
    endereço varchar(80),
	CNPJ float(12)
 );
 
 select * from produtos;
 
 ALTER TABLE produtos DROP COLUMN Tipo;
