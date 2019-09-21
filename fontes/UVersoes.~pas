unit UVersoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, StdCtrls, IniFiles,Buttons, IBTable, IBCustomDataSet,
  IBQuery, ADODB;

type
  TFrm_Versoes = class(TForm)
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    Btn_Ok: TBitBtn;
    Tbl_Defs: TADOTable;
    Qry_Alter: TADOQuery;
    Qry_Create: TADOQuery;
    Qry_UltVersao: TADOQuery;
    Qry_Livre: TADOQuery;
    procedure VerificarVersao(versao:string);
    procedure AtualizarVersao;
    procedure GeraIntegrRef;
    Function TemAtualizacoes : Boolean;
    procedure Btn_OkClick(Sender: TObject);

  private
    { Private declarations }
    {Variaveis definidas para a procedure VerificarVersao e GeraIntegrRef}
    Alter,Create,SQL, scheduler, Tabela,PrimaryKey, IntegrRef_CampoRef,IntegrRef_TabRef,IntegrRef_Campo, Campos, NomeCampo, NomeCampo2, AddCampo, AddCampo2, SqlCreate, sDescr : String;
    i:integer;
    Achou,bCriouTabela : Boolean;

  public
    { Public declarations }
    ArqVersoes : TIniFile;
    AtualizouVersao : Boolean;

  end;

var
  Frm_Versoes: TFrm_Versoes;

implementation

uses UDM,URotinas ;

{$R *.DFM}

Function TFrm_Versoes.TemAtualizacoes : Boolean;
var UltVersao, Versoes, Path: String;
tem:boolean;
hotDebugger:string;
begin
   Path       := ExtractFilePath(ParamStr(0));
   ArqVersoes := TIniFile.Create(Path+'Versoes.INI');
   Versoes    := ArqVersoes.ReadString('HEADER' , 'VERSOES', '');
   Versoes    := Versoes+ArqVersoes.ReadString('HEADER' , 'VERSOES2', '');
   Versoes    := Versoes+ArqVersoes.ReadString('HEADER' , 'VERSOES3', '');
   Versoes    := Versoes+ArqVersoes.ReadString('HEADER' , 'VERSOES4', '');
   Versoes    := Versoes+ArqVersoes.ReadString('HEADER' , 'VERSOES5', '');
   Versoes    := Versoes+ArqVersoes.ReadString('HEADER' , 'VERSOES6', '');
   Versoes    := Versoes+ArqVersoes.ReadString('HEADER' , 'VERSOES7', '');
   Versoes    := Versoes+ArqVersoes.ReadString('HEADER' , 'VERSOES8', '');
   Versoes    := Versoes+ArqVersoes.ReadString('HEADER' , 'VERSOES9', '');

   hotDebugger    := ArqVersoes.ReadString('PARAMETROS' , 'HOTDEBUGGER', '');
   if (hotDebugger = 'TRUE') or (hotDebugger = 'true' ) then
      frotinas.hot_debugger := true
   else
      frotinas.hot_debugger := false;


   Tem        := false;

   Qry_UltVersao.close;
   Qry_UltVersao.Open;

   if Qry_UltVersao.recordcount > 0 then
   begin

     while Length(versoes)>0 do
     begin
         UltVersao:=Copy(versoes,1,Pos(';',versoes)-1);
         versoes  :=Copy(versoes,Pos(';',versoes)+1,Length(versoes));
         if not Qry_UltVersao.locate('versao',UltVersao,[]) then
         begin
            tem:=true;
            break;
         end;
     end;
   end
   else
   begin
    Qry_UltVersao.append;
    Qry_UltVersao.FieldByName('versao').value := FormatDateTime('DD/mm/yyyy',date);
    Qry_UltVersao.post;
   end;

   ArqVersoes.Free;
   result:=tem;

end;

procedure TFrm_Versoes.AtualizarVersao();
var UltVersao, Versoes, Path: String;
begin


   Path := ExtractFilePath(ParamStr(0));

   ArqVersoes := TIniFile.Create(Path+'Versoes.INI');

   Versoes    := ArqVersoes.ReadString('HEADER' , 'VERSOES', '');
   Versoes    := Versoes+ArqVersoes.ReadString('HEADER' , 'VERSOES2', '');
   Versoes    := Versoes+ArqVersoes.ReadString('HEADER' , 'VERSOES3', '');
   Versoes    := Versoes+ArqVersoes.ReadString('HEADER' , 'VERSOES4', '');
   Versoes    := Versoes+ArqVersoes.ReadString('HEADER' , 'VERSOES5', '');
   Versoes    := Versoes+ArqVersoes.ReadString('HEADER' , 'VERSOES6', '');
   Versoes    := Versoes+ArqVersoes.ReadString('HEADER' , 'VERSOES7', '');
   Versoes    := Versoes+ArqVersoes.ReadString('HEADER' , 'VERSOES8', '');
   Versoes    := Versoes+ArqVersoes.ReadString('HEADER' , 'VERSOES9', '');


   Memo1.Lines.clear;
   Memo1.Visible:=true;
   Memo1.Lines.add('Foi detectado ausência de Versões do Banco de Dados.');
   Memo1.Lines.add('Neste momento esta sendo verificado todos as possíveis');
   Memo1.Lines.add('diferenças de entre a versão '+copy(Versoes,1,pos(';',Versoes))+
                   ' e a versão '+UltVersao+'...');
   Memo1.Lines.add('');

   AtualizouVersao:=False;
   Qry_UltVersao.Close;
   Qry_UltVersao.open;

   while Length(versoes)>0 do
   begin
       UltVersao:=Copy(versoes,1,Pos(';',versoes)-1);
       versoes  :=Copy(versoes,Pos(';',versoes)+1,Length(versoes));
       if not Qry_UltVersao.locate('versao',UltVersao,[]) then
       begin
           Qry_UltVersao.Append;
           Qry_UltVersao.FieldByName('Versao').Value     := UltVersao;
           Qry_UltVersao.FieldByName('ALTERACOES').value := 'Alterações de Banco de Dados Atualizada em '+DateToStr(now);
           Qry_UltVersao.Post;
           try
            VerificarVersao(UltVersao);
           except
           end;
       end;
   end;


   Memo1.Lines.add('');
   Memo1.Lines.add('Verificação finalizada...');


   Btn_Ok.Enabled := true;

end;


