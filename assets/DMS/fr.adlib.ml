| `DMS_Navbar -> "Documents"

| `DMS_AJAX_Feedback -> "Enregistré !"

| `DMS_Repos_Title -> "Bibliothèques de documents"
| `DMS_Repos_Empty -> "Aucune bibliothèque disponible"

| `DMS_NewRepo_Link -> "Nouvelle Bibliothèque"

| `DMS_NewRepo_Title -> "Nouvelle Bibliothèque"
| `DMS_NewRepo_Button -> "Créer"

| `DMS_Repo_Save -> "Enregistrer"

| `DMS_Repo_Field_Name   -> "Nom de la bibliothèque"
| `DMS_Repo_Field_Vision -> "Qui peut voir cette bibliothèque ?"
| `DMS_Repo_Field_Upload -> "Qui peut ajouter des documents ?"
| `DMS_Repo_Upload_Viewers -> "Tous les membres"
| `DMS_Repo_Upload_List -> "Une liste réduite de personnes"

| `DMS_Repo_Detail_Private -> "Uniquement les responsables"
| `DMS_Repo_Detail_Public -> "Tous les membres"
| `DMS_Repo_Field_Detail -> "Qui peut voir les détails des fichiers ?" 
| `DMS_Repo_Field_Remove -> "Qui peut supprimer un fichier ?"
| `DMS_Repo_Remove_Free -> "Tous les membres"
| `DMS_Repo_Remove_Restricted -> "Uniquement les responsables"

| `DMS_Field_Required -> "Champ obligatoire"

| `DMS_Repo_Empty  -> "Aucun document dans cette bibliothèque"
| `DMS_Repo_Upload -> "Nouveau document"

| `DMS_Repo_Admin_Link -> "Administration"
| `DMS_Repo_Admin_Title -> "Administration"

| `DMS_Repo_Edit_Title -> "Modifier"
| `DMS_Repo_Edit_Link -> "Modifier"
| `DMS_Repo_Edit_Sub -> "Changer le nom de cette bibliothèque"

| `DMS_Repo_Uploaders_Title -> "Contributeurs"
| `DMS_Repo_Uploaders_Link -> "Contributeurs"
| `DMS_Repo_Uploaders_Sub -> "Déterminer qui peut ajouter des documents à cette bibliothèque"

| `DMS_Repo_Uploaders_Label lbl -> begin match lbl with 
  | `Submit -> "Nommer contributeurs"
  | `Help -> "Les contributeurs peuvent ajouter des documents à une bibliothèque, ainsi que modifier et supprimer les documents qu'ils ont ajoutés. Voici la liste des contributeurs actuels : "
end

| `DMS_Repo_Admins_Title -> "Responsables"
| `DMS_Repo_Admins_Link -> "Responsables"
| `DMS_Repo_Admins_Sub -> "Déléguer les droits d'administration sur cette bibliothèque"

| `DMS_Repo_Admins_Label lbl -> begin match lbl with 
  | `Submit -> "Nommer responsables"
  | `Help -> "Les responsables d'une bibliothèque peuvent créer, modifier et supprimer tous les documents, et changer les options de la bibliothèque. Voici la liste des responsables actuels : "
end

| `DMS_Repo_Advanced_Title -> "Options Avancées"
| `DMS_Repo_Advanced_Link -> "Options Avancées"
| `DMS_Repo_Advanced_Sub -> "Configuration spécifique pour utilisateurs experts"

| `DMS_Repo_Delete_Title -> "Supprimer"
| `DMS_Repo_Delete_Link -> "Supprimer"
| `DMS_Repo_Delete_Sub -> "Détruire cette bibliothèque et ses documents"

| `DMS_Repo_Delete_Forbidden -> "Cette bibliothèque contient des documents, vous ne pouvez pas la supprimer."
| `DMS_Repo_Delete_Warning -> "La suppression d'une bibliothèque est définitive."
| `DMS_Repo_Delete_Submit -> "Supprimer"
| `DMS_Repo_Delete_Cancel -> "Ne pas supprimer"

| `DMS_NoUpload_Error -> "Impossible de créer un document."
| `DMS_NoUpload_Explain -> "Vérifiez que vous disposez des droits requis et d'espace disque libre."
| `DMS_NoUpload_Back -> "Retour"

