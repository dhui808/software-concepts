## Steps to move your dashboards
    Go to Settings > Knowledge > User interface > Views.
    Filter the page by using the App or Owner
    In the Actions column, click Move.
    Select the app you'd like to move your dashboard to from the App context: menu.
  
## search logs for entries with custId and orgId fields and list all unique custId
    namespace="my-openshift-namepsace" sourcetype="kube:container:myproject" custId orgId | stats count by custId | table custId
  