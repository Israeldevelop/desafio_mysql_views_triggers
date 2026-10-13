use azure_company;

-- VIEW 1: Empregados por departamento e localidade

create or replace view vw_empregados_departamento_local as 
select 
	d.Dname as departamento,
    dl.Dlocation as localidade,
    count(distinct e.Ssn) as total_empregados
from departament d
join dept_locations dl
	on dl.Dnumber = d.Dnumber
left join employee e 
	on e.Dno = d.Dnumber
group by d.Dnumber, d.Dname, dl.Dlocation;


create or replace view vw_departamentos_gerentes as 
select
	d.Dnumber as id_departamento,
    d.Dname as departamento,
    e.Ssn as ssn_gerente,
    concat(e.Fname, ' ', e.Lname) as gerente
from departament d
join employee e
	on e.Ssn = d.Mgr_ssn;

create or replace view vw_projetos_total_empregados as 
select
	p.Pnumber as id_projeto,
    p.Pname as projeto,
    count(distinct w.Essn) as total_empregados
from project p
left join works_on w
	on w.Pno = p.Pnumber
group by p.Pnumber, p.Pname;


create or replace view vw_projetos_departamentos_gerentes as
select 
	p.Pname as projeto,
    d.Dname as departamento,
    concat(e.Fname, ' ', e.Lname) as gerente
from project p
join departament d
	on d.Dnumber = p.Dnum
join employee e 
	on e.Ssn = d.Mgr_ssn;
    

create or replace view vw_empregados_dependentes_gerentes as 
select
	e.Ssn as ssn_empregado,
    e.Fname,
    e.Lname,
    count(distinct dep.Dependent_name) as total_dependentes,
    case
		when exists (
			select 1
            from departament d
            where d.Mgr_ssn = e.Ssn
        ) then 'Sim'
        else 'Nao'
	end as eh_gerente
from employee e
join dependent dep
	on dep.Essn = e.Ssn
group by e.Ssn, e.Fname, e.Lname;


SELECT * FROM vw_empregados_departamento_local;

SELECT * FROM vw_departamentos_gerentes;

SELECT *
FROM vw_projetos_total_empregados
ORDER BY total_empregados DESC;

SELECT * FROM vw_projetos_departamentos_gerentes;

SELECT * FROM vw_empregados_dependentes_gerentes;



create user if not exists 'gerente_app'@'localhost'
identified by 'Troque_Esta_Senha_123!';

CREATE USER IF NOT EXISTS 'empregado_app'@'localhost'
IDENTIFIED BY 'Troque_Esta_Senha_456!';

grant select on azure_company.vw_empregados_departamento_local
to 'gerente_app'@'localhost';

grant select on azure_company.vw_departamentos_gerentes
to 'gerente_app'@'localhost';

grant select on azure_company.vw_projetos_departamentos_gerentes
to 'gerente_app'@'localhost';

SHOW GRANTS FOR 'gerente_app'@'localhost';

SHOW GRANTS FOR 'empregado_app'@'localhost';

