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

############## Begin SQL ##############

####### Use DB #######
use pfa;

####### Reset #######
delete from faqs;
delete from help;
delete from conversations where parentid is not null;
delete from conversations;

####### Conversations #######
# 1
insert into conversations (id, title, content, parentid) values (1,'Welcome!','<p>Welcome to the Family Division\'s intake and assistance application!  This application is designed to provide you with information about the Family Division and help you complete forms necessary to file an action or proceed with an existing action.</p> <span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 2)">Continue</span>',null);

# 2
insert into conversations (id, title, content, parentid) values (2,'Legal','<p>Please be advised that this application does not constitute legal advice and should not be used in lieu of representation by an attorney, should you choose to retain one.</p> <span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 3)">Continue</span>',1);

# 3
insert into conversations (id, title, content, parentid) values (3,'Complex','<p>I may also determine that the information collected from you is too complex to file electronically, and you may be referred to call or visit the Family Division for further assistance.</p> <span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 4)">Continue</span>',1);

# 4
insert into conversations (id, title, content, parentid) values (4,'Complete Later','<p>At any time in this process, you can save your information and return at a later date to complete it.</p> <span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 5)">Continue</span>',1);

# 5
insert into conversations (id, title, content, parentid) values (5,'Attorney or Self File','<p>I will be asking you a series of questions that will help me determine how you can best be served.  You can skip this portion of the interview if you are an attorney or are <span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 6)">prepared to file on your own</span>.</p>',null);

# 6, 2 help items (1 & 2), yes (7) and no (15)
insert into conversations (id, title, content, parentid) values (6,'Dependency or Deliquency','<p>Are you here for a <span class="informationHelpLink" onclick="makeAJAXRequest(\'paneContentHelpPane\', 2, 1)">dependency</span> or a <span class="informationHelpLink" onclick="makeAJAXRequest(\'paneContentHelpPane\', 2, 2)">delinquency</span> issue? <span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 7)">Yes</span>&nbsp;&nbsp;<span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 15)">No</span></p>',5);

# 7, 1 help item (3), yes (8) and no (9)
insert into conversations (id, title, content, parentid) values (7,'Pending Cases','<p>Do you presently have a <span class="informationHelpLink" onclick="makeAJAXRequest(\'paneContentHelpPane\', 2, 3)">court active</span> dependency or delinquency case? <span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 8)">Yes</span>&nbsp;&nbsp;<span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 9)">No</span></p>',5);

# 8
insert into conversations (id, title, content, parentid) values (8,'Good News!','<p>That is good news!  You need to attend the next scheduled court event.  If you are unsure of when the next scheduled court event will occur, please contact your attorney, your OCYF caseworker, or the probation officer assigned to the case.  Thank you for using the Universal Intake Application.  We will now exit you out of the system.</p>',null);

# 9, yes no 10 11
insert into conversations (id, title, content, parentid) values (9,'Juvenile?','<p>Is this an issue involving a crime allegedly committed by a juvenile? <span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 10)">Yes</span>&nbsp;&nbsp;<span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 11)">No</span></p>',null);

# 10, end case needs a sink state
insert into conversations (id, title, content, parentid) values (10,'Contact Probation','<p>Please contact the Juvenile Probation Intake Department at 412-350-0170</p>',null);

#11, help (4) for warning on contact juvenile
insert into conversations (id, title, content, parentid) values (11,'Alleged Abuse?','<p>Does this matter involve the alleged abuse and/or neglect of a juvenile? <span class="navLink" onclick="makeAJAXRequest(\'paneContentHelpPane\', 2, 4)">Yes</span>&nbsp;&nbsp;<span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 15)">No</span></p>',null);

#15, yes no 16 17
insert into conversations (id, title, content, parentid) values (15,'More Information','<p>Do you need more information about the Family Division? <span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 16)">Yes</span>&nbsp;&nbsp;<span class="navLink" onclick="makeAJAXRequest(\'paneContentConversationPane\', 1, 17)">No</span></p>',null);


####### Help Topics #######

# For 6, dependency
insert into help (id, content, contenttype) values (1,'<p>A dependency matter is a case in which a child has been alleged to be a victim of abuse or neglect or there is alleged improper care and control of a child.  The Office of Children Youth and Families (OCYF) is involved with these cases and is usually the moving party that brings the case to the attention of the Court.  A parent, guardian, or caregiver can also file a dependency petition alleging a child is out of their care and control.</p>',0);

# For 6, deliquency
insert into help (id, content, contenttype) values (2,'<p>A delinquency matter is when a juvenile is alleged to have committed a crime and may be under the supervision of the Family Division judge assigned and the Juvenile Probation Office (JPO).</p>',0);

# For 7, court active
insert into help (id, content, contenttype) values (3,'<p>A court active case is open with the Court and under review by OCYF or the JPO.  This may involve scheduled court events.</p>',0);

# For 11, yes
insert into help (id, content, contenttype) values (4,'<p>Please contact the Office of Children, Youth, and Families at 412-350-5701 if you wish to report this matter.</p>',2);
