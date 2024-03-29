(* © 2012 RunOrg *)
open Common

module EntityName = struct

  let _       = adlib "EntityAdminOldName" ~old:"entity.admin-simple.name" "Administrateurs RunOrg"
  let admin   = adlib "EntityAdminName" ~old:"entity.admin.name" "Administrateurs RunOrg"
  let members = adlib "EntityMembersName" ~old: "entity.sample.group-simple.allmembers.name" "Tous les membres"

end

module Generic = struct

  let _ = adlib "Gender_Male" "Homme"
  let _ = adlib "Gender_Female" "Femme"
  let yes = adlib "Yes" "Oui"
  let no  = adlib "No"  "Non"

end

module ColumnName = struct

  let firstname = adlib "ColumnUserBasicFirstname" ~old:"column.user-basic.firstname" "Prénom"
  let lastname  = adlib "ColumnUserBasicLastname"  ~old:"column.user-basic.lastname" "Nom"
  let email     = adlib "ColumnUserBasicEmail"     ~old:"column.user-basic.email" "Email"
  let gender    = adlib "MemberFieldGender"        ~old:"member.field.gender" "Sexe"

  let _ = adlib "Birthdate" "Date de naissance"
  let _ = adlib "Phone" "Téléphone"
  let _ = adlib "Cellphone" "Téléphone portable"
  let _ = adlib "Address" "Adresse"
  let _ = adlib "Zipcode" "Code postal"
  let _ = adlib "City" "Ville"
  let _ = adlib "Country" "Pays"
  let _ = adlib "Gender" "Sexe"

end

