select 

transaction_id



from (

    select 
    transaction_id,
    amount,
    day,
    max(amount) over (PARTITION BY day) AS max_amount
    FROM Transactions

) t
where amount = max_amount
order by transaction_id

