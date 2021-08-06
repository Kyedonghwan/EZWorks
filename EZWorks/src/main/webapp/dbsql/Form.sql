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

insert into form values(1,'�������',5,'��','�Ϲ�');
insert into form values(2,'��������',5,'��','�Ϲ�');
insert into form values(3,'�Ϲ�ǰ�Ǽ�',5,'��','�Ϲ�');
insert into form values(4,'ȸ��<�Ա�,���,��ü>ǰ�Ǽ�',5,'��','�Ϲ�');
insert into form values(5,'�ؿ������û',5,'��','����');
insert into form values(6,'����ȭ��û',5,'��','����');
