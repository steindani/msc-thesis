MATCH
    (call:CallExpression)-[:callee]->(:IdentifierExpression)
    <--(:Either)<-[:node]-(:Reference)-[:references]-(:Variable)
    -[:declarations]->(:Declaration)-[:node]->(bindingIdentifier)
    <-[:name]-(fd:FunctionDeclaration),

    (fun:FunctionDeclaration)-[*]->(call:CallExpression)

MERGE
    (fun)-[:calls]->(fd)
;

MATCH
    (main)-[:items]->(:ExportDeclaration)
    -[:declaration]->(fd:FunctionDeclaration),

    (find:FunctionDeclaration)
    
WHERE
        ( NOT (fd)-[:calls*]->(find) )
    AND ( find <> fd )
    AND ( main:Script OR main:Module )

RETURN
    find
