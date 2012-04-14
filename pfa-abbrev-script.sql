####### Templates #######
#insert into conversations (id, title, content, parentid) values (,'','<p> </p>',);
#insert into help (id, content, contenttype) values (,'<p></p>',);

#0 - Information
#1 - Question
#2 - Warning
#3 - Movie

#insert into faqs (id, content, helpid) values (,'',);

#class="informationHelpLink" onclick="makeAJAXRequest(\'paneContentHelpPane\', 2, #idofconvorhelp#)"
#class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, #idofconvorhelp#)"
#<span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 7)">Yes</span>&nbsp;&nbsp;<span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 15)">No</span>
#<span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 2)">Continue</span>
#<span class="navLink" onclick="doCreateUserProcess(3);">Continue</span>


############## Begin SQL ##############

####### Use DB #######
use pfa;

####### Reset #######
delete from faqs;
delete from help;
delete from conversations where parentid is not null;
delete from conversations;

####### Conversations #######
insert into conversations (id, title, content, parentid) values (1,'Welcome','<p>Welcome to the Family Division\'s intake and assistance application!  This application is designed to provide you with information about the Family Division and help you complete forms necessary to file an action or proceed with an existing action.</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 2)">Continue</span>',null);

insert into conversations (id, title, content, parentid) values (2,'Legal Notice','<p>Please be advised that this application does not constitute legal advice and should not be used in lieu of representation by an attorney, should you choose to retain one.</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 3)">Continue</span>',1);

insert into conversations (id, title, content, parentid) values (3,'Complexity Disclaimer','<p>I may also determine that the information collected from you is too complex to file electronically, and you may be referred to call or visit the Family Division for further assistance.</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 4)">Continue</span>',1);

insert into conversations (id, title, content, parentid) values (4,'Save Info','<p>At any time in this process, you can save your information and return at a later date to complete it.</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 5)">Continue</span>',1);

insert into conversations (id, title, content, parentid) values (5,'Interview Introduction','<p>I will be asking you a series of questions that will help me determine how you can best be served.  You can skip this portion of the interview if you are an <span>attorney</span> or are <span <span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 6)">prepared to file on your own</span>.</p>',null);

insert into conversations (id, title, content, parentid) values (6,'Dependency or Deliquency','<p>Are you here for a <span class="informationHelpLink" onclick="makeAJAXRequest(\'paneContentHelpPane\', 2, 1)">dependency</span> or a <span class="informationHelpLink" onclick="makeAJAXRequest(\'paneContentHelpPane\', 2, 2)">delinquency</span> issue? <span class="navLink">Yes <i>(Not Implemented)</i></span>&nbsp;&nbsp;<span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 7)">No</span></p>',5);

insert into conversations (id, title, content, parentid) values (7,'More Information','<p>Do you need more information about the Family Division? <span class="navLink">Yes <i>(Not Implemented)</i></span>&nbsp;&nbsp;<span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 8)">No</span></p>',5);

insert into conversations (id, title, content, parentid) values (8,'Dependency and Deliquency','<p>Please note that dependency and delinquency matters are NOT public record.  All other information collected here WILL NOT be available to the public until it is acted upon by the Court or is filed with the <span class="informationHelpLink" onclick="makeAJAXRequest(\'paneContentHelpPane\', 2, 3)">Department of Court Records</span> (DCR).</p> <span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 9)">Continue</span>',5);

insert into conversations (id, title, content, parentid) values (9,'Please Answer','<p>Please answer all of the following questions truthfully and to the best of your ability. </p><span class="navLink" onclick="doCreateUserProcess(10);">Continue</span>',null);

insert into conversations (id, title, content, parentid) values (10,'Your Name','<p>I need to collect some information about you.  Please tell me your name.</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 11)">Continue</span>',9);

insert into conversations (id, title, content, parentid) values (11,'Confirm Name','<p>You stated that your name is %%User_Prefix%% %%User_FirstNm%% %%User_MiddleNm%% %%User_LastNm%%.  Is this correct?</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 12)">Yes</span>&nbsp;&nbsp;<span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 10)">No</span>',9);

