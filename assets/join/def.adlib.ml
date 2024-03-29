| `Join_Edit_Event_Invite
| `Join_Edit_Event_Add   
| `Join_Edit_Add 
| `Join_Edit_Accept
| `Join_Edit_Decline
| `Join_Edit_Remove 
| `Join_Edit_Event_Uninvite 

| `Join_Edit_Save

| `Join_Self_Event_Member of Ohm.AdLib.gender
| `Join_Self_Group_Member of Ohm.AdLib.gender
| `Join_Self_Forum_Member of Ohm.AdLib.gender
| `Join_Self_Event_NotMember of Ohm.AdLib.gender
| `Join_Self_Group_NotMember of Ohm.AdLib.gender
| `Join_Self_Forum_NotMember of Ohm.AdLib.gender
| `Join_Self_Event_Invited of Ohm.AdLib.gender
| `Join_Self_Pending of Ohm.AdLib.gender

| `Join_Self_Cancel
| `Join_Self_Edit 
| `Join_Self_Join 
| `Join_Self_JoinEdit 
| `Join_Self_Accept 
| `Join_Self_AcceptEdit
| `Join_Self_Decline 

| `Join_Self_Save

| `Join_Public_Title of string
| `Join_Public_Save
| `Join_Public_Description

| `Join_PublicNone_Title 
| `Join_PublicNone_Problem
| `Join_PublicNone_Solution

| `Join_PublicPick_Description 
| `Join_PublicPick_Button

| `Join_PublicNoFields_Description    
| `Join_PublicNoFields_Submit 

| `Join_PublicRequested_Description    

| `Join_PublicConfirmed_Description
| `Join_PublicConfirmed_Confirmed 

| `Join_Pending_Notify_Web of
    [ `Body of [`Group|`Event] * Ohm.AdLib.gender
    | `Accept
    | `Decline ]

| `Join_Pending_Notify_Mail of 
    [ `Title of string
    | `Action of [`Group|`Event]
    | `Body
    | `Accept
    | `Decline
    | `Detail ]
