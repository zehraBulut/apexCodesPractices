public class OpportunityUtility {
    public static void createTaskforClosedOpp(){
     List<opportunity> oppList=[SELECT Id,Name,CloseDate,OwnerId FROM Opportunity WHERE IsClosed= false AND CloseDate < TODAY];
        
     List<Task>taskList=new  List<Task>();
        for(Opportunity opp: oppList){
            Task tsk=new Task();
            tsk.Subject='high';
            tsk.Status='not started';
            tsk.OwnerId=opp.OwnerId;
            tsk.WhatId=opp.Id;
            
            TaskList.add(tsk);   
        }
     insert TaskList;
    }  
}