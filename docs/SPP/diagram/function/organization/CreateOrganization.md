```mermaid
sequenceDiagram
    autonumber
    
    box Create organization
        actor USR as User
        participant FE as FE Server
        participant BE as BE Server
        participant DB as Database
    end

    USR ->> FE: Request create organization page
    activate FE
    note over USR, DB: BASE OF REQUEST DIAGRAM
    FE ->> BE: Get create organization page
    activate BE
    BE -->> FE: Return HTTP 200
    deactivate BE
    FE -->> USR: Redirect to create <br> organization page
    deactivate FE

    USR ->> FE: Submit with organization detail form
    activate FE
    FE ->> FE: Check validation
    alt Validation fail
        FE -->> USR: Show validation msg. <br> and disable next BTN.
    else Validation pass
        FE ->> FE: Save state
    end
    FE ->> BE: Get select project page
    deactivate FE
    activate BE
    BE ->> DB: Get data from database
    activate DB
    alt Project not found
        DB ->> BE: Return HTTP 200 <br> with NULL
        BE ->> FE: Return HTTP 200 <br> with NULL
        activate FE
        FE ->> USR: Redirect to select project page <br> without project checklist
    else Project found
        DB ->> BE: Return HTTP 200 <br> with objects
        deactivate DB
        BE ->> FE: Return HTTP 200 <br> with objects
        deactivate BE
        FE ->> USR: Redirect to select project page <br> with project checklist
        deactivate FE
    end

    USR ->> FE: Submit with project select form
    FE ->> FE: Get state organization detail form
    alt Get state fail
        FE -->> USR: Show err. msg.
    end
    note over USR, DB: ACTION POST DIAGRAM
```