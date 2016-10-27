// Prepare call edges
MATCH
    // Match called FunctionDeclarations for every CallExpression
    (call:CallExpression)-[:callee]->(:IdentifierExpression)
    <-[:node]-(:Reference)<-[:references]-(:Variable)
    -[:declarations]->(:Declaration)-[:node]->(:BindingIdentifier)
    <-[:name]-(fd:FunctionDeclaration)
MATCH
    // List every call from a function body
    shortestPath(
      (fun:FunctionDeclaration)-[*]->(call:CallExpression)
    )

MERGE
    // Create a calls relationship between the caller
    // FunctionDeclaration and the called FunctionDeclaration
    (fun)-[:calls]->(fd)
;

// Get not used FunctionDeclarations
MATCH
    // Find the exported FunctionDeclaration that
    // may be an entrance point
    (main)-[:items]->(:ExportDeclaration)
    -[:declaration]->(fd:FunctionDeclaration)

MATCH
    // Find every FunctionDeclaration that should
    // be available through the entrance points
    (find:FunctionDeclaration)

WHERE
    // List the ones that are not reachable from the
    // entrance nodes (thus are not the entrance nodes "<>").
        ( NOT (fd)-[:calls*]->(find) )
    AND ( find <> fd )
    AND ( main:Script OR main:Module )

RETURN
    find
