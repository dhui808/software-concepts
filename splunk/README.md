## Steps to move your dashboards
    Go to Settings > Knowledge > User interface > Views.
    Filter the page by using the App or Owner
    In the Actions column, click Move.
    Select the app you'd like to move your dashboard to from the App context: menu.
  
## search logs for entries with custId and orgId fields and list all unique custId
    namespace="my-openshift-namepsace" sourcetype="kube:container:myproject" custId orgId | stats count by custId | table custId
    
## search errors and display the results as a table
    namespace="my-openshift-namepsace" sourcetype="kube:container:myproject" STATUS="Error" OR STATUS="Failed" | table custId STATUS errorMessage _time
Save the results as a table panel in dashboard. change the time range to default.

## Regular expression
    namespace="my-openshift-namepsace" sourcetype="kube:container:myproject" HEADER | rex field=_raw "ID:(?<ID>[0-9A-Za-z]{24}).*XUID:(?<XUID>[0-9a-z]{18])" | stats count ID, XUID | table ID, XUID
    
## Subquery - search header and finds ID and XUID in the subquery. In the main query, STATUS=success and ID XUID match the results of subquery.
    namespace="my-openshift-namepsace" sourcetype="kube:container:myproject" STATUS=success [search namespace="my-openshift-namepsace" sourcetype="kube:container:myproject" HEADER | rex field=_raw "ID:(?<ID>[0-9A-Za-z]{24}).*XUID:(?<XUID>[0-9a-z]{18])" | stats count ID, XUID | table ID, XUID]
    
## Interset of two subquery
    | set interset [subquery1] [subquery2]

## diff of two subquery
    | set diff [subquery1] [subquery2]

## union of two subquery
    | set union [subquery1] [subquery2]
    
