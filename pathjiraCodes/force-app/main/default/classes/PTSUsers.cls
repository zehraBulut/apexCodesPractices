public class PTSUsers {
    
    public static String mytoken =  PTSTokenUtility.getTokenByLabel('PTSTokens'); // PTSTokenUtility classından cagırdık
    public static final String PTS_User_API='https://data.pathtosalesforce.com'; //best practice
    
    //@future(callout=true) -> return Type CAN only be VOID
    public static String getUserList(){
        
        // to get style from Static resource
       StaticResource sr = [select id, body from StaticResource Where Name = 'PTSUserStyle'];
       String finalNames = sr.body.toString(); // finalNames holds the style

       
        // when we click update Contact button, to show existing name and new names separetly in the UI
        String newNames ='';
        String existingNames='';
       
        // Make the HTTP GET request with reusable method to get token 
        HttpResponse response = HTTPUtility.getMethod (PTS_User_API+'/userListProject.php?token='+ mytoken); 
        
        
        if(response.getStatusCode()==200 || response.getStatusCode()==201){
            APILogUtility.SuccessLog('PTSUsers','API call was succesfully! Status Code: '+response.getStatusCode());
            
            //to get user data from PTSUsersReponse class
            List<PTSUsersReponse> userList= PTSUsersReponse.parse(response.getBody());
            
            
            //to get contacts that exist in our org
            List <Contact> existingCons= [SELECT Id,UserId__c,Active__c,Administrator__c, Administrator_Certification__c ,Administrator_Status__c,All_Times__c ,Apex_Advance__c,Apex_Advance_Certification__c,Apex_Advance_Status__c,Apex_Beginner__c , Apex_Beginner_Certification__c , Apex_Beginner_Status__c,Apex_Codes_Cheat_Sheet__c,Apex_Codes_Cheat_Sheet_Certification__c,Apex_Intermediate__c,Apex_Intermediate_Certification__c,Apex_Intermediate_Status__c,Build_Apex_Coding_Skills__c,Build_Apex_Coding_Skills_Certification__c,Build_Apex_Coding_Skills_Status__c,Certificates__c, Days_of_Inactivity__c,Visual_Force__c, Vehicle_Manager__c, LWC__c, JavaScript__c, Integration__c, HTML__c, Formulas__c, Flow_Builder__c, Passed_Quizzes__c, Passed_Quizzes_Today__c, Data_Update_Date__c ,LastName, FirstName, Email, LastVisitDate__c FROM Contact];
                        
            Set<String> conUserId=new Set<String>();
            
            //store userId__field into conUserId
            for(Contact con : existingCons){
                conUserId.add(con.UserId__c);
            }
            
            List<Contact> conList= new List<Contact>();
            
        for(PTSUsersReponse u : userList){ 
                
            if(!conUserId.contains(u.Id)){  //New Contacts
                                        
                    Contact con = new Contact();
                    //avoid ekstra white space and divide first and last name from Name field into namePart variable
                    String[] namePart = u.Name.split(' ');
                    
                    con.FirstName = namePart[0];
                    con.LastName = namePart[1];
                    con.Email = u.email;
                    con.UserId__c = u.Id;
                    con.Active__c = 'Yes';
                    
                    con.LastVisitDate__c=Datetime.valueOf(u.LastVisitDate);
                    con.Passed_Quizzes__c=Integer.valueOf(u.TotalPassedQuizzes);
                    con.Data_Update_Date__c=System.now();
                    con.Certificates__c=Integer.valueOf(u.TotalCertificates);
                    con.Passed_Quizzes_Today__c=Integer.valueOf(u.TotalPassedQuizzesToday);
                    
                    
                    con.This_Week__c =String.isnotBlank(u.UserScoreLast7Days) ? Decimal.valueof(u.UserScoreLast7Days) : 0;
                    con.This_Month__c=String.isnotBlank(u.UserScoreLast30Days) ? Decimal.valueof(u.UserScoreLast30Days) : 0;
                    con.All_Times__c =String.isnotBlank(u.UserScoreAllTimes) ? Decimal.valueof(u.UserScoreAllTimes) : 0;
                    
                    con.Mon__c=Integer.valueOf(u.TotalPassedQuizzesMonday)!= 0 ? true : false;
                    con.Tue__c=Integer.valueOf(u.TotalPassedQuizzesTuesday)!= 0 ? true : false;
                    con.Wed__c=Integer.valueOf(u.TotalPassedQuizzesWednesday)!= 0 ? true : false;
                    con.Thu__c=Integer.valueOf(u.TotalPassedQuizzesThursday)!= 0 ? true : false;
                    con.Fri__c=Integer.valueOf(u.TotalPassedQuizzesFriday)!= 0 ? true : false;
                    con.Sat__c=Integer.valueOf(u.TotalPassedQuizzesSaturday)!= 0 ? true : false;
                    con.Sun__c=Integer.valueOf(u.TotalPassedQuizzesSunday)!= 0 ? true : false;
                    
                    con.Administrator__c =Integer.valueOf(u.Administrator);
                    con.Formulas__c=Integer.valueOf(u.Formulas);
                    con.Flow_Builder__c = Integer.valueOf(u.FlowBuilder);
                    con.Vehicle_Manager__c = Integer.valueOf(u.VehicleManager);
                    con.Apex_Beginner__c = Integer.valueOf(u.ApexBeginner);
                    con.Apex_Intermediate__c = Integer.valueOf(u.ApexIntermediate);
                    con.Integration__c = Integer.valueOf(u.Integration);
                    con.HTML__c = Integer.valueOf(u.HTML);
                    con.JavaScript__c = Integer.valueOf(u.JS);
                    con.LWC__c = Integer.valueOf(u.LWC);
                    con.Apex_Codes_Cheat_Sheet__c = Integer.valueOf(u.ApexCodesCheatSheet);
                    con.IQ__c = Integer.valueOf(u.IQ);
                    con.Visual_Force__c = Integer.valueOf(u.VisualForce);
                    con.Build_Apex_Coding_Skills__c=Integer.valueOf(u.BuildApexCodingSkills);
                    con.Apex_Advance__c=Integer.valueOf(u.ApexAdvance);
                    
                    con.Administrator_Certification__c =Integer.valueOf(u.AdministratorCertification)!= 0 ? true : false;
                    con.Formulas_Certification__c= Integer.valueOf(u.FormulasCertification)!= 0 ? true : false;
                    con.Vehicle_Manager_Certification__c=Integer.valueOf(u.VehicleManagerCertification)!= 0 ? true : false;
                    con.Apex_Beginner_Certification__c=Integer.valueOf(u.ApexBeginnerCertification)!= 0 ? true : false;
                    con.Apex_Intermediate_Certification__c =Integer.valueOf(u.ApexBeginnerCertification)!= 0 ? true : false;
                    con.Integration_Certification__c=Integer.valueOf(u.IntegrationCertification)!= 0 ? true : false;
                    con.HTML_Certification__c=Integer.valueOf(u.HTMLCertification)!= 0 ? true : false;
                    con.JavaScript_Certification__c=Integer.valueOf(u.JSCertification)!= 0 ? true : false;
                    con.LWC_Certification__c=Integer.valueOf(u.LWCCertification)!= 0 ? true : false;
                    con.Apex_Advance_Certification__c=Integer.valueOf(u.ApexAdvanceCertification)!= 0 ? true : false;
                    con.Apex_Codes_Cheat_Sheet_Certification__c=Integer.valueOf(u.ApexCodesCheatSheetCertification)!= 0 ? true : false;
                    con.IQ_Certification__c=Integer.valueOf(u.IQCertification)!= 0 ? true : false;
                    con.Visual_Force_Certification__c=Integer.valueOf(u.VisualForceCertification)!= 0 ? true : false;
                    con.Build_Apex_Coding_Skills_Certification__c=Integer.valueOf(u.BuildApexCodingSkillsCertification)!= 0 ? true : false;
                                                      

                    conList.add(con);
                    // to place newly inserted contact names right under "New Contacts" Title
                    newNames+='<li>'+u.Name+'</li>';
                }    
                
                else if(conUserId.contains(u.Id)){  //Existing Contacts
                    
                    for(Contact con:existingCons){
                        
                        if(con.UserId__c==u.Id){
                            
                            String[] nameParts = u.Name.normalizeSpace().split(' ');
                            con.FirstName=nameParts[0];
                            con.lastName=nameParts[1];
                            con.email=u.email;
                            con.LastVisitDate__c= Datetime.valueOf(u.LastVisitDate);
                            con.Passed_Quizzes__c=Integer.valueOf(u.TotalPassedQuizzes);
                            
                            con.Data_Update_Date__c=System.now();
                            con.Certificates__c=Integer.valueOf(u.TotalCertificates);
                            con.Passed_Quizzes_Today__c=Integer.valueOf(u.TotalPassedQuizzesToday);
                            
                            con.This_Week__c=String.isnotBlank(u.UserScoreLast7Days) ? Decimal.valueof(u.UserScoreLast7Days) : 0;
                            con.This_Month__c=String.isnotBlank(u.UserScoreLast30Days) ? Decimal.valueof(u.UserScoreLast30Days) : 0;
                            con.All_Times__c =String.isnotBlank(u.UserScoreAllTimes) ? Decimal.valueof(u.UserScoreAllTimes) : 0;
                            
                            con.Mon__c=Integer.valueOf(u.TotalPassedQuizzesMonday)!= 0 ? true : false;
                            con.Tue__c=Integer.valueOf(u.TotalPassedQuizzesTuesday)!= 0 ? true : false;
                            con.Wed__c=Integer.valueOf(u.TotalPassedQuizzesWednesday)!= 0 ? true : false;
                            con.Thu__c=Integer.valueOf(u.TotalPassedQuizzesThursday)!= 0 ? true : false;
                            con.Fri__c=Integer.valueOf(u.TotalPassedQuizzesFriday)!= 0 ? true : false;
                            con.Sat__c=Integer.valueOf(u.TotalPassedQuizzesSaturday)!= 0 ? true : false;
                            con.Sun__c=Integer.valueOf(u.TotalPassedQuizzesSunday)!= 0 ? true : false;
                            
                            con.Administrator__c =Integer.valueOf(u.Administrator);
                            con.Formulas__c=Integer.valueOf(u.Formulas);
                            con.Flow_Builder__c = Integer.valueOf(u.FlowBuilder);
                            con.Vehicle_Manager__c = Integer.valueOf(u.VehicleManager);
                            con.Apex_Beginner__c = Integer.valueOf(u.ApexBeginner);
                            con.Apex_Intermediate__c = Integer.valueOf(u.ApexIntermediate);
                            con.Integration__c = Integer.valueOf(u.Integration);
                            con.HTML__c = Integer.valueOf(u.HTML);
                            con.JavaScript__c = Integer.valueOf(u.JS);
                            con.LWC__c = Integer.valueOf(u.LWC);
                            con.Apex_Codes_Cheat_Sheet__c = Integer.valueOf(u.ApexCodesCheatSheet);
                            con.IQ__c = Integer.valueOf(u.IQ);
                            con.Visual_Force__c = Integer.valueOf(u.VisualForce);
                            con.Build_Apex_Coding_Skills__c=Integer.valueOf(u.BuildApexCodingSkills);
                            con.Apex_Advance__c=Integer.valueOf(u.ApexAdvance);
                            
                            con.Administrator_Certification__c =Integer.valueOf(u.AdministratorCertification)!= 0 ? true : false;
                            con.Formulas_Certification__c= Integer.valueOf(u.FormulasCertification)!= 0 ? true : false;
                            con.Vehicle_Manager_Certification__c=Integer.valueOf(u.VehicleManagerCertification)!= 0 ? true : false;
                            con.Apex_Beginner_Certification__c=Integer.valueOf(u.ApexBeginnerCertification)!= 0 ? true : false;
                            con.Apex_Intermediate_Certification__c =Integer.valueOf(u.ApexBeginnerCertification)!= 0 ? true : false;
                            con.Integration_Certification__c=Integer.valueOf(u.IntegrationCertification)!= 0 ? true : false;
                            con.HTML_Certification__c=Integer.valueOf(u.HTMLCertification)!= 0 ? true : false;
                            con.JavaScript_Certification__c=Integer.valueOf(u.JSCertification)!= 0 ? true : false;
                            con.LWC_Certification__c=Integer.valueOf(u.LWCCertification)!= 0 ? true : false;
                            con.Apex_Advance_Certification__c=Integer.valueOf(u.ApexAdvanceCertification)!= 0 ? true : false;
                            con.Apex_Codes_Cheat_Sheet_Certification__c=Integer.valueOf(u.ApexCodesCheatSheetCertification)!= 0 ? true : false;
                            con.IQ_Certification__c=Integer.valueOf(u.IQCertification)!= 0 ? true : false;
                            con.Visual_Force_Certification__c=Integer.valueOf(u.VisualForceCertification)!= 0 ? true : false;
                            con.Build_Apex_Coding_Skills_Certification__c=Integer.valueOf(u.BuildApexCodingSkillsCertification)!= 0 ? true : false;
                            
                            con.Administrator_Certification__c =Integer.valueOf(u.AdministratorCertification)!= 0 ? true : false;
                            con.Formulas_Certification__c= Integer.valueOf(u.FormulasCertification)!= 0 ? true : false;
                            con.Vehicle_Manager_Certification__c=Integer.valueOf(u.VehicleManagerCertification)!= 0 ? true : false;
                            con.Apex_Beginner_Certification__c=Integer.valueOf(u.ApexBeginnerCertification)!= 0 ? true : false;
                            con.Apex_Intermediate_Certification__c =Integer.valueOf(u.ApexBeginnerCertification)!= 0 ? true : false;
                            con.Integration_Certification__c=Integer.valueOf(u.IntegrationCertification)!= 0 ? true : false;
                            con.HTML_Certification__c=Integer.valueOf(u.HTMLCertification)!= 0 ? true : false;
                            con.JavaScript_Certification__c=Integer.valueOf(u.JSCertification)!= 0 ? true : false;
                            con.LWC_Certification__c=Integer.valueOf(u.LWCCertification)!= 0 ? true : false;
                            con.Apex_Advance_Certification__c=Integer.valueOf(u.ApexAdvanceCertification)!= 0 ? true : false;
                            con.Apex_Codes_Cheat_Sheet_Certification__c=Integer.valueOf(u.ApexCodesCheatSheetCertification)!= 0 ? true : false;
                            con.IQ_Certification__c=Integer.valueOf(u.IQCertification)!= 0 ? true : false;
                            con.Visual_Force_Certification__c=Integer.valueOf(u.VisualForceCertification)!= 0 ? true : false;
                            con.Build_Apex_Coding_Skills_Certification__c=Integer.valueOf(u.BuildApexCodingSkillsCertification)!= 0 ? true : false;
                            
                            // to place existing contact names right under "Existing Contacts" Title
                            existingNames+='<li style="list-style-type:circle">'+u.Name+'</li>';
                        }              
                    }
                }
       }    
            //we use addAll because we're adding List into List 
            conList.addAll(existingCons);
            
            //Within the static resource(text file), 
            //placeholders $newNames and $existingName are used as temporary variables. 
            //We now require these placeholders to be replaced with the actual variables 
            //the purpose for certain contacts should be placed under the correct title and display on the UI.
            //finalNames variable is holding our html version so we need to reassign with the actual variables.
            finalNames = finalNames.replace('$newNames$',newNames);
            finalNames = finalNames.replace('$existingName$',existingNames);
              
            
           try{
                upsert conList;
                
           }catch(Exception e){
              APILogUtility.ErrorLog('PTSUsers', 'Cause '+ e.getCause(), 'Contacts were not able to updated or inserted '+ e.getMessage());   
            }
        
    }else{
        // if response is not successfull.
        APILogUtility.ErrorLog('PTSUsers','An error occured while updating the User List','Contacts were not able to updated -'+ response.getStatusCode());  
    }
        
        return finalNames;
}
}