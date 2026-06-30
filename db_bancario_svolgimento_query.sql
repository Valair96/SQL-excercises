-- 1. Età del cliente
SELECT cl.id_cliente,
YEAR(CURDATE()) - YEAR(data_nascita) AS eta 
FROM cliente cl;

-- 2. Numero di transazioni in uscita su tutti i conti
SELECT 
COUNT(*) AS transazioni_uscita
FROM transazioni t
JOIN tipo_transazione ts 
ON t.id_tipo_trans = ts.id_tipo_transazione 
WHERE ts.segno = '-';

-- 3. Numero di transazioni in entrata su tutti i conti.
SELECT 
COUNT(*) AS transazioni_entrata
FROM transazioni t
JOIN tipo_transazione ts 
ON t.id_tipo_trans = ts.id_tipo_transazione 
WHERE ts.segno = '+';

-- 4. Importo totale transato in uscita su tutti i conti.
SELECT SUM(t.importo) AS somma_uscite 
FROM transazioni t 
JOIN tipo_transazione ts 
ON t.id_tipo_trans = ts.id_tipo_transazione 
WHERE ts.segno = '-';

-- 5. Importo totale transato in entrata su tutti i conti.
SELECT SUM(t.importo) AS somma_entrate 
FROM transazioni t 
JOIN tipo_transazione ts 
ON t.id_tipo_trans = ts.id_tipo_transazione 
WHERE ts.segno = '+';

-- 6. Numero totale di conti posseduti
SELECT cl.id_cliente, COUNT(co.id_conto) AS num_conti 
FROM cliente cl 
LEFT JOIN conto co 
ON cl.id_cliente = co.id_cliente 
GROUP BY cl.id_cliente;

-- 7. Numero di conti posseduti per tipologia (un indicatore per ogni tipo di conto)
SELECT
    SUM(CASE WHEN tp.desc_tipo_conto = 'Conto Base' THEN 1 ELSE 0 END) AS num_conti_base,
    SUM(CASE WHEN tp.desc_tipo_conto = 'Conto Business' THEN 1 ELSE 0 END) AS num_conti_business,
    SUM(CASE WHEN tp.desc_tipo_conto = 'Conto Privati' THEN 1 ELSE 0 END) AS num_conti_privati,
    SUM(CASE WHEN tp.desc_tipo_conto = 'Conto Famiglie' THEN 1 ELSE 0 END) AS num_conti_famiglie
FROM cliente cl
LEFT JOIN conto co
    ON cl.id_cliente = co.id_cliente
LEFT JOIN tipo_conto tp
    ON co.id_tipo_conto = tp.id_tipo_conto;

-- 8. Numero di transazioni in uscita per tipologia di conto (un indicatore per tipo di conto)
SELECT
SUM(CASE WHEN tc.desc_tipo_conto = 'Conto Base' THEN 1 ELSE 0 END) AS transazioni_conti_base,
SUM(CASE WHEN tc.desc_tipo_conto = 'Conto Business' THEN 1 ELSE 0 END) AS transazioni_conti_business,
SUM(CASE WHEN tc.desc_tipo_conto = 'Conto Privati' THEN 1 ELSE 0 END) AS transazioni_conti_privati,
SUM(CASE WHEN tc.desc_tipo_conto = 'Conto Famiglie' THEN 1 ELSE 0 END) AS transazioni_conti_famiglie
FROM transazioni t
LEFT JOIN tipo_transazione ts
ON t.id_tipo_trans = ts.id_tipo_transazione
LEFT JOIN conto c
ON t.id_conto = c.id_conto
LEFT JOIN tipo_conto tc
ON c.id_tipo_conto = tc.id_tipo_conto
WHERE ts.segno = '-';

-- 9. Numero di transazioni in entrata per tipologia di conto (un indicatore per tipo di conto)
SELECT
SUM(CASE WHEN tc.desc_tipo_conto = 'Conto Base' THEN 1 ELSE 0 END) AS transazioni_conti_base,
SUM(CASE WHEN tc.desc_tipo_conto = 'Conto Business' THEN 1 ELSE 0 END) AS transazioni_conti_business,
SUM(CASE WHEN tc.desc_tipo_conto = 'Conto Privati' THEN 1 ELSE 0 END) AS transazioni_conti_privati,
SUM(CASE WHEN tc.desc_tipo_conto = 'Conto Famiglie' THEN 1 ELSE 0 END) AS transazioni_conti_famiglie
FROM transazioni t
LEFT JOIN tipo_transazione ts
ON t.id_tipo_trans = ts.id_tipo_transazione
LEFT JOIN conto c
ON t.id_conto = c.id_conto
LEFT JOIN tipo_conto tc
ON c.id_tipo_conto = tc.id_tipo_conto
WHERE ts.segno = '+';

-- 10. Importo transato in uscita per tipologia di conto (un indicatore per tipo di conto)
SELECT
SUM(CASE WHEN tc.desc_tipo_conto = 'Conto Base' THEN t.importo ELSE 0 END) AS transazioni_conti_base,
SUM(CASE WHEN tc.desc_tipo_conto = 'Conto Business' THEN t.importo ELSE 0 END) AS transazioni_conti_business,
SUM(CASE WHEN tc.desc_tipo_conto = 'Conto Privati' THEN t.importo ELSE 0 END) AS transazioni_conti_privati,
SUM(CASE WHEN tc.desc_tipo_conto = 'Conto Famiglie' THEN t.importo ELSE 0 END) AS transazioni_conti_famiglie
FROM transazioni t
LEFT JOIN tipo_transazione ts
ON t.id_tipo_trans = ts.id_tipo_transazione
LEFT JOIN conto c
ON t.id_conto = c.id_conto
LEFT JOIN tipo_conto tc
ON c.id_tipo_conto = tc.id_tipo_conto
WHERE ts.segno = '-';

-- 11. Importo transato in entrata per tipologia di conto (un indicatore per tipo di conto)
SELECT
SUM(CASE WHEN tc.desc_tipo_conto = 'Conto Base' THEN t.importo ELSE 0 END) AS transazioni_conti_base,
SUM(CASE WHEN tc.desc_tipo_conto = 'Conto Business' THEN t.importo ELSE 0 END) AS transazioni_conti_business,
SUM(CASE WHEN tc.desc_tipo_conto = 'Conto Privati' THEN t.importo ELSE 0 END) AS transazioni_conti_privati,
SUM(CASE WHEN tc.desc_tipo_conto = 'Conto Famiglie' THEN t.importo ELSE 0 END) AS transazioni_conti_famiglie
FROM transazioni t
LEFT JOIN tipo_transazione ts
ON t.id_tipo_trans = ts.id_tipo_transazione
LEFT JOIN conto c
ON t.id_conto = c.id_conto
LEFT JOIN tipo_conto tc
ON c.id_tipo_conto = tc.id_tipo_conto
WHERE ts.segno = '+';
