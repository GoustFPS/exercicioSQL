DELIMITER //

CREATE PROCEDURE GerarRelatorioDiario()
BEGIN
    -- Crie uma tabela temporária para armazenar os resultados do relatório diário
    CREATE TEMPORARY TABLE TempRelatorioDiario (
        DataCompra DATE,
        QuantidadeProdutosComprados INT
    );

    -- Insira os dados na tabela temporária, agrupando por data e contando a quantidade de produtos comprados
    INSERT INTO TempRelatorioDiario (DataCompra, QuantidadeProdutosComprados)
    SELECT
        DataCompra,
        COUNT(*) AS QuantidadeProdutosComprados
    FROM
        TabelaDeVendas -- Substitua "TabelaDeVendas" pelo nome real da tabela de vendas
    GROUP BY
        DataCompra;

    -- Exiba o relatório diário
    SELECT * FROM TempRelatorioDiario;

    -- Drop a tabela temporária após o uso
    DROP TEMPORARY TABLE IF EXISTS TempRelatorioDiario;
END //

DELIMITER ;
