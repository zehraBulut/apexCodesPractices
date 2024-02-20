//Create an Opportunity
Opportunity opp = new Opportunity();
opp.Name='New Opportunity';
opp.StageName='Closed Won';
opp.CloseDate=Date.today();
insert opp;