module OldEntity = struct

  let access_copro = adlib "AccessCopro" 
    ~old: "entity.sample.access-copro.name" 
    "Accès propriétaires"
  
  let access_employes = adlib "AccessEmployes" 
    ~old: "entity.sample.access-employes.name" 
    "Accès gardiens / employés"
 
  let access_lodger = adlib "AccessLodger" 
    ~old: "entity.sample.access-lodger.name" 
    "Accès locataires"

  let access_manger_copro = adlib "AccessMangerCopro" 
    ~old: "entity.sample.access-manger-copro.name" 
    "Accès gestionnaires"

  let ag_members = adlib "AgMembers" 
    ~old: "entity.sample.ag.members" 
    "Membres"

  let contact = adlib "Contact" 
    ~old: "entity.sample.contact.name" 
    "Contacts"

  let course_12sessions = adlib "Course12Sessions" 
    ~old: "entity.sample.course-12sessions.name" 
    "Exemple de cours avec 12 séances"

  let _ = adlib "EntitySampleCourseSimpleName" 
    "Exemple de cours dans RunOrg"

  let course_simple = adlib "CourseSimple" 
    ~old: "entity.sample.course-simple.name" 
    "Exemple de cours dans RunOrg"
    
  let event_ag = adlib "EventAg" 
    ~old: "entity.sample.event-ag.name" 
    "Exemple d'AG dans RunOrg"

  let _ = adlib "EntitySampleEventAgName" 
    "Exemple d'AG dans RunOrg"

  let event_campaign_action = adlib "EventCampaignAction" 
    ~old: "entity.sample.event-campaign-action.sample" 
    "Sympathisants du secteur Exemple"

  let event_campaign_action2 = adlib "EventCampaignAction2" 
    ~old: "entity.sample.event-campaign-action2.sample" 
    "Exemple d'opération militante"

  let event_campaign_meeting = adlib "EventCampaignMeeting" 
    ~old: "entity.sample.event-campaign-meeting.sample" 
    "Exemple de réunion électorales publique"

  let event_clubbing = adlib "EventClubbing" 
    ~old: "entity.sample.event-clubbing.name" 
    "Exemple de soirée"

  let _ = adlib "EntitySampleEventCoproMeetingName" 
    "Exemple de Conseil syndical"

  let event_copro_meeting = adlib "EventCoproMeeting" 
    ~old: "entity.sample.event-copro-meeting.name" 
    "Exemple de Conseil syndical"

  let event_meeting_comite_ent = adlib "EventMeetingComiteEnt" 
    ~old: "entity.sample.event-meeting.comite-ent.name" 
    "Comité d'entreprise"

  let _ = adlib "EntitySampleEventSimpleName" 
    "Exemple d'évènement dans RunOrg"

  let event_simple = adlib "EventSimple" 
    ~old: "entity.sample.event-simple.name" 
    "Exemple d'évènement dans RunOrg"
 
  let forum_public_classified = adlib "ForumPublicClassified" 
    ~old: "entity.sample.forum-public.classified.name" 
    "Petites annonces"

  let forum_public_jobs_sport = adlib "ForumPublicJobsSport" 
    ~old: "entity.sample.forum-public.jobs-sport.name" 
    "Offres et demandes d'emplois"

  let forum_public_user_support = adlib "ForumPublicUserSupport" 
    ~old: "entity.sample.forum-public.user-support.name" 
    "Utilisation de RunOrg"

  let group_cheerleading = adlib "GroupCheerleading" 
    ~old: "entity.sample.group-cheerleading.name" 
    "Cheerleaders"

  let group_collaborative_campaign_comity = adlib "GroupCollaborativeCampaignComity" 
    ~old: "entity.sample.group-collaborative.campaign-comity.sample" 
    "Comité de campagne"

  let group_collaborative_campaign_members = adlib "GroupCollaborativeCampaignMembers" 
    ~old: "entity.sample.group-collaborative.campaign-members.sample" 
    "Militants"

  let group_collaborative_campaign_sympathisers = adlib "GroupCollaborativeCampaignSympathisers" 
    ~old: "entity.sample.group-collaborative.campaign-sympathisers.sample" 
    "Sympathisants"

  let group_collaborative_collectivites_agent = adlib "GroupCollaborativeCollectivitesAgent" 
    ~old: "entity.sample.group-collaborative.collectivites-agent.name" 
    "Agents"

  let group_collaborative_collectivites_conseillers_municipaux = adlib "GroupCollaborativeCollectivitesConseillersMunicipaux" 
    ~old: "entity.sample.group-collaborative.collectivites-conseillers-municipaux.name" 
    "Conseillers municipaux"

  let group_collaborative_collectivites_dep_culture = adlib "GroupCollaborativeCollectivitesDepCulture" 
    ~old: "entity.sample.group-collaborative.collectivites-dep-culture.name" 
    "Service culturel"

  let group_collaborative_collectivites_dep_sport = adlib "GroupCollaborativeCollectivitesDepSport" 
    ~old: "entity.sample.group-collaborative.collectivites-dep-sport.name" 
    "Service des sports"

  let group_collaborative_collectivites_manager = adlib "GroupCollaborativeCollectivitesManager" 
    ~old: "entity.sample.group-collaborative.collectivites-manager.name" 
    "Responsables de service"

  let group_collaborative_collectivites_mayor = adlib "GroupCollaborativeCollectivitesMayor" 
    ~old: "entity.sample.group-collaborative.collectivites-mayor.name" 
    "Cabinet du maire"

  let group_collaborative_comite_ent_employees = adlib "GroupCollaborativeComiteEntEmployees" 
    ~old: "entity.sample.group-collaborative.comite-ent-employees.name" 
    "Salariés"

  let group_collaborative_comite_ent_managers = adlib "GroupCollaborativeComiteEntManagers" 
    ~old: "entity.sample.group-collaborative.comite-ent-managers.name" 
    "Elus du CE"

  let group_collaborative_company_employees = adlib "GroupCollaborativeCompanyEmployees" 
    ~old: "entity.sample.group-collaborative.company-employees.name" 
    "Salariés"

  let group_collaborative_company_management = adlib "GroupCollaborativeCompanyManagement" 
    ~old: "entity.sample.group-collaborative.company-management.name" 
    "Direction & management"

  let group_collaborative_company_training_trainees = adlib "GroupCollaborativeCompanyTrainingTrainees" 
    ~old: "entity.sample.group-collaborative.company-training-trainees.name" 
    "Stagiaires"
 
 let group_collaborative_company_training_trainers = adlib "GroupCollaborativeCompanyTrainingTrainers" 
   ~old: "entity.sample.group-collaborative.company-training-trainers.name" 
   "Formateurs"

  let group_collaborative_copro = adlib "GroupCollaborativeCopro" 
    ~old: "entity.sample.group-collaborative.copro.name" 
    "Membres du syndic"

  let group_collaborative_federation_clubs_asso = adlib "GroupCollaborativeFederationClubsAsso" 
    ~old: "entity.sample.group-collaborative.federation-clubs-asso.name" 
    "Clubs & associations affiliés"

  let group_collaborative_federation_comite = adlib "GroupCollaborativeFederationComite" 
    ~old: "entity.sample.group-collaborative.federation-comite.name" 
    "Comité directeur"
 
  let group_collaborative_federation_dtn = adlib "GroupCollaborativeFederationDtn" 
    ~old: "entity.sample.group-collaborative.federation-dtn.name" 
    "Direction technique nationale"

  let group_collaborative_federation_presidents = adlib "GroupCollaborativeFederationPresidents" 
    ~old: "entity.sample.group-collaborative.federation-presidents.name" 
    "Présidents de clubs et d'asso"

  let group_collaborative_federation_structure = adlib "GroupCollaborativeFederationStructure" 
    ~old: "entity.sample.group-collaborative.federation-structure.name" 
    "Structure fédérale"

  let group_collaborative_mda_member_asso = adlib "GroupCollaborativeMdaMemberAsso" 
    ~old: "entity.sample.group-collaborative.mda-member-asso.name" 
    "Membres d'associations"

  let group_collaborative_mda_resp_asso = adlib "GroupCollaborativeMdaRespAsso" 
    ~old: "entity.sample.group-collaborative.mda-resp-asso.name" 
    "Responsables d'associations"

  let group_collaborative_mda_resp_commune = adlib "GroupCollaborativeMdaRespCommune" 
    ~old: "entity.sample.group-collaborative.mda-resp-commune.name" 
    "Responsables municipaux"

  let group_collaborative_mda_team = adlib "GroupCollaborativeMdaTeam" 
    ~old: "entity.sample.group-collaborative.mda-team.name" 
    "Equipe de la MDA"

  let group_collaborative_office = adlib "GroupCollaborativeOffice" 
    ~old: "entity.sample.group-collaborative.office.name" 
    "Bureau et administrateurs de l'association"

  let group_collaborative_staff = adlib "GroupCollaborativeStaff" 
    ~old: "entity.sample.group-collaborative.staff.name" 
    "Staff"

  let group_copro_employes = adlib "GroupCoproEmployes" 
    ~old: "entity.sample.group-copro-employes.name" 
    "Gardiens / employés"

  let group_copro_lodger = adlib "GroupCoproLodger" 
    ~old: "entity.sample.group-copro-lodger.name" 
    "Locataires"

  let group_copro_manager = adlib "GroupCoproManager" 
    ~old: "entity.sample.group-copro-manager.name" 
    "Gestionnaires"

  let group_copro_owner = adlib "GroupCoproOwner" 
    ~old: "entity.sample.group-copro-owner.name" 
    "Propriétaires"

  let group_fitness_members = adlib "GroupFitnessMembers" 
    ~old: "entity.sample.group-fitness-members.name" 
    "Sportifs"

  let group_footus = adlib "GroupFootus" 
    ~old: "entity.sample.group-footus.name" 
    "Joueurs football américain"

  let group_judo_members = adlib "GroupJudoMembers" 
    ~old: "entity.sample.group-judo-members.name" 
    "Sportifs judo et jujitsu"

  let _ = adlib "EntitySamplePetitionName" 
    "Exemple de pétition"

  let petition = adlib "Petition" 
    ~old: "entity.sample.petition.name" 
    "Exemple de pétition"

  let poll_yearly = adlib "PollYearly" 
    ~old: "entity.sample.poll-yearly.name" 
    "Bilan de l'année 2010-2011"

  let group_benjamins = adlib "GroupBenjamins" 
    ~old: "entity.sample.sport.group-benjamins.name" 
    "Benjamins"

  let group_cadets = adlib "GroupCadets" 
    ~old: "entity.sample.sport.group-cadets.name" 
    "Cadets"

  let group_juniors = adlib "GroupJuniors" 
    ~old: "entity.sample.sport.group-juniors.name" 
    "Juniors"

  let group_minimes = adlib "GroupMinimes" 
    ~old: "entity.sample.sport.group-minimes.name" 
    "Minimes"

  let group_petitssamourais = adlib "GroupPetitssamourais" 
    ~old: "entity.sample.sport.group-petitssamourais.name" 
    "Petits samouraïs"
 
  let group_poussinets = adlib "GroupPoussinnets" 
    ~old: "entity.sample.sport.group-poussinnets.name" 
    "Poussinets"

  let group_poussins = adlib "GroupPoussins" 
    ~old: "entity.sample.sport.group-poussins.name" 
    "Poussins"

  let group_seniors = adlib "GroupSeniors" 
    ~old: "entity.sample.sport.group-seniors.name" 
    "Séniors"

  let group_veterans = adlib "GroupVeterans" 
    ~old: "entity.sample.sport.group-veterans.name" 
    "Vétérans"

  let _ = adlib "EntitySampleSubscribtionForeverName" 
    "Adhésion permanente"
 
  let subscribtion_forever = adlib "SubscribtionForever" 
   ~old: "entity.sample.subscribtion-forever.name" 
   "Adhésion permanente"

  let _ = adlib "EntitySampleSubscriptionDatetodateName" 
    "Adhésion annuelle 2011-2012"
 
  let subscription_datetodate = adlib "SubscriptionDatetodate" 
    ~old: "entity.sample.subscription-datetodate.name" 
    "Adhésion annuelle 2011-2012"

  let _ = adlib "EntitySampleSubTestRunorgName" 
    "Adhésion pour tester RunOrg"
 
  let sub_test_runorg = adlib "SubTestRunorg" 
    ~old: "entity.sample.sub-test-runorg.name" 
    "Adhésion pour tester RunOrg"
end
