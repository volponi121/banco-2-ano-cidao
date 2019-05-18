create table temp
	codigo_empresa integer,
	nome_empresa varchar2(40),
	total_carros number(2),
	descricao varchar2(50);
---------------------------------------------------
create table Empresa
	emp_codigo integer,
	nome_empresa varchar2(40);
---------------------------------------------------
create table Carro

DECLARE
	vCodigo_empresa Empresa.emp_codigo%type := &codigo;
	vNome_emp Empresa.nome_empresa%type;
	vQtdeCar number(4);
	vDescricao empresa.descricao%type;
BEGIN
select e.nome_empresa Nome_Empresa, count(ce.placa) Qtde
	into vNome_emp,vQtdeCar
	from empresa e
	left outer join carros_empresa ce on ce.cecodigo = e.emp_codigo
	where e.emp_codigo = vCodigo_empresa
	group by e.nome_empresa;

	IF
		vQtdeCar BETWEEN 1 AND 5 then	
			vDescricao := 'Tem até 5 carros associados';
		ELSIF vQtdeCar BETWEEN 6 AND 11 then
			vDescricao := 'Tem entre 6 e 11 carros associados'
		ELSIF
			vQtdeCar >= 12 then
			vDescricao := 'Tem 12 ou mais carros'
	else
		vDescricao := 'Não tem nenhum carro associado'
	END IF;

insert into temp (codigo_empresa,nome_empresa,total_carros,descricao) values (vCodigo_empresa,vNome_emp,vQtdeCar,vDescricao)

	EXCEPTION 
		WHEN NO_DATA_FOUND then
			raise_application_error(-20001,"No Data Found!");
		WHEN OTHERS then
			raise_application_error(-20002,SQLERRM(SQLCODE));

END;