insert into conversations (id, title, content, parentid) values (12,'Existing Case?','<p>Do you have an existing family division case number?</p><span class="navLink">Yes <i>(Not Implemented)</i></span>&nbsp;&nbsp;<span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 13)">No</span><span class="navLink">I don\'t know <i>(Not Implemented)</i></span>',9);

# numbering dies a slow death here, just wing it
insert into conversations (id, title, content, parentid) values (13,'Choose Area to File','<p>%%User_Prefix%% %%User_LastNm%%, please choose the area in which you would like to file an action.</p><span class="navLink">a custody action <i>(Not implemented)</i></span><br/><span class="navLink">a support action <i>(Not implemented)</i></span><br/><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 14)">a Protection from Abuse action</span><br/><span class="navLink">a divorce action <i>(Not implemented)</i></span><br/><span class="navLink">a motion <i>(Not implemented)</i></span>',9);

insert into conversations (id, title, content, parentid) values (14,'New or Existing','<p>Are you here to file a PFA petition to obtain a new order, are you here to modify an existing PFA order, or is the existing PFA order being violated?</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 15)">Obtain  a PFA</span><br/><span class="navLink">Defendant on a PFA</span><br/><span class="navLink">existing PFA order being violated</span>',9);

insert into conversations (id, title, content, parentid) values (15,'Referred?','<p>You were referred or advised to file for a PFA order because you are a victim of violence or have been threatened with violence by a family member or intimate partner, it is important for you to understand that there are several different ways that you can get help from the court.  You can initiate a criminal case or a PFA case.  Often people that are referred to file a PFA action were the victims of crimes such as harassment, physical or sexual assault, terroristic threats, stalking or trespass.  If that is true for you, you may want to pursue an action through the Criminal Division in addition to or instead of filing for a PFA order.  Filing a criminal action means the police make an arrest and your abuser may be prosecuted through the Criminal Division and ordered to stay away from the victim(s).</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 16)">Continue</span>',9);

insert into conversations (id, title, content, parentid) values (16,'Proceed with Filing?','<p>Would you like to proceed with filing for a PFA?</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 16)">Yes</span>&nbsp;&nbsp;<span class="navLink">No <i>(Not implemented)</i></span>',9);

insert into conversations (id, title, content, parentid) values (17,'Purpose of PFA','<p>The purpose of a PFA order is to stop abuse from occurring in the future and to provide temporary court help to victims of abuse who seek to leave or end abusive relationships with their intimate partner or other family members.  PFA cases are handled as civil, or non-criminal cases.  The purpose of a PFA order is not to punish the abuser.</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 18)">Continue</span>',9);

insert into conversations (id, title, content, parentid) values (18,'Essential Reading','<p>There is a lot of information you should consider before you make the decision to file for a PFA order.  Filing for a PFA order may help to keep you safe or it could endanger your safety.   You should read through the topics listed below before deciding if you want to file for a PFA order. </p><span class="informationHelpLink" onclick="makeAJAXRequest(\'paneContentHelpPane\', 12, 2)">Who can file for a PFA order?</span><br/><span class="informationHelpLink" onclick="makeAJAXRequest(\'paneContentHelpPane\', 4, 2)">What is the definition of ‘abuse’?</span><br/><span class="informationHelpLink" onclick="makeAJAXRequest(\'paneContentHelpPane\', 5, 2)">What relief or help can I ask for in a PFA order?</span><br/><span class="informationHelpLink" onclick="makeAJAXRequest(\'paneContentHelpPane\', 6, 2)">Does it cost anything to file for a PFA order?</span><br/><span class="informationHelpLink" onclick="makeAJAXRequest(\'paneContentHelpPane\', 7, 2)">Do I need a lawyer to get a PFA order?</span><br/><span class="informationHelpLink" onclick="makeAJAXRequest(\'paneContentHelpPane\', 8, 2)">How many days and how much time will I have to spend at court hearings?</span><br/><span class="informationHelpLink" onclick="makeAJAXRequest(\'paneContentHelpPane\', 9, 2)">Will the abuser know that I am getting a PFA order?</span><br/><span class="informationHelpLink" onclick="makeAJAXRequest(\'paneContentHelpPane\', 10, 2)">How does the abuser get ‘served’ with or find out about the PFA order?</span><br/><span class="informationHelpLink" onclick="makeAJAXRequest(\'paneContentHelpPane\', 11, 2)">What happens if the abuser violates the PFA order?</span><br/><span>“Protection” or “Protection from Abuse” generally means that the Defendant is ordered by the Court not to abuse, harass, threaten, stalk or otherwise endanger the “protected” person(s).</span><br/><span>Trained counselors and Legal Advocates (non-lawyers) from the county’s four domestic violence agencies are available to discuss your particular situation or your decision of whether or not to file for a PFA order.  They are also available to help you with safety planning (other ways to stay safe).  If you would like more information on how to access a domestic violence counselor or Legal advocate, please click here (go to PFA resource page to be built).</span><br/><br/><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 19)">I am done reviewing the above topics</span>',9);

