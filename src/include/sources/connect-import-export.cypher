MATCH
    (:ImportDeclaration)-[*]->(importIdentifier:BindingIdentifier)
MATCH
    (:GlobalScope)-[:through]->(:HashTable)-[]->(reference:Reference)
    -[:node]->(:Either)-[:data]->(identifier:IdentifierExpression)
MATCH
    (:ExportDeclaration)-[:declaration]->(:Node)-[:name]
    ->(exportIdentifier:BindingIdentifier)

MATCH
    (exportIdentifier)<-[:node]-(declaration:Declaration)
MATCH
    (reference)<-[:references]-(variable:Variable)

WHERE
    importIdentifier.name = identifier.name AND
    exportIdentifier.name = importIdentifier.name

MERGE
    (variable)-[:declarations]->(declaration)