| `DMS_Document_Edit -> "Modifier"
| `DMS_Document_Back -> "Retour"
| `DMS_Document_AddVersion -> "Nouvelle Version"
| `DMS_Document_Download -> "Télécharger"
| `DMS_Document_NoTask -> "Aucune tâche associée"
| `DMS_Document_NewTask -> "Nouvelle Tâche"
| `DMS_Document_EditTask -> "Modifier"
| `DMS_Document_TaskAssignee -> "Responsable"
| `DMS_Document_TaskNotified -> "En copie"

| `DMS_Document_Forbidden_Title -> "Page inaccessible"
| `DMS_Document_Forbidden_Problem -> "Vous ne pouvez pas afficher cette page parce qu'elle a été supprimée ou que vous ne disposez pas des droits suffisants."
| `DMS_Document_Forbidden_Solution -> "Vous pouvez demander à un administrateur de vous confier ces droits, ou essayer de créer un nouveau document"

| `DMS_Document_Admin_Title -> "Administration"

| `DMS_Document_Edit_Title -> "Modifier"
| `DMS_Document_Edit_Link -> "Modifier"
| `DMS_Document_Edit_Sub -> "Changer le nom et les méta-données de ce document"

| `DMS_Document_Share_Title -> "Partage"
| `DMS_Document_Share_Link -> "Partage"
| `DMS_Document_Share_Sub -> "Faire apparaître ce document dans d'autres bibliothèques"

| `DMS_Document_Delete_Title -> "Supprimer"
| `DMS_Document_Delete_Link -> "Supprimer"
| `DMS_Document_Delete_Sub -> "Retirer le document de cette bibliothèque"

| `DMS_Document_Edit_Name -> "Nom"
| `DMS_Document_Edit_Required -> "Champ obligatoire"
| `DMS_Document_Edit_Submit -> "Enregistrer"

| `DMS_Document_Delete_Warning -> "Ce document n'apparaîtra plus dans cette bibliothèque."
| `DMS_Document_Delete_Submit -> "Supprimer"
| `DMS_Document_Delete_Cancel -> "Ne pas supprimer"

| `DMS_DocTask_Create -> "Nouvelle Tâche"
| `DMS_DocTask_CreatePrelude -> "Quel type de tâche souhaitez-vous créer sur ce document ?"
| `DMS_DocTask_Edit -> "Modifier une tâche"
| `DMS_DocTask_Save -> "Enregistrer"

| `DMS_DocTask_Edit_State -> "Statut"
| `DMS_DocTask_Edit_Assigned -> "Affecté à" 
| `DMS_DocTask_Edit_Notified -> "En copie"

| `DMS_Atom_Filter -> "Documents"
| `DMS_SearchResult_Nature -> "Document"

| `DMS_DocTask_Mail_Title (kind,doc) -> begin 
  match kind with 
  | `State -> "Mise à jour - " ^ doc 
  | `AssignedSelf -> "Nouvelle tâche - " ^ doc
  | `Assigned -> "Nouveau responsable - " ^ doc
  | `NotifiedSelf -> "Nouvelle tâche - " ^ doc  
end

| `DMS_DocTask_Mail_Action kind -> begin 
  match kind with
  | `State -> "a mis à jour une tâche :"
  | `AssignedSelf -> "vous a nommé responsable d'une tâche :"
  | `Assigned -> "a nommé un nouveau responsable pour :"
  | `NotifiedSelf -> "vous met en copie d'une tâche : " 
end

| `DMS_DocTask_Mail_Body asso -> 
  !! "Cette tâche est associée à un document sur l'espace %s, cliquez sur le bouton ci-dessous pour plus d'informations." asso

| `DMS_DocTask_Mail_Button -> "Voir Détail"
