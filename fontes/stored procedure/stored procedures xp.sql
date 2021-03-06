if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_calcularDemonstrativo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_calcularDemonstrativo]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE sp_calcularDemonstrativo

@fx1_de int,@fx1_ate int, @fx2_de int, @fx2_ate int, @fx3_de int, @fx3_ate int, @cliente int, @cobrador int, @tipo varchar(3)

AS 

   Declare @select varchar(2000)
   Declare @from varchar(250)
   Declare @join varchar(250)
   Declare @where varchar(2000)
   Declare @dt1 Datetime
   Declare @dt2 Datetime
   Declare @hj Datetime
   Declare @continue char(1)


   Declare @fx1_de_dt datetime
   Declare @fx1_ate_dt datetime
   Declare @fx2_de_dt datetime
   Declare @fx2_ate_dt datetime
   Declare @fx3_de_dt datetime
   Declare @fx3_ate_dt datetime


   Declare @pk_devedor int
   Declare @valor_titulo Decimal(14,2)
   Declare @vencimento Datetime
   Declare @motivo_dialogo int
   Declare @tipo_motivo varchar(60)
   Declare @tipo_titulo varchar(3)

   Declare @find_pkdevedor int

   -- Tabelas
	CREATE TABLE #tb_titulos
    (
        pk_devedor int,
		motivo_dialogo int, 
		tipo varchar(20),
		
		fx1_qtd_dev int,
		fx1_qtd_tit int,
		fx1_valor decimal(14,2),

		fx2_qtd_dev int,
		fx2_qtd_tit int,
		fx2_valor decimal(14,2),

		fx3_qtd_dev int,
		fx3_qtd_tit int,
		fx3_valor decimal(14,2)

	)

	CREATE TABLE #tb_cobradores
    (
		pk_cobrador int
	)

	if (@cobrador IS NOT NULL) 
		insert into #tb_cobradores (pk_cobrador)  select nu_usu from usuarios where nu_usu=@cobrador
	else
		insert into #tb_cobradores (pk_cobrador)  select nu_usu from usuarios

	
	set @hj = GETDATE()

    set @dt1 = DATEADD(day,  @fx3_ate *(-1), @hj) 
	set @dt2 = DATEADD(day,  @fx1_de*(-1), @hj) 


   set @fx1_de_dt = DATEADD(day,  @fx1_de *(-1), @hj)
   set @fx1_ate_dt = DATEADD(day,  @fx1_ate *(-1), @hj)
   set @fx2_de_dt = DATEADD(day,  @fx2_de *(-1), @hj)
   set @fx2_ate_dt = DATEADD(day,  @fx2_ate *(-1), @hj)
   set @fx3_de_dt = DATEADD(day,  @fx3_de *(-1), @hj)
   set @fx3_ate_dt = DATEADD(day,  @fx3_ate *(-1), @hj)

	DECLARE cursor_objects CURSOR FOR
		select t.pk_devedor, t.vencimento, t.valor_titulo, t.tipo_titulo, (select d.motivo_dialogo from devedores d where 
d.pk_devedor=t.pk_devedor) as motivo_dialogo 
		from titulos t 
		inner join Devedores d on ( t.pk_devedor=d.pk_devedor)
		where (t.motivo_baixa is null or t.motivo_baixa ='') 
			and t.vencimento >=@dt1
			and t.vencimento <=@dt2
			and d.pk_cliente = convert(varchar,@cliente)
			and exists( select 1 from #tb_cobradores cob where d.pk_cobrador = cob.pk_cobrador )

	open cursor_objects

	-- Lendo a próxima linha
	FETCH NEXT FROM cursor_objects INTO @pk_devedor, @vencimento,@valor_titulo , @tipo_titulo, @motivo_dialogo

	-- Percorrendo linhas do cursor (enquanto houverem)
	WHILE @@FETCH_STATUS = 0
	BEGIN

		
		if @tipo is null or (  @tipo is not null and @tipo = @tipo_titulo ) 
		begin


			if NOT EXISTS ( select 1 from #tb_titulos where pk_devedor=@pk_devedor )
			begin

				select @tipo_motivo = tipo from ocorrencias where pk_ocorr = @motivo_dialogo

				if @tipo_motivo = 'A'
					set @tipo_motivo = 'Ativo'
				else
					set @tipo_motivo = 'Inativo'

				insert into #tb_titulos (pk_devedor,motivo_dialogo,tipo)  values(@pk_devedor,@motivo_dialogo, 
@tipo_motivo) 

				update #tb_titulos  set fx1_qtd_dev = 0, fx1_valor=0, fx1_qtd_tit=0, fx2_qtd_dev = 0, fx2_valor=0, 
fx2_qtd_tit=0,
				fx3_qtd_dev = 0, fx3_valor=0, fx3_qtd_tit=0 where pk_devedor=@pk_devedor

				if (@vencimento > @fx1_ate_dt) and (@vencimento < @fx1_de_dt) 
					update #tb_titulos  set fx1_qtd_dev = 1 where pk_devedor=@pk_devedor
				else if (@vencimento > @fx2_ate_dt) and (@vencimento < @fx2_de_dt) 
					update #tb_titulos  set fx2_qtd_dev = 1 where pk_devedor=@pk_devedor
				else if (@vencimento > @fx3_ate_dt) and (@vencimento < @fx3_de_dt) 
					update #tb_titulos  set fx3_qtd_dev = 1 where pk_devedor=@pk_devedor
			
			end

			if (@vencimento > @fx1_ate_dt) and (@vencimento < @fx1_de_dt) 
				update #tb_titulos  set fx1_valor = fx1_valor + @valor_titulo, fx1_qtd_tit = fx1_qtd_tit + 1 where 
pk_devedor=@pk_devedor
			else if (@vencimento > @fx2_ate_dt) and (@vencimento < @fx2_de_dt) 
				update #tb_titulos  set fx2_valor = fx2_valor + @valor_titulo, fx2_qtd_tit = fx2_qtd_tit + 1 where 
pk_devedor=@pk_devedor
			else if (@vencimento > @fx3_ate_dt) and (@vencimento < @fx3_de_dt) 
				update #tb_titulos  set fx3_valor = fx3_valor + @valor_titulo, fx3_qtd_tit = fx3_qtd_tit + 1 where 
pk_devedor=@pk_devedor
		
		end
		-- Lendo a próxima linha
		FETCH NEXT FROM cursor_objects INTO @pk_devedor, @vencimento,@valor_titulo , @tipo_titulo, @motivo_dialogo
	
	END

	-- Fechando Cursor para leitura
	CLOSE cursor_objects

	-- Desalocando o cursor
	DEALLOCATE cursor_objects 


	select t.motivo_dialogo, t.tipo, o.nome as descricao, sum(fx1_qtd_dev) as fx1_qtd_dev, sum(fx1_qtd_tit) as fx1_qtd_tit, 
sum(fx1_valor) as fx1_valor,
		sum(fx2_qtd_dev) as fx2_qtd_dev, sum(fx2_qtd_tit) as fx2_qtd_tit, sum(fx2_valor) as fx2_valor,
		sum(fx3_qtd_dev) as fx3_qtd_dev, sum(fx3_qtd_tit) as fx3_qtd_tit, sum(fx3_valor) as fx3_valor,
               cast(0.00 as Numeric) as percdevedores, cast(0.00 as numeric) as perctitulos, cast(0.00 as numeric) as percvalores

	from #tb_titulos t left join ocorrencias o on ( o.pk_ocorr = t.motivo_dialogo )
	group by t.motivo_dialogo, t.tipo, o.nome




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

