### How to update HTTPS credentials in Sourcetree
    Delete the password file from C:\Users\username\AppData\Local\Atlassian\SourceTree
    Note: SourceTree login problem happens when yor enterprise password is changed.
    Delete the password file.
    try clone (or other git command)
    Atlassian login popup. enter credentials
    git popup for the enterprise repo username. enter login id (instead of email address)
    git popup for the enterprise repo password. enter login password
    
### Your Bitbucket account has been locked. To unlock it and log in again you must solve a CAPTCHA.
    Go to windows Control Panel -> User Accounts -> Credentail Manager
    Remove Atlanssian account credentials (except you organization Bitbucket site)
    Log out from your organization bitbucket repo.
    Log in to organization bitbucket repo with your organization credentials.
    You'll need to resolve CAPCHA.
    
### Create a new Atlassian account and associate it with Sourtree
    Delete the password file from C:\Users\username\AppData\Local\Atlassian\SourceTree
    Delete the account.json file from C:\Users\username\AppData\Roaming\Atlassian\SourceTree
    Re-open Sourcetree.
    Select Bitbucket
    Enter a username for your Atlassian account.
    