insert into conversations (id, title, content, parentid) values (19,'Safety Check','<p>Are you in immediate danger?</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 28)">Yes</span>&nbsp;&nbsp;<span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 20)">No</span>',9);

insert into conversations (id, title, content, parentid) values (20,'Proceed with PFA','<p>Would you like to proceed with filing for a PFA?</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 21)">Yes</span>&nbsp;&nbsp;<span class="navLink">No <i>(Not implemented)</i></span>',9);

# TODO: user input of defendant
insert into conversations (id, title, content, parentid) values (21,'Defendant Information','<p>What is the Defendant\'s first and last name?</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 22)">Continue</span>',9);

insert into conversations (id, title, content, parentid) values (22,'Confirm Defendant','<p>You stated the Defendant’s name is %%Defendant_Prefix%%  %% Defendant _FirstNm%% %%Defendant _MiddleNm%% is a %%Defendant_LastNm%%.  Is this correct?</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 23)">Yes</span>&nbsp;&nbsp;<span class="navLink">No <i>(Not implemented)</i></span>',9);

insert into conversations (id, title, content, parentid) values (23,'Defendant Address','<p>Is the defendant’s address the same as yours?</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 26)">Yes</span>&nbsp;&nbsp;<span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 24)">No</span>',9);

# TODO: user input of defendant address
insert into conversations (id, title, content, parentid) values (24,'Enter Defendant Address','<p>What is the defendant’s address? LEARN MORE: When providing address information, I am asking that the address you provide refers to addresses where each party actually resides.  Some things to keep in mind: (1) Please only provide the address at which Defendant actually lives, (2) Please provide a street address, not a P.O. Box numbers, and (3) If you and Defendant live at the same address of in the same building, but in different units, please be sure to identify the separate units by apartment numbers or descriptions like “first/second/third floor unit” or “front/rear apartment”.</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 2)">Continue</span>',9);

insert into conversations (id, title, content, parentid) values (25,'Confirm Defendant Address','<p>You stated the Defendant’s address is %%Defendant_Add1%%  %% Defendant _Add2%% %%Defendant _Add3%% is a %%Defendant_City%%%%Defendant_State%% %%Defendant_ZIP%%.  Is this correct?</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 26)">Yes</span>&nbsp;&nbsp;<span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 24)">No</span>',9);

# TODO: user input description, add video, add resource link
insert into conversations (id, title, content, parentid) values (26,'Describe the Situation','<p>Describe in detail, in your own words and the to the best of your ability, what happened to you and/or your children, including any physical or sexual abuse, threats, injury, incidents of stalking, medical treatment sought, calls to law enforcement, and the use of weapons or the threatened use of weapons.</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 27)">Continue</span>',9);

insert into conversations (id, title, content, parentid) values (27,'Thank you!','<p>Thank you.  We have all the information necessary to complete a PFA application.  The application is now stored electronically with the Department of Court Records.  It is recommended that you print the application for your own records.  This application must be presented in person to either a Magistrate Office or Family Division Judge for an order to be entered into the record.  Please review the FAQ section to determine where the local magistrate is for you or go directly to the Family Division.  When you arrive at the Magistrate Office or the Family Law Center, you will be provided with further instructions as to how to proceed.  Thank You.</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 29)">Finish</span>',null);

insert into conversations (id, title, content, parentid) values (28,'Emergency','<p>IMMEDIATELY contact 911 and explain in detail the situation.</p><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 20)">Continue PFA Process</span><br/><span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 29)">Exit immediately.</span>',null);

