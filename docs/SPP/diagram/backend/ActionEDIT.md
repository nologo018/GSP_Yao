```mermaid
sequenceDiagram
    autonumber
    
    box Render EDIT
        actor USR as User
        participant FE as FE Server
        participant BE as BE Server
        participant DB as Database
    end

    USR ->> FE: Submit formfield
    activate FE
    FE ->> FE: Check validation
    alt Validation fail
        FE -->> USR: Show validation msg.
    end
    note over USR, DB: BASE OF REQUEST DIAGRAM
    FE ->> BE: PUT: Sent PUT to server
    activate BE
    deactivate FE
    BE ->> DB: Update data into database <br> from formfield
    deactivate BE
    activate DB
    note left of DB: data = formfield, <br> updated_at = now()
    alt Update success
        DB -->> BE: Return HTTP 200
        activate BE
        note over USR, DB: LOG ACTIVITIES DIAGRAM
        BE -->> FE: Return HTTP 200
        activate FE
        FE -->> USR: Redirect to list page
    else Update Fail
        DB -->> BE: Return HTTP 400 <br> with exception msg.
        deactivate DB
        BE -->> FE: Return HTTP 400 <br> with exception msg.
        deactivate BE
        FE -->> USR: Show err. msg.
        deactivate FE
    end
```