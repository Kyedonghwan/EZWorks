create table form(
    form_no number primary key,
    form_name   varchar2(50 char),
    form_life number,
    form_secu varchar2(3 char),
    form_folder varchar2(50 char)
);

create table approval(
    approval_no number primary key,
    form_no number,
    emp_no number,
    approval_regdate date default sysdate,
    approval_title varchar2(100 char),
    approval_content clob,
    approval_file_is_exist varchar2(20 char),
    approval_state varchar2(50 char)
);

alter table approval
add constraint fk_approval_form
foreign key(form_no)
references form(form_no);

alter table approval
add constraint fk_approval_emp
foreign key(emp_no)
references emp(emp_no);

create table usedForm(
    form_no number,
    emp_no number
);

alter table usedForm
add constraint fk_used_form_emp
foreign key(emp_no)
references emp(emp_no);

alter table usedForm
add constraint fk_used_form_form
foreign key(form_no)
references form(form_no);

insert into form values(1,'업무기안',5,'상','일반');
insert into form values(2,'업무협조',5,'상','일반');
insert into form values(3,'일반품의서',5,'상','일반');
insert into form values(4,'회계<입금,출금,대체>품의서',5,'상','일반');
insert into form values(5,'해외출장신청',5,'상','지원');
insert into form values(6,'경조화신청',5,'상','지원');
