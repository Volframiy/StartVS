@RestResource(urlMapping='/Accounts/*/contacts/')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        String AccountId = request.requestURI.split('/')[request.requestURI.split('/').size() - 2];
        
        Account acc = [SELECT ID, Name, (SELECT ID, Name FROM Contacts) FROM Account WHERE ID =:AccountId];
        return acc;
    }
}