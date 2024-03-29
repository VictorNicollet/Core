| `Events_Link_New -> "Organiser une activité"
| `Events_Link_Options -> "Paramètres"

| `Events_List_Empty -> "Aucune activité disponible"

| `Events_List_Undated -> "Sans date"
| `Events_List_Past -> "Archives"

| `Events_Title -> "Activités"

| `Events_CountComing n -> Printf.sprintf "%d %s" n (if n = 1 then "inscrit" else "inscrits") 

| `Events_NoDate -> "Pas de date"

| `Events_Options_Title -> "Paramètres"
| `Events_Options_CanCreate -> "Qui peut organiser des activités ?"
| `Events_Options_CanCreate_Detail -> "Seuls les administrateurs peuvent publier des activités sur le site web ou modifier des activités créées par les autres."
| `Events_Options_Admin -> "Uniquement les administrateurs"
| `Events_Options_Member -> "Tout le monde"
| `Events_Options_Submit -> "Enregistrer"

| `Events_Create_Title -> "Organiser une nouvelle activité"
| `Events_Create_Step_One -> "Choisissez le type d'activité"
| `Events_Create_Step_Two -> "Complétez ces informations"
| `Events_Create_Field_Name -> "Le nom de votre activité"
| `Events_Create_Field_Picture -> "Le logo ou la photo de l'activité" 
| `Events_Create_Edit_Picture -> "Modifier"
| `Events_Create_Submit -> "Continuer"
| `Events_Create_Cancel -> "Annuler"

| `Events_CreateForbidden_Title -> "Organiser une nouvelle activité"
| `Events_CreateForbidden_Problem -> "Les responsables de cet espace ont choisi d'interdire l'organisation de nouvelles activités par des non-administrateurs. Vous ne disposez pas des droits nécessaires pour organiser une activité."
| `Events_CreateForbidden_Solution -> "Vous pouvez demander à un administrateur de vous confier ces droits, ou de créer une nouvelle activité à votre place et de vous en nommer responsable."
| `Events_CreateForbidden_Back -> "Retour"

| `Event_Forbidden_Title -> "Page inaccessible"
| `Event_Forbidden_Problem -> "Vous ne pouvez pas afficher cette page parce qu'elle a été supprimée ou que vous ne disposez pas des droits suffisants."
| `Event_Forbidden_Solution -> "Vous pouvez demander à un administrateur de vous confier ces droits, ou essayer de créer une nouvelle activité..."

| `Event_Section `Wall -> "Discussions"
| `Event_Section `People -> "Inscrits"
| `Event_Section `Album -> "Photos"
| `Event_Section `Folder -> "Fichiers"

| `Event_Pic_Change -> "Changer l'image"
| `Event_Admin -> "Administration"
| `Event_Invite -> "Inviter des participants"

| `Event_Desc_Empty -> "Pas de description"
| `Event_When -> "Quand ?"
| `Event_Where -> "Où ?"
| `Event_More_Details -> "Plus de Détails"

| `Event_Admin_Title -> "Administration"

| `Event_Edit_Title -> "Modifier"
| `Event_Edit_Link -> "Modifier cette activité"
| `Event_Edit_Sub -> "Changez le nom, le lieu, la date et les autres informations"
| `Event_Edit_Name -> "Nom de l'activité"
| `Event_Edit_Publish -> "Niveau de visibilité"
| `Event_Edit_Publish_Detail -> "Qui peut voir cette activité et s'y inscrire ?"
| `Event_Edit_Publish_Label what -> begin match what with
    | `Public -> "Visible depuis internet"
    | `Normal -> "Visible par tous les membres"
    | `Private -> "Sur invitation uniquement"
end
| `Event_Edit_Submit -> "Enregistrer"
| `Event_Edit_SavePublish -> "Publier"
| `Event_Edit_SaveDraft -> "Enregistrer Brouillon"
| `Event_Edit_Required -> "Champ obligatoire"
| `Event_Edit_Date -> "Date"
| `Event_Edit_Address -> "Adresse"
| `Event_Edit_Page -> "Description"

| `Event_Picture_Title -> "Photo"
| `Event_Picture_Link -> "Changer de photo"
| `Event_Picture_Sub -> "Sélectionnez un nouveau logo ou photo pour cette activité"

| `Event_People_Title -> "Participants"
| `Event_People_Link -> "Gestion des participants"
| `Event_People_Sub -> "Invitez des participants et validez les demandes d'inscription"

| `Event_Invite_Title -> "Invitations"

| `Event_DraftNoPeople -> "Cette activité n'a pas encore été publiée : vous ne pouvez pas encore y inviter des participants."
| `Event_DraftNoPeople_Link -> "Publier cette activité"

| `Event_Delegate_Title -> "Organisateurs"
| `Event_Delegate_Link -> "Organisateurs"
| `Event_Delegate_Sub -> "Déléguez l'organisation de cette activité à des membres"

| `Event_Delegate_Label lbl -> begin match lbl with 
  | `Help -> "Les organisateurs disposent de tous les pouvoirs sur cette activité. La liste ci-dessous recense les organisateurs actuels :"
  | `Submit -> "Nommer organisateurs"
end

| `Event_JoinForm_Title -> "Formulaire"
| `Event_JoinForm_Link -> "Formulaire d'inscription"
| `Event_JoinForm_Sub -> "Demandez des informations aux participants"

| `Event_Columns_Title -> "Colonnes"

| `Event_Delete_Title -> "Supprimer"
| `Event_Delete_Link -> "Supprimer"
| `Event_Delete_Sub -> "Effacer cette activité et toutes les données associées"

| `Event_Delete_Warning -> "La suppression d'une activité est permanente !"
| `Event_Delete_Submit -> "Supprimer"
| `Event_Delete_Cancel -> "Ne pas supprimer"

| `Event_DelPick_Title -> "Ajouter"

| `Event_Unnamed -> "Sans Titre"
| `Event_Public_Map_Enlarge -> "Agrandir la carte"
| `Event_Public_By -> "Organisé par"

| `Event_Invite_Notify_Mail what -> begin 
  match what with 
    | `Title name -> "[Invitation] " ^ name
    | `Action -> "vous invite à une activité"
    | `Body asso -> !! "Cette activité est organisée dans le cadre de %s" asso
    | `Body2 -> "Pour en savoir plus, connectez-vous sur l'espace membres ou cliquez sur les boutons ci-dessous pour accepter ou refuser l'invitation."
    | `Accept -> "Accepter l'invitation"
    | `Decline -> "Refuser"
    | `Detail -> "Plus de détails"
end 

| `Event_Invite_Notify_Web what -> begin 
  match what with 
    | `Body gender -> "vous invite à"
    | `Accept -> "Accepter l'invitation"
    | `Decline -> "Refuser"
end 
