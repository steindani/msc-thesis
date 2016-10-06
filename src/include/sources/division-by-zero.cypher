MATCH   (binding:BindingIdentifier)
        <-[:binding]-()-->
        (be:BinaryExpression)
        -[:right]->(right:LiteralNumericExpression)
WHERE      be.operator = 'Div'
       AND right.value = 0.0
RETURN binding
