create database arfasMonitoriaDB;
use arfasMonitoriaDB;

create table departamento(
        idDepartamento int primary key auto_increment,
        nomeDepartamento varchar(45) unique not null
);

create table funcionario(
        idFuncionario int primary key auto_increment,
        fkDepartamento int not null,
        nomeFuncionario varchar(45) not null,
        usuario varchar(45) unique not null,
        email varchar(100) unique not null,
        senha varchar(45) not null,
        telefone char(11) unique not null,
        funcao varchar(45) not null,
        statusFuncionario varchar(7) default 'ativo',
        check(
                statusFuncionario = 'ativo'
                or statusFuncionario = 'inativo'
        ),
        profileImgPath varchar(100),
        acessoDashboard char(3) default 'nao',
        check(
                acessoDashboard = 'sim'
                or acessoDashboard = 'nao'
        ),
        foreign key (fkDepartamento) references departamento (idDepartamento)
);

create table computador(
        idComputador int primary key auto_increment,
        fkFuncionario int,
        marca varchar(45) not null,
        modelo varchar(45) not null,
        idProduto varchar(100) unique not null,
        idDispositivo varchar(100) unique not null,
        hostname varchar(100) not null,
        dtEntrega date default (now()),
dtDevolucao date,
        statusComputador varchar(45) default 'ativo',
        check(
                statusComputador = 'ativo'
                or statusComputador = 'inativo'
        ),
        FOREIGN KEY (fkFuncionario) REFERENCES funcionario (idFuncionario)
);

create table componente(
        idComponente int primary key auto_increment,
        fkComputador int not null,
        nomeComponente char(3) not null,
        capacidade varchar(45),
        check(
                nomeComponente = 'CPU'
                or nomeComponente = 'HDD'
                or nomeComponente = 'RAM'
        ),
        foreign key (fkComputador) references computador(idComputador)
);

create table configuracao(
        idConfiguracao int primary key auto_increment,
        fkComputador int not null,
        fkComponente int unique not null,
        alertaCriticoUso int,
        alertaCriticoTemperatura int,
        foreign key (fkComputador) references computador(idComputador),
        foreign key (fkComponente) references componente(idComponente)
);

create table leitura(
        idLeitura int primary key auto_increment,
        fkConfiguracao_Computador int not null,
        fkConfiguracao_Componente int not null,
        dataLeitura date default (now()),
        horaLeitura DATETIME default (now()),
        uso decimal(10, 6) not null,
        temperatura decimal(10, 6),
	foreign key (fkConfiguracao_Computador) references computador(idComputador),
        foreign key (fkConfiguracao_Componente) references componente(idComponente)
);

insert into
        departamento (nomeDepartamento)
values
        ('TI Suporte'),
        ('TI Infraestrutura'),
        ('TI PJ'),
        ('TI PF'),
        ('TI Financeira'),
        ('TI Telemarkenting');