insert into conversations (id, title, content, parentid) values (29,'Finished','<p>Thank you for using the Family Division\'s intake and assistance application. You may now close your browser.</p>',null);

####### Help #######
insert into help (id, content, contenttype) values (1,'<p>A dependency matter is a case in which a child has been alleged to be a victim of abuse or neglect or there is alleged improper care and control of a child.  The Office of Children Youth and Families (OCYF) is involved with these cases and is usually the moving party that brings the case to the attention of the Court.  A parent, guardian, or caregiver can also file a dependency petition alleging a child is out of their care and control.</p>',0);
insert into help (id, content, contenttype) values (2,'<p>A delinquency matter is when a juvenile is alleged to have committed a crime and may be under the supervision of the Family Division judge assigned and the Juvenile Probation Office (JPO).</p>',0);
insert into help (id, content, contenttype) values (3,'<p>The DCR is the official keeper of all original court documents. <a href="http://dcr.allegheny.us/">http://dcr.allegheny.us/</a></p>',0);
insert into help (id, content, contenttype) values (4,'<p>Ask yourself:  am I physically, sexually or emotionally abused and controlled by a person with whom I currently have, or formerly  had, an intimate relationship:  Am I slapped, kicked, shoved, punched, choked, shaken, burned, stabbed, threatened, harassed, verbally abused or dominated?  Has my partner ever been arrested for hurting me?  Is my partner very jealous, possessive, critical, controlling of my behavior and choice of friends, violent when drinking heavily or using drugs? . . . If you answered YES to ANY of these questions . . . you are being abused.</p>',0);
insert into help (id, content, contenttype) values (5,'<p>You may ask for:  protection from the abuse, the abuser to be evicted from a residence you own or jointly own, compensation for any economic losses as a result of the abuse or the filing of the application, custody, and weapons relinquishment of the abuser.</p>',0);
insert into help (id, content, contenttype) values (6,'<p>No, the costs will be imposed on the defendant.</p>',0);
insert into help (id, content, contenttype) values (7,'<p>No, you may retain private counsel if you choose, but it is not a requirement.  The court\'s PFA Unit and domestic violence advocates will be available to assist you.  Neighborhood Legal Services Association ((NLSA)), which provides free legal service, may be able to provide an attorney to represent you at the final PFA hearing approximately one week later, but you must stay after your hearing to apply for this free service.</p>',0);
insert into help (id, content, contenttype) values (8,'<p>If you filed a request for an Emergency PFA with a Magisterial District Judge, you will need to appear at the Family Law Center for your temporary PFA the next business day and your final PFA hearing, within approximately ten days within your temporary hearing.  If you file a temporary PFA at the Family Law Center you will have a hearing the same day and your final PFA hearing will occur within approximately ten days.  At your final PFA hearing, you will be provided an opportunity to come to an agreement with the Defendant regarding resolution of the matter.  If you are unable to come to an agreement, you will proceed to a hearing with a Judge that afternoon.</p>',0);
insert into help (id, content, contenttype) values (9,'<p>The temporary PFA hearing may occur without Defendant\'s knowledge or presence.  Defendant then will be served with a copy of the order resulting from the proceeding and the PFA application, as well as the date for the final hearing.  Defendant will have an opportunity to appear at the final PFA hearing and present his/her position to the Court and call any witnesses.</p>',0);
insert into help (id, content, contenttype) values (10,'<p>The PFA Unit will explain to you how service occurs when you file your application.  Service is generally performed by local law enforcement or sheriffs.  You will not be required to personally serve this paperwork to the Defendant.</p>',0);
insert into help (id, content, contenttype) values (11,'<p>Contact the police or dial 911 immediately to report the abuse.  The Defendant may be arrested.  The Defendant may be required to appear for an Indirect Criminal Contempt hearing, which may result in a criminal charge.  If the police do not arrest your abuser, you can file a private criminal complaint with the area prosecutor at the District Attorney\'s office of the Magisterial District Judge serving the address where the incident occurred.</p>',0);
insert into help (id, content, contenttype) values (12,'<p>Spouse or ex-spouse, current or former intimate partner (which may include a dating relationship), parent, child of plaintiff or defendant, other person related by blood.</p>',0);

####### FAQ #######