procedure TFrm_Versoes.VerificarVersao(versao:string);
var Integr : string;
begin

   Memo1.Lines.Add('..............Versão '+Versao+' está sendo atualizada.............');

   Sql    := ArqVersoes.ReadString(Versao , 'SQL', '');
   Alter  := ArqVersoes.ReadString(Versao , 'ALTER', '');
   Create := ArqVersoes.ReadString(Versao , 'CREATE', '');
   Integr := ArqVersoes.ReadString(Versao , 'TAB_INTEGRIDADE', '');
   scheduler:=ArqVersoes.ReadString(Versao , 'SCHEDULER', '');

   if Length(scheduler) >0 then
   begin
    if scheduler = 'reprocessarBaixasHandara' then
      frotinas.reprocessaRetencaoBaixaParcialHandara;


   end;

   if Length(Alter) >0 then
   begin
        while Length(Alter)>0 do
        begin
            Tabela:=Copy(Alter,1,Pos(';',Alter)-1);
            Alter :=Copy(Alter,Pos(';',Alter)+1,Length(Alter));
            Memo1.Lines.Add('Verificando tabela '+Tabela+'...');

            if Tbl_Defs.Active then
                Tbl_Defs.Close;
            Tbl_Defs.TableName:=Tabela;
            Tbl_Defs.Active:=true;

            Campos:=ArqVersoes.ReadString(Versao+'_'+Tabela , 'CAMPOS', '');
            while Length(Campos)>0 do
            begin
                AddCampo  := Trim(Copy(Campos,1,pos(';',Campos)-1));
                NomeCampo := Copy(Campos,1,Pos(' ',AddCampo)-1);
                {Verifica se a alteração é trocando o Tamanho/Nome do Campo}
                if pos('=',AddCampo) = 0 then
                begin
                     i:=1;
                     Achou:=False;
                     while i<Tbl_Defs.FieldCount do
                     begin
                          if UpperCase(Tbl_Defs.Fields[i].FieldName) = UpperCase(NomeCampo) then
                             Achou:=true;
                          i:=i+1;
                     end;

                     if Not Achou then
                     begin
                          Memo1.Lines.Add('...Incluindo Campo '+NomeCampo+' na Tabela '+Tabela+'...');
                          if Qry_Alter.active then
                             Qry_Alter.Close;
                          Qry_Alter.SQL.Clear;
                          Qry_Alter.SQL.Add('Alter Table '+Tabela+' add '+AddCampo);
                          Try
                             Qry_Alter.ExecSQL;
                             AtualizouVersao:=True;
                          except
                             AtualizouVersao:=False;
                          end;
                     end;
                end
                else
                {-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=}
                {Neste caso, se foi colocado alteração de tamanho/nome de Campo}
                {-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=}
                begin
                   NomeCampo := copy(AddCampo,1,pos('=',AddCampo)-1);
                   AddCampo  := Copy(AddCampo,pos('=',AddCampo)+1,length(AddCampo));
                   if length(AddCampo)=0 then
                   begin
                     // caso seja para excluir o campo
                     Qry_Alter.SQL.Add('Alter Table '+Tabela+' drop column '+NomeCampo);
                     Try
                        Memo1.Lines.Add('.....Excluindo Campo '+NomeCampo+' na Tabela '+Tabela);
                        Qry_Alter.ExecSql;
                        AtualizouVersao:=True;
                     except
                        Showmessage('ATENÇÃO: Ocorreu problemas ao efetuar as atualizações de banco de dados'+#13+
                                              'Comunique imediatamente ao responsável pelo Sistema, é possível que esta versão'+#13+
                                             'não funcione corretamente, enquanto as atualizações não forem concluídas');
                        AtualizouVersao:=False;
                     end;

                   end
                   else
                   begin
                     NomeCampo2:= trim(Copy(AddCampo,1,pos(' ',AddCampo)))+'2';
                     AddCampo2 := NomeCampo2+' '+Copy(AddCampo,pos(' ',AddCampo)+1,Length(AddCampo));
                     Memo1.Lines.Add('...Verificado Alteração do Campo '+NomeCampo+' na Tabela '+Tabela+' Para '+AddCampo+'...');
                     if Qry_Alter.active then
                        Qry_Alter.Close;
                     Qry_Alter.SQL.Clear;
                     Memo1.Lines.Add('.....Incluindo Campo temporário '+NomeCampo2+' na Tabela '+Tabela);
                     Qry_Alter.SQL.Add('Alter Table '+Tabela+' add '+AddCampo2);

                     Try
                        Qry_Alter.ExecSql;

                        //Qry_Alter.Close;
                        //Qry_Alter.SQL.Clear;
                        //Qry_Alter.SQL.Text := 'Commit';
                        //Qry_Alter.ExecSql;


                        Memo1.Lines.Add('.....Movendo Conteúdo do Campo '+NomeCampo+' para o Campo '+NomeCampo2);
                        Qry_Alter.Close;
                        Qry_Alter.SQL.Clear;
                        Qry_Alter.SQL.Text := 'Update '+Tabela+' set '+NomeCampo2+'='+NomeCampo;
                        Qry_Alter.ExecSql;

                        //Qry_Alter.Close;
                        //Qry_Alter.SQL.Clear;
                        //Qry_Alter.SQL.Text := 'Commit';
                        //Qry_Alter.ExecSql;


                        Memo1.Lines.Add('.....Dropando Campo '+NomeCampo);
                        Qry_Alter.Close;
                        Qry_Alter.Sql.Clear;
                        Qry_Alter.Sql.Text:='Alter Table '+Tabela+' Drop column '+NomeCampo;
                        Qry_Alter.ExecSql;


                        //Qry_Alter.Close;
                        //Qry_Alter.SQL.Clear;
                        //Qry_Alter.SQL.Text := 'Commit';
                        //Qry_Alter.ExecSql;


                        NomeCampo:=Copy(AddCampo,1,pos(' ',AddCampo));
                        Memo1.Lines.Add('.....Adicionando novo Campo '+AddCampo);
                        Qry_Alter.Close;
                        Qry_Alter.Sql.Clear;
                        Qry_Alter.Sql.add('Alter Table '+tabela+' add '+AddCampo);
                        Qry_Alter.ExecSql;


                        //Qry_Alter.Close;
                        //Qry_Alter.SQL.Clear;
                        //Qry_Alter.SQL.Text := 'Commit';
                        //Qry_Alter.ExecSql;


                        Memo1.Lines.Add('.....Movendo Conteúdo do Campo '+NomeCampo2+' para o Campo '+NomeCampo);
                        Qry_Alter.Close;
                        Qry_Alter.SQL.Clear;
                        Qry_Alter.SQL.Text := 'Update '+Tabela+' set '+NomeCampo+'='+NomeCampo2;
                        Qry_Alter.ExecSql;


                        //Qry_Alter.Close;
                        //Qry_Alter.SQL.Clear;
                        //Qry_Alter.SQL.Text := 'Commit';
                        //Qry_Alter.ExecSql;


                        Memo1.Lines.Add('.....Dropando Campo temporário '+NomeCampo2);
                        Qry_Alter.Close;
                        Qry_Alter.Sql.Clear;
                        Qry_Alter.Sql.Text:='Alter Table '+Tabela+' Drop column '+NomeCampo2;
                        Qry_Alter.ExecSql;

                        //Qry_Alter.Close;
                        //Qry_Alter.SQL.Clear;
                        //Qry_Alter.SQL.Text := 'Commit';
                        //Qry_Alter.ExecSql;


                        AtualizouVersao:=True;

                     except

                        Showmessage('ATENÇÃO: Ocorreu problemas ao efetuar as atualizações de banco de dados'+#13+
                                              'Comunique imediatamente ao responsável pelo Sistema, é possível que esta versão'+#13+
                                             'não funcione corretamente, enquanto as atualizações não forem concluídas');

                        AtualizouVersao:=False;

                     end;
                   end;
                end;
                Campos    := Copy(Campos,Pos(';',Campos)+1,Length(Campos));

            end;

        end;
   end;


   {Procedimento para Criar Tabelas}
   if Length(Create) >0 then
   begin
        while Length(Create)>0 do
        begin
            Tabela :=Copy(Create,1,Pos(';',Create)-1);
            sDescr := ArqVersoes.ReadString(versao+'_CREATE_'+Tabela , 'DESCRICAO', '');

            Create :=Copy(Create,Pos(';',Create)+1,Length(Create));
            Memo1.Lines.Add('Verificando Existência da tabela '+Tabela+'...');


            if Qry_Livre.Active then
                Qry_Livre.Close;
            Qry_Livre.Sql.Text :='select * from tabela where Tabela=:tb';
            Qry_Livre.Parameters.ParamByName('tb').value:=tabela;
            Qry_Livre.Open;

            if Qry_Livre.RecordCount = 0 then
            begin
               Memo1.Lines.Add('...Criando tabela '+tabela);
               bCriouTabela:=true;
               Campos:=ArqVersoes.ReadString(Versao+'_CREATE_'+Tabela , 'CAMPOS', '');
               i:=0;
               SqlCreate:='Create table '+tabela+' (';
               while Length(Campos)>0 do
               begin
                   i:=i+1;
                   AddCampo:=Copy(Campos,1,pos(';',Campos)-1);
                   SqlCreate:=SqlCreate+AddCampo;
                   Campos    := Copy(Campos,Pos(';',Campos)+1,Length(Campos));
                   if Length(Campos) > 0 then
                      SqlCreate:=SqlCreate+',';
               end;

               {Verificando Primary Key}
               PrimaryKey:=ArqVersoes.ReadString(Versao+'_CREATE_'+Tabela , 'PRIMARYKEY', '');
               if length(PrimaryKey)>0 then
               begin
                  SqlCreate:=SqlCreate+', CONSTRAINT PK_'+Tabela+' PRIMARY KEY ('+PrimaryKey+')';
                  Memo1.Lines.Add('......Com Chave Primária em '+PrimaryKey);
               end;

               SqlCreate:=SqlCreate+')';
               {Se tem os Campos da Tabela a ser Criada}
               if i>0 then
               begin
                    if Qry_Create.Active then
                       Qry_Create.Close;
                    try
                       Qry_Create.Sql.Clear;
                       Qry_Create.Sql.Text := SqlCreate;
                       Qry_Create.ExecSql;
                       if Qry_Livre.Active then
                          Qry_Livre.Close;
                       Qry_Livre.Sql.Clear;
                       Qry_Livre.Sql.Text := 'select * from tabela where Tabela=:nome';
                       Qry_Livre.Parameters.ParamByName('nome').value:=Tabela;
                       Qry_Livre.open;
                       {Se a Tabela não existir na Tabela de Tabela}
                       if Qry_Livre.RecordCount = 0 then
                       begin
                           Qry_Livre.Append;
                           //Qry_Livre.FieldByName('Descricao').Value   := sDescr;
                           Qry_Livre.FieldByName('Tabela').Value      := Tabela;
                           Qry_Livre.Post;
                       end;

                       if Qry_Livre.Active then
                          Qry_Livre.Close;

                       AtualizouVersao:=True;
                    except
                       AtualizouVersao:=False;
                       Showmessage('ATENÇÃO: Ocorreu problemas ao efetuar as atualizações de banco de dados'+#13+
                                              'Comunique imediatamente ao responsável pelo Sistema, é possível que esta versão'+#13+
                                             'não funcione corretamente, enquanto as atualizações não forem concluídas');

                    end;
               end;

               if Qry_Livre.Active then
                  Qry_Livre.close;

               if Qry_Create.Active then
                  Qry_Create.Close;

            end;
        end;
   end;

   {Procedimento Para Gerar Integridade}
   if (length(Integr)>0)  and (Length(Create)=0) and (Length(Alter)=0) and not bCriouTabela then
   begin
      Tabela:=Integr;
      Memo1.Lines.Add('Verificando Integridade da tabela '+Integr+'...');

      IntegrRef_Campo   :=ArqVersoes.ReadString(Versao, 'INTEGR_REF_CAMPO', '');
      IntegrRef_TabRef  :=ArqVersoes.ReadString(Versao, 'INTEGR_REF_TABREF', '');
      IntegrRef_CampoRef:=ArqVersoes.ReadString(Versao, 'INTEGR_REF_CAMPOREF', '');
      if (Length(IntegrRef_Campo)>0) and (Length(IntegrRef_TabRef)>0) and (Length(IntegrRef_CampoRef)>0) then
      begin
         GeraIntegrRef;
         bCriouTabela:=true;
      end;
   end;

   if length(Sql) >0 then
   begin
      Qry_Create.close;
      Qry_Create.Sql.Clear;
      Qry_Create.Sql.Text := sql;
      Try
         Qry_Create.ExecSql;
       finally
         AtualizouVersao:=true;
      end;
   end;
end;



procedure TFrm_Versoes.GeraIntegrRef;
begin
     Memo1.Lines.Add('......Com Integridade Referencial com a Tabela '+IntegrRef_TabRef);
     SqlCreate:='Alter table '+tabela+' add Constraint FK_'+IntegrRef_Campo;
     SqlCreate:=SqlCreate+' FOREIGN KEY ('+IntegrRef_Campo+')';
     SqlCreate:=SqlCreate+' REFERENCES '+IntegrRef_TabRef+'('+IntegrRef_CampoRef+')';
     if Qry_Create.Active then
        Qry_Create.Close;
     try
        Qry_Create.Sql.Clear;
        Qry_Create.Sql.Text := SqlCreate;
        Qry_Create.ExecSql;
        if Qry_Livre.Active then
           Qry_Livre.Close;
        AtualizouVersao:=True;
     except
         Memo1.Lines.Add('......Não foi possível gerar esta integridade referencial');
     end;
end;

procedure TFrm_Versoes.Btn_OkClick(Sender: TObject);
begin
     close;
end;

end.
