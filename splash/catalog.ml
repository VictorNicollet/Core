open Common
open WithSections 

let page url title list =
  let url = "/catalog"^url in
  page url title 
    ~section:"catalog"
    ~head:"catalog"
    ~subsection:url 
    list

(* Gestion des photos
Pour uniformiser la taille des images
exporter depuis flickr en 500x333
paint : réduir à 93%
puis découper à : 465x270 *)

let default_price_asso = 
	composite `LR
	(price
    		"Gratuit"
    		"pour les associations"
   		"de moins de 100 adhérents")
	(bullets
	   ~title:"La plateforme la plus complète"
	   ~subtitle:"Tous les outils utiles regroupés dans un même espace"
	   ~ordered:false
	   [ "Communication interne via l'espace membre" ;
	     "Communication externe via le site Internet" ;
	     "Outils de gestion et d'organisation collaboratifs" ;
	     "Hébergement, mises à jour et maintenance informatique" ])

let plateforme_complete =
	(bullets
	   ~title:"La plateforme la plus complète"
	   ~subtitle:"Tous les outils utiles regroupés dans un même espace"
	   ~ordered:false
	   [ "Communication interne via l'espace membre" ;
	     "Communication externe via le site Internet" ;
	     "Outils de gestion et d'organisation collaboratifs" ;
	     "Hébergement, mises à jour et maintenance informatique" ]) 	

let technologie_accessible_collectivites =
        (pride
	   ~title:"La technologie accessible"
	   ~subtitle:"L'offre la plus économique du marché"
	   ~link:("/collectivites/pricing",
		  "Tarifs des offres") 
	   "Nous vous offrons un outil à la pointe, adaptable et évolutif. 
	   
	   Opter pour une solution déjà existante et en ligne est un choix économiquement plus judicieux et plus sûr que de développer ou faire développer sa solution. 
	   
	   Vous êtes dès maintenant en mesure d'évaluer la qualité de l'outil et notre offre tarifaire claire vous permet de connaître précisément les coûts annuels, sans surprise. " ) 

let technologie_accessible_entreprises =
        (pride
	   ~title:"La technologie accessible"
	   ~subtitle:"L'offre la plus économique du marché"
	   ~link:("/entreprises/pricing",
		  "Tarifs des offres") 
	   "Nous vous offrons un outil à la pointe, adaptable et évolutif. 
	   
	   Opter pour une solution déjà existante et en ligne est un choix économiquement plus judicieux et plus sûr que de développer ou faire développer sa solution. 
	   
	   Vous êtes dès maintenant en mesure d'évaluer la qualité de l'outil et notre offre tarifaire claire vous permet de connaître précisément les coûts annuels, sans surprise. " ) 

(* -------------------- ASSOCIATIONS ------------------- *)
(* NEW ITEM------------------- *)
let associations_standard_title =
	composite `LR
	(pride ~title:"Configuration standard" "Une configuration généraliste adaptée à toutes les associations")
	(create "Simple")

(* NEW ITEM------------------- *)
let associations_students_title =
	composite `LR
	(pride ~title:"Associations étudiantes" "Pour les BDE, les BDA, les BDS et toutes les associations étudiantes")
	(create "Students")
let associations_students_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/gaetan_z/6853069363/",
		       "GaetanZFSHN")
	   "/public/img/preconf_students.jpg")
	(features [ 
	  "Point fort",
	  "Créez et animez facilement le réseau social privé de votre association étudiante" ;
	    
	  "Idéal pour...",
	  "Organiser vos soirées et partager ensuite les photos entre vous. Gérer l'inscription en ligne de vos membres" ;
	  
	  "Egalement pensé pour...",
	  "Equiper vos projets et vos commissions d'un outil qui leur permettra d'agir plus efficacement." ])  
let associations_students_desc_b =	
	ribbon ( important
		"Ils vont parler de vous !"
		"Offrez à vos étudiants le réseau social privé qu’ils attendent de leur asso et de leur école")
let associations_students_desc_c =
	(pride 
	   ~title:"Le réseau privé de votre asso"
	   "Notre solution dédiée aux associations étudiantes (BDE, BDA, BDS, etc.) vous permet d'équiper votre asso d'un outil de communication et d’organisation complet et puissant. Vous organisez en quelques minutes vos évènements et soirées, offrez des espaces de discussions et d’échanges privés (fini les photos sur Internet !), équipez vos clubs et projets. Cet espace en ligne devient le site communautaire pour organiser votre asso et pour tous vos étudiants.

De plus, vous gagnez du temps car vous profitez des facilités de vos étudiants et vos bénévoles à communiquer via les réseaux sociaux pour alléger considérablement vos tâches administratives et logistiques"	) 

(* NEW ITEM------------------- *)
let associations_ess_title =
	composite `LR
	(pride ~title:"Associations de l'ESS" "Pour toutes les associations de l'économie sociale et solidaire")
	(create "Ess")
let associations_ess_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/leo-gruebler/6347903993/",
		       "Leo Gruebler")
	   "/public/img/preconf_ess.jpg")
	(features [ 
	  "Point fort",
	  "Communiquez, organisez et mobilisez depuis un seul et même espace" ;
	    
	  "Idéal pour...",
	  "Mobiliser très rapidement tous les membres pour une action commune et pour communiquer de manière transversale" ;
	  
	  "Egalement pensé pour...",
	  "- Travailler de manière collaborative sur des idées ou des actions  - Garder confidentiel les échanges entre les membres" ])  
let associations_ess_desc_b =
	(pride 
	   ~title:"L'ESS a enfin son outil !"
	   "La solution dédiée aux Associations de l'Economie Sociale et Solidaire (ESS) est conçue pour les aider à s'organiser au mieux dans un environnement démocratique et collaboratif.

Les membres s'organisent autour de projets, de thèmes ou encore d'actions. Chacun des groupes ainsi constitué peut avancer sur ses sujets sans interférer avec la communication globale au sein de l'association.  Les membres ont néanmoins accès à tous les sujets qui les intéressent et peuvent apporter leur contribution.

RunOrg Association Economie Sociale et Solidaire vous offre une solution clef en main, ludique et efficace pour organiser vos activités et vos actions. De plus vous bénéficiez de tous les autres points forts de RunOrg pour la gestion de vos membres."	)  

(* NEW ITEM------------------- *)
let associations_impro_title =
	composite `LR
	(pride ~title:"Troupes et clubs d'Improvisation" "Spécialement créé pour les troupes et les clubs pratiquant le théâtre d'improvisation")
	(create "Impro") 
let associations_impro_desc_a =	
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/cyberuly/5370448834/",
		       "Cyberuly")
	   "/public/img/preconf_impro.jpg")
	(features [ 
	  "Points forts",
	  "Facilite l'organisation des activités (matchs et entraînements) en permettant de récupérer les disponibilités des joueurs" ;
	    
	  "Idéal pour...",
	  "Organiser les matchs et les spectacles grâce aux modèles d'activités dédiés" ;
	  
	  "Déjà utilisé par...",
	  "Les fondateurs de RunOrg et leur troupe d'impro ! (Donc nous prenons grand soin de cette solution !)"])  
let associations_impro_desc_b =
	(pride 
	   ~title:"N'improvisez plus l'organisation !"
	   "La solution Théâtre d'improvisation de RunOrg vous permet de bénéficier d'une solution créée spécialement pour répondre aux besoins des troupes d'improvisation professionnelles ou amateures. 

Cette solution a été pensée pour vous aider dans l'organisation de vos matchs, de vos spectacles et de vos entraînements.

En un seul endroit vous centralisez les informations sur vos joueurs, les entraînements, les cotisations, les spectacles, les matchs, les supporteurs. De plus les modèles RunOrg pour le théâtre d'improvisation vous permettent de bénéficier de check listes pour faciliter l'organisation de vos événements.

Jamais organiser un spectacle, inviter votre public et partager ensuite les photos n'a été aussi simple. Tout cela dans l'environnement sécurisé RunOrg." 	) 

(* NEW ITEM------------------- *)
let associations_multisports_title =
	composite `LR
	(pride ~title:"Clubs multi-sports" "Une solution adaptée au fonctionnement des clubs multi-sports")
	(create "MultiSports")
let associations_multisports_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/loozrboy/3024154654/",
		       "Loozrboy")
	   "/public/img/preconf_multisports.jpg")
	(features [ 
	  "Point forts",
	  "Permet de gérer tous les sports de son club en utilisant un seul outil" ;
	    
	  "Idéal pour...",
	  "Gérer plusieurs sports au sein d'un même club et offrir à chacun un espace d'organisation indépendant" ;
	  
	  "Egalement pensé pour...",
	  "Offrir des formulaires d'inscription différenciés pour chacun des sports (inclus et mis à jour)" ])  
let associations_multisports_desc_b =	
	(pride 
	   ~title:"Votre intranet organisé par activités"
	   "La solution Club multi-sports de RunOrg vous permet de bénéficier d'un intranet conçu pour répondre aux nombreux et complexes besoins des clubs offrant plusieurs sports à leurs membres. 

Cette solution vous permet de bénéficier depuis une seul espace de tous les formulaires sportifs créés pour les sports déjà préconfigurés dans RunOrg. Elle vous permet d’offrir à vos différentes disciplines des espaces dédiés dans lesquels les membres vont pouvoir communiquer et s’organiser. Elle prend en compte qu’un membre peut participer à plusieurs sports et permet de gérer des adhésions différenciées selon les sports.

RunOrg Clubs multi-sports vous offre une solution clef en main, ludique et efficace pour gérer les activités, les évènements et les différentes structures sportives au sein de votre club. De plus vous bénéficiez de tous les autres points forts de RunOrg pour la gestion d’une communauté en ligne. " 	)  

(* NEW ITEM------------------- *)
let associations_judo_title =
	composite `LR
	(pride ~title:"Clubs de Judo et Jujitsu" "Solution conçue avec des entraîneurs et des clubs de haut niveau")
	(create "Judo")
let associations_judo_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/parrhesiastes/",
		       "Parrhesiastes")
	   "/public/img/preconf_judo.jpg")
	(features [ 
	  "Points forts",
	  "Facilite la communication au sein du club et les tâches administratives des responsables" ;
	    
	  "Idéal pour...",
	  "Gérer les inscriptions, organiser les compétitions, communiquer avec les sportifs ou leurs parents" ;

	  "Modèles et groupes inclus",
	  "Formulaires d'inscription, classification par âge de judo, compétition de judo"])
let associations_judo_desc_b =
	(pride 
	   ~title:"Plus qu'un outil : une communauté"
	   "La solution RunOrg pour les clubs de judo et jujitsu a été conçue en se basant sur les besoins et les conseils de clubs de judo évoluant au plus haut niveau. Son objectif est de faciliter l'organisation des entraînements et des compétitions et de mettre en avant les valeurs du club et du judo.

Grâce à son formulaire spécial judo et jujitsu (comportant les ceintures réglementaires, les dans et les questions relatives aux judokas) et la livraison en standard des groupes de niveau du judo (du petit samouraï au vétéran), vous disposez d'une solution déjà complètement personnalisée aux besoins des clubs de judo et jujitsu.

Offrez à votre club l'espace communautaire en ligne qui va pouvoir être utilisé pour faciliter sa communication et son organisation, mais aussi renforcer ses valeurs et la cohésion de ses membres." 	)  

(* NEW ITEM------------------- *)
let associations_badminton_title =
	composite `LR
	(pride ~title:"Clubs de Badminton" "Solution élaborée avec le concours de la Fédération Française de Badminton")
	(create "Badminton")
let associations_badminton_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/cdianne/2725181343/",
		       "Dee'lite")
	   "/public/img/preconf_badminton.jpg")
	(features [ 
	  "Point fort",
	  "Gestion du loisir et du haut niveau en lien avec la FFBAD" ;

	  "Modèles et groupes inclus",
	  "Compétition de badminton, formulaire d'inscription badminton, groupes pour le loisir, la compétition et les entraîneurs ";	
	  
	  "Déjà utilisé par...",
	  "Les clubs affiliés à la Fédération Française de Badminton"	])  
let associations_badminton_desc_b =	
	ribbon ( important
		"Solution approuvée par la FFBAD"
		"") 
let associations_badminton_desc_c =
      composite `LR
	(image "/public/img/preconf_badminton_logo_ffbad.jpg")
	(pride
	   ~title:"Portail clubs de la FFBAD"
	   ~subtitle:"Bientôt disponible"
	   ~link:("/http://www.ffbad.org",
	       "Site de la FFBAD")
	   "La FFBAD met à la disposition exclusive de ses clubs affiliés des espaces privés spécialement adaptés au badminton. 
	   Ces espaces sont hébergés sous le nom de domaine de la fédération, disposent des couleurs de la FFBAD, et fourniront des services exclusifs aux clubs affiliés."	) 

(* NEW ITEM------------------- *)
let associations_footus_title =
	composite `LR
	(pride ~title:"Clubs de Football US & cheerleading" "Solution utilisée par un club évoluant en ELITE")
	(create "Footus") 
let associations_footus_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/virtualsugar/3967883513/",
		       "Monica's Dad")
	   "/public/img/preconf_footus.jpg")
	(features [ 
	  "Point fort",
	  "De l'inscription des membres à l'organisation des matchs dans un seul outil." ;
	    
	  "Idéal pour...",
	  "Motiver les joueurs et communiquer sur les résultats !" ;
	  
	  "Modèles et groupes inclus",
	  "Groupes des niveaux officiels, formulaires d'inscription Football US et cheerleading"]) 
let associations_footus_desc_b =
	(pride 
	   ~title:"Conçu avec les meilleurs"
	   "La solution RunOrg pour les clubs de football américain et cheerleading a été conçue en se basant sur les besoins et les conseils de clubs évoluant au plus haut niveau. Son objectif est de faciliter l'organisation des entraînements et des compétitions et de mettre en avant les valeurs du club.

Grâce à ses formulaires spéciaux football américain et cheerleading (comportant notamment les positions)  vous disposez d'une solution déjà personnalisée aux besoins des clubs football américain et cheerleading.

Offrez à votre club l'espace communautaire en ligne qui va pouvoir être utilisé pour faciliter sa communication et son organisation, mais aussi renforcer ses valeurs et la cohésion de ses membres.") 

(* NEW ITEM------------------- *)
let associations_athle_title =
	composite `LR
	(pride ~title:"Clubs d'Athlétisme" "Solution complète intégrant la gestion des disciplines")
	(create "Athle")
let associations_athle_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/virtualsugar/3967883513/",
		       "GiÃ¥m")
	   "/public/img/preconf_athle.jpg")
	(features [ 
	  "Point fort",
	  "Gérer er organiser les différentes disciplines et leurs sportifs n'a jamais été aussi simple" ;
	    
	  "Idéal pour...",
	  "Différencier la communication et l'organisation des activités par discipline" ;
	  
	  "Egalement pensé pour...",
	  "Offrir aux sportifs et leurs parents un lieu d'échanges et de conseils."]) 

(* NEW ITEM------------------- *)
let associations_sallesport_title =
	composite `LR
	(pride ~title:"Salle de sport et coaching sportif" "Solution développée en collaboration avec un coach sportif et un gestionnaire de salle de sport")
	(create "SalleSport")    
let associations_sallesport_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/abraj/181196330/",
		       "Abdullah AL-Naser")
	   "/public/img/preconf_sallesport.jpg")
	(features [ 
	  "Points forts",
	  "Personnalisation du suivi des sportifs" ;
	    
	  "Idéal pour...",
	  "Organiser les activités et les suivis avec plusieurs sportifs et entraîneurs " ;
	 	  
	  "Modèles et groupes inclus",
	  "Cours incluant les objectifs, modèles de bilan sportifs, formulaires d'inscription détaillés"	]) 
let associations_sallesport_desc_b =
	(pride 
	   ~title:"Personnalisez le suivi des sportifs"
	   "La solution de RunOrg dédiée aux salles de sport et aux coachs sportifs est conçue pour les aider à s'organiser au mieux pour répondre aux besoins et attentes des sportifs qu'ils entraînent. 

Même dans un environnement avec plusieurs profs, les sportifs bénéficient d'un suivi personnalisé et centralisé de leurs activités, de leurs cours et de leur progression. Ils disposent en plus d'un espace d'échange privilégié avec leurs entraîneurs et leurs conseillers. Vous proposez à vos sportifs de rejoindre des groupes (intérêts, cours, etc.) dans lesquels ils vont pouvoir communiquer. Des modèles vous permettent de réaliser des bilans réguliers de leurs performances.

RunOrg Salles de sport et coaching sportif vous offre une solution clef en main, ludique et efficace pour organiser vos activités et vos actions. De plus vous bénéficiez de tous les autres points forts de RunOrg pour la gestion de vos membres."	) 

(* NEW ITEM------------------- *)
let associations_sports_title =
	composite `LR
	(pride ~title:"Autres clubs de sports" "Solution standard pour les clubs de sports n'ayant pas encore de configuration dédiée")
	(create "Sports")  
let associations_sports_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/zachd1_618/6724055197/",
		       "Zach Dischner")
	   "/public/img/preconf_sports.jpg")
	(features [ 
	  "Point fort",
	  "Adapté à la plupart des besoins des clubs de sports" ;
	    
	  "Idéal pour...",
	  "Communiquer et organiser l'activité de son club" ;

	  "Modèles et groupes inclus",
	  "Groupes de niveaux"]) 
let associations_sports_desc_b =	
	ribbon ( important
		"Contactez-nous !"
		"La solution pour votre sport n'existe pas encore ?
		Contactez-nous pour toutes informations supplémentaires pour que nous la construisions ensemble !")
let associations_sports_desc_c =
	(pride 
	   ~title:"Adapté à la plupart des sports !"
	   ~link:("/contact",
	       "Contactez-nous !")
	   "La solution Clubs de sports de RunOrg vous permet de bénéficier d'un intranet créé pour s'adapter à un très grand nombre de cas et de besoins de clubs de sports.

Cette solution peut très facilement s’adapter pour répondre aux besoins de tous les sports dans le cadre de club mono-sport. Elle incorpore en standard les catégories sportives les plus utilisées. Sa prise en main rapide vous permet de l'adopter très rapidement.

C'est cette configuration que nous vous conseillons s’il n’existe pas encore de préconfiguration dédiée à votre sport. De plus, nous pourrons vous « migrer » gratuitement vers celle conçue pour votre sport dès qu’elle sera disponible. 

N’hésitez pas à nous contacter pour nous aider à concevoir la solution pour votre sport !"	)

(* NEW ITEM------------------- *)
let associations_federations_title =
	composite `LR
	(pride ~title:"Fédérations" "Solution standard pour organiser en ligne la structure fédérale des fédérations.")
	(contact_demo)   
let associations_federations_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/-cavin-/2366764272/",
		       "Cаvin")
	   "/public/img/preconf_federations.jpg")
	(features [ 
	  "Point fort",
	  "Un réseau social d'association pour votre fédération" ;
	    
	  "Idéal pour...",
	  "Centraliser et organiser la communication des commissions" ;
	  
	  "Egalement pensé pour...",
	  "Fournir un espace de travail pour les salariés, communiquer avec les responsables des clubs affiliés"])  
let associations_federations_desc_b =
	(pride 
	   ~title:"Un outil pour toute votre fédération"
	   "Disposez d’un outil qui permet à la fois de gérer la communication et l’organisation de la structure fédérale tout en étant ouvert vers les clubs et associations rattachées.

De plus, nous pouvons paramétrer une solution spécialement pour l’ensemble de vos clubs et associations (un partenariat est alors mis en place : contactez-nous pour en savoir plus).

RunOrg vous permet de bénéficier d’un outil moderne de communication et de gestion des membres et des activités comportant toutes les fonctionnalités attendues pour gérer efficacement une communauté (annuaire en ligne, partage de photos et de documents, organisation de réunion, sondages, fiches d’inscription, etc.)" 	) 
let associations_federations_desc_c =
       (bullets
	   ~title:"De nombreuses possibilités"
	   ~subtitle:"Il existe plusieurs options RunOrg pour les fédérations :"
	   ~ordered:false
	   [ "Utiliser l’outil uniquement pour votre structure fédérale" ;
	     "Utiliser l’outil pour votre structure fédérale et l’ouvrir à vos clubs et associations affiliés" ;
	     "Recommander la solution préconfigurée RunOrg à vos clubs et associations" ;
	     "Créer un espace commun pour votre fédération et tous les clubs et associations affiliés" ] 	) 

(* NEW ITEM------------------- *)
let associations_tennis_title =
	composite `LR
	(pride ~title:"Clubs de Tennis" "Solution loisir et compétition élaborée avec des clubs de tennis")
	(create "Tennis")
let associations_tennis_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/",
		       "")
	   "/public/img/preconf_tennis.jpg")
	(features [ 
	  "Point fort",
	  "Gestion du loisir et du haut niveau" ;

	  "Modèles et groupes inclus",
	  "Formulaire d'inscription personnalisé pour le tennis, groupes pour le loisir, la compétition et les entraîneurs ";	
	  
	  "Egalement pensé pour...",
	  "La gestions des cours enfants et adultes, et la fidélisation des adhérents"	])  

(* -------------------- COLLECTIVITES ------------------- *)
(* NEW ITEM------------------- *)
let collectivite_all_title =
	composite `LR
	(pride ~title:"Mairies et collectivités territoriales" "Solution dédiée aux mairies, communautés de communes et autres collectivités territoriales")
	(contact_demo) 
let collectivite_all_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/26700188@N05/5633798012/",
		       "Besopha")
	   "/public/img/preconf_collectivites.jpg")
	(features [ 
	  "Point fort",
	  "Modernisation de la communication sans modification de l'organisation" ;
	    
	  "Idéal pour...",
	  "Faciliter la communication inter-service, notamment autour de projets ou d'évènements" ;
	  
	  "Egalement pensé pour...",
	  "Déléguer aux responsables la gestion de l'espace dédié à leur service, offrir un espace communication pour les élus"	])  
let collectivite_all_desc_b =
	(pride 
	   ~title:"L'outil s'adapte à votre organisation"
	   "Pour les collectivités territoriales, nous proposons un intranet collaboratif qui s’adapte à leur organisation existante et à un prix très compétitif.
 
Tous les agents ont accès à un espace privé et sécurisé qui centralise la communication interne. Les différents services disposent d’espaces privés, dont l’administration peut être déléguée aux responsables.

Les services disposent d'un annuaire en ligne, d'un agenda partagé des évènements et des réunions, de la possibilité d'échanger de manière sécurisé des documents, et de les partager au sein de groupes restreints.")  

(* NEW ITEM------------------- *)
let collectivites_localnpportal_title =
	composite `LR
	(pride ~title:"Portail associatif communal" "Dotez gratuitement votre commune d'un outil pour organiser efficacement ses associations")
	(contact_demo)   
let collectivites_localnpportal_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/mattymatt/4821997419/",
		       "Mattymatt")
	   "/public/img/preconf_localnpportal.jpg")
	(features [ 
	  "Point fort",
	  "Gestion et organisation de la vie associative de la commune" ;
	    
	  "Idéal pour...",
	  "Coordonner les actions avec les responsables associatifs et les élus" ;
	  
	  "Egalement pensé pour...",
	  "Offrir des espaces privés pour les associations, permettre aux élus de communiquer avec les responsables associatifs" ]) 
let collectivites_localnpportal_desc_b =
	(pride 
	   ~title:"Le portail associatif de votre commune"
	   "Communiquez avec les responsables associatifs de votre commune et offrez à leurs associations un espace numérique pour améliorer et sécuriser leurs échanges.

RunOrg Portail associatif vous permet d’offrir aux associations de votre commune un espace privé en ligne dans lequel elles vont pouvoir communiquer et échanger (photos, documents, activités, évènements, sondages, etc.) avec leurs membres. De plus, grâce à cet espace, vous pourrez très facilement communiquer avec les responsables de ces associations et coordonner les évènements inter-associations.

Vous disposez d’un annuaire des responsables associatifs de votre commune, d’un agenda à jour des activités et des évènements des associations de votre commune, d’un moyen simple de communication vers les responsables et les personnes engagés. De plus, ce portail vous permet d’offrir à vos associations la possibilité d’inscrire leurs membres en ligne." 	) 

(* NEW ITEM------------------- *)
let collectivites_maisonasso_title =
	composite `LR
	(pride ~title:"Maisons des associations" "Equipez gratuitement votre MDA d'un outil pour accompagner et animer facilement ses associations")
	(contact_demo)  
let collectivites_maisonasso_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/papalars/3250085382/",
		       "Papalars")
	   "/public/img/preconf_maisonasso.jpg")
	(features [ 
	  "Point fort",
	  "Gestion et organisation de la vie associative et des activités" ;
	    
	  "Idéal pour...",
	  "Coordonner les actions avec les responsables associatifs et mettre en avant les services de la MDA" ;
	  
	  "Egalement pensé pour...",
	  "Offrir des espaces privés pour les associations, permettre aux responsables associatifs de communiquer entre eux" ]) 
let collectivites_maisonasso_desc_b =
	ribbon ( important
		"Solution approuvée par le RNMA"
		"(Réseau National des Maisons des Associations)") 
let collectivites_maisonasso_desc_c =
	(pride 
	   ~title:"Votre outil au service des associations"
	   "Communiquez avec les responsables associatifs de votre commune et offrez à leurs associations un espace numérique pour améliorer et sécuriser leurs échanges. RunOrg permet également à votre Maison des associations de s'équiper d'un intranet pour ses agents.

RunOrg Maison des associations vous permet d’offrir aux associations de votre commune un espace privé en ligne dans lequel elles vont pouvoir communiquer et échanger (photos, documents, activités, évènements, sondages, etc.) avec leurs membres. De plus, grâce à cet espace, vous pourrez très facilement communiquer avec les responsables de ces associations et coordonner les évènements inter-associations.

Vous disposez d’un annuaire des responsables associatifs de votre commune, d’un agenda à jour des activités et des évènements des associations de votre commune, d’un moyen simple de communication vers les responsables et les personnes engagés. De plus ce portail vous permet d’offrir à vos associations la possibilité d’inscrire leurs membres en ligne.

Toutes les fonctionnalités de gestion, de communication et d'organisation d'activités sont également disponibles pour l'usage propre des équipes de la maison des associations."	)  

(* NEW ITEM------------------- *)
let collectivites_campaigns_title =
	composite `LR
	(pride ~title:"Campagnes électorales" "Un moyen efficace et original de mener sa campagne. Utilisé par plusieurs députés élus en 2012.")
	(contact_demo)
let collectivites_campaigns_desc_a =	
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/stevebott/2805560252/",
		       "Stevebott")
	   "/public/img/preconf_campaigns.jpg")
	(features [ 
	  "Point fort",
	  "Organiser, gérer et communiquer pour sa campagne depuis un même outil" ;
	    
	  "Idéal pour...",
	  "Mobiliser les sympathisants et les transformer en militants" ;
	  
	  "Egalement pensé pour...",
	  "Gérer les tractages et les boitages, communiquer auprès du public par le biais du site Internet"	]) 
let collectivites_campaigns_desc_b =	
	ribbon ( important
		""
		"Votre solution complète de communication sur Internet pour le prix de l’impression d’un trac papier ")
let collectivites_campaigns_desc_c =
	(pride 
	   ~title:"Un outil impactant pour votre campagne"
	   "Pour les campagnes électorales, nous proposons un intranet collaboratif qui permet de structurer la communication de la campagne de manière efficace et contrôlée. Il vous permet de mobiliser des militants et des sympathisants qui ne l'auraient pas été avec les moyens traditionnels. 

Tous les sympathisants ont accès à un espace privé et sécurisé qui centralise la communication. Des sous-espaces indépendants sont disponibles et administrés par des coordinateurs locaux. La campagne est pilotée par le cabinet du candidat qui peut s’adresser directement aux sympathisants ou faire relayer, via les militants, les évènements, les actions, les messages et les documents.

Ainsi impliqués et en s’appuyant sur les fonctionnalités offertes par RunOrg, les militants deviennent les relais efficaces de l’action du candidat. Ils disposent d’un espace qui centralise tous les éléments dont ils ont besoin et qui les concernent. Leur communication  et leurs actions sont plus facilement coordonnées et accompagnées.

Utilisé par plusieurs candidats ou députés durant les législatives 2012, l'outil a donné d'excellents résultats en terme de mobilisation et en terme de voix." )  

(* NEW ITEM------------------- *)
let collectivites_elementaryschool_title =
	composite `LR
	(pride ~title:"Ecoles primaires" "Elaboré avec le concours de spécialistes du numérique dans l'éducation, d'écoles, d'instituteurs et d'associations")
	(contact_demo) 
let collectivites_elementaryschool_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/wwworks/4005631298/",
		       "Woodleywonderworks")
	   "/public/img/preconf_elementaryschool.jpg")
	(features [ 
	  "Point fort",
	  "Un outil commun pour les élèves, les enseignants et les parents" ;
	    
	  "Idéal pour...",
	  "Apprendre en toute sécurité et confidentialité la base des échanges communautaires et des intranets" ;
	  
	  "Egalement pensé pour...",
	  "Faciliter la communication entre les enseignants et les parents d'élèves"	])  
let collectivites_elementaryschool_desc_b =
	(pride 
	   ~title:"Premier intranet collaboratif pour les écoles"
	   "La solution RunOrg pour les écoles primaires permet de regrouper dans un seul espace en ligne tous les outils de communication et d'organisation utiles aux enseignants.
	   
	   Ils peuvent utiliser cet espace privé pour initier leurs élèves à la communication numérique en toute sérénité, ils peuvent également communiquer et partager des documents et des photos avec les parents.
	   
	   Grâce aux groupes privés, les enseignants peuvent s'organiser et collaborer entre eux, dans des espaces réservés. 
	   
	   RunOrg pour les écoles primaires est actuellement en test dans une vingtaine d'écoles primaires en France." 	)  

(* NEW ITEM------------------- *)
let collectivites_copro_title =
	composite `LR
	(pride ~title:"Copropriétés" "Gestion d'une copropriété avec un gestionnaire / un syndic professionnel ou bénévole")
	(contact_demo) 
let collectivites_copro_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/joiseyshowaa/1279750389/",
		       "Joiseyshowaa")
	   "/public/img/preconf_copro.jpg")
	(features [ 
	  "Point fort",
	  "Facilite la communication et l'organisation des actions du syndic" ;
	    
	  "Idéal pour...",
	  "Communiquer sur des points urgents et pour voter des décisions rapidement" ;
	  
	  "Egalement pensé pour...",
	  "Partager les documents officiels, donner des accès aux prestataires, être informé des évènements de la copro" ]) 
let collectivites_copro_desc_b =
	(pride 
	   ~title:"Un intranet pour votre copropriété"
	   "La solution RunOrg pour les copropriétés et les syndics est destinée à fournir un espace en ligne de type Intranet adapté aux communautés que représentent les propriétaires et les locataires des immeubles. 

Les propriétaires et locataires bénéficient d’un espace depuis lequel ils peuvent communiquer, s’organiser et gérer les aléas de leur lieu de vie. Les syndics et les gestionnaires disposent d’un moyen simple et rapide d’avoir les coordonnées des habitants, et de pouvoir rationnaliser leurs communications et leurs actions avec les membres du conseil syndical. 

RunOrg Copropriétés vous offre une solution clef en main, ludique et efficace pour améliorer la vie de votre copropriété et prévenir les conflits en facilitant la communication et les actions rapides. De plus, vous bénéficiez de tous les autres points forts de RunOrg pour la gestion d’une communauté en ligne. " 	)  

(* -------------------- ENTREPRISES ------------------- *)
(* NEW ITEM------------------- *)
let entreprises_company_title =
	composite `LR
	(pride ~title:"Entreprises" "Solution simple et flexible à la manière d'un Réseau Social d'Entreprise")
	(contact_demo) 
let entreprises_company_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/proimos/4045973322/",
		       "Alex E. Proimos")
	   "/public/img/preconf_company.jpg")
	(features [ 
	  "Points forts",
	  "Un réseau privé complet, flexible, simple à prendre en main et sans maintenance informatique" ;
	    
	  "Idéal pour...",
	  "Mettre en place des groupes de travail autour des services existants ou des projets transversaux" ;
	  
	  "Egalement pensé pour...",
	  "Communiquer vers les clients et les fournisseurs"	])  
let entreprises_company_desc_b =	
	(pride 
	   ~title:"Plus fexible qu'un RSE !"
	   "La solution RunOrg pour les entreprises offre toutes les fonctionnalités d'un intranet d'entreprise, et y ajoute les avantages des outils de travail collaboratif et des réseaux sociaux d’entreprises.

La communication interne de l'entreprise est structurée autour de ses équipes, de ses services et de ses projets. Il est simple et rapide de créer un espace d'échange regroupant les conversations et la documentation et d'y inviter les personnes concernées par le sujet. Vous pouvez déléguer l'administration des différents nœuds d'échanges.

A la manière des réseaux sociaux, vous disposez d'un annuaire, d'agendas, d'évènements, de documents partagés, de forums et d'albums. Vous organisez des sondages, créez des fiches personnalisées sur les compétences de vos salariés, et disposez d'un outil de statistiques intégré.

Vous avez également la possiblité d'ouvrir votre outil à vos clients privilégiés ou vos prestataires pour en faire le portail de votre entreprise."	)  

(* NEW ITEM------------------- *)
let entreprises_companytraining_title =
	composite `LR
	(pride ~title:"Centres de formation" "Solution idéale pour organiser les échanges entre les stagiaires et garder le contact avec eux une fois la formation terminée")
	(contact_demo)  
let entreprises_companytraining_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/76029035@N02/6829406809/",
		       "Victor1558")
	   "/public/img/preconf_companytraining.jpg")
	(features [ 
	  "Point fort",
	  "Animation du réseau des formateurs et des stagiaires" ;
	    
	  "Idéal pour...",
	  "Offrir des espaces privés d'échanges durant et après la formation" ;
	  
	  "Egalement pensé pour...",
	  "Organiser les activités du centre et communiquer auprès des salariés et des formateurs"	])  
let entreprises_companytraining_desc_b =	
	(pride 
	   ~title:"Animer votre réseau de stagiaires"
	   "La solution RunOrg pour les entreprises et les centres de formation offre toutes les fonctionnalités d'un réseau social d’entreprise, et y ajoute les accès et la gestion des formateurs et des stagiaires.

L'entreprise dispose d'outils puissants pour sa communication interne, et offre des espaces séparés et privés pour la communication avec ses formateurs, et entre ses formateurs et leurs stagiaires. Elle anime ainsi un réseau privé de formateurs et de clients.

A la manière des réseaux sociaux, vous disposez d'un annuaire, d'agendas, d'évènements, de documents partagés, de forums et d'albums. Vous organisez des sondages, créez des fiches personnalisées sur les compétences de vos stagiaires, et disposez d'un outil de statistiques intégré. Chacun des groupes ou des cours peut être indépendant et caché des autres. "	)  

(* NEW ITEM------------------- *)
let entreprises_comiteent_title =
	composite `LR
	(pride ~title:"Comités d'Entreprise" "Solution conçue pour organiser et animer des comités de petites et moyennes entreprises" )
	(contact_demo)  
let entreprises_comiteent_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/highwaysagency/5998133376/",
		       "Highways Agency")
	   "/public/img/preconf_comiteent.jpg")
	(features [ 
	  "Point fort",
	  "Disposer d'un intranet collaboratif indépendant de celui de l'entreprise" ;
	    
	  "Idéal pour...",
	  "Organiser les activités du CE et communiquer avec les salariés" ;
	  
	  "Egalement pensé pour...",
	  "Gérer les projets, les services et les activités (cours, voyages, etc.)"	]) 
let entreprises_comiteent_desc_b =	
	(pride 
	   ~title:"Un intranet privé pour votre CE"
	   "La solution RunOrg pour les Comités d'Entreprise regroupe tous les outils de communication et d'organisation dont les CE ont besoin. 

Les élus et les responsables disposent d'espaces privés et sécurisés dans lesquels ils peuvent discuter et échanger des documents. Les salariés accèdent aux activités et évènements du CE auxquels ils peuvent s'inscrire en ligne. Les communications peuvent se faire par la messagerie interne de RunOrg. 

RunOrg Comités d'Entreprise vous offre une solution clef en main, ludique et efficace pour améliorer la communication et les actions de votre CE. "	)  

(* NEW ITEM------------------- *)
let entreprises_events_title =
	composite `LR
	(pride ~title:"Organisation d'évènements" "Cette solution vous permet d'organiser un évènement, d'animer les participants, et de les relancer pour les évènements suivants")
	(contact_demo) 
let entreprises_events_desc_a =
    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/pagedooley/3194564161/",
		       "Kevin Dooley")
	   "/public/img/preconf_events.jpg")
	(features [ 
	  "Point fort",
	  "Animation d'une communauté festive ou en lien avec de grands événements" ;
	    
	  "Idéal pour...",
	  "Mobiliser et fidéliser les participants à un événements et les relancer d'une fois sur l'autre" ;
	  
	  "Egalement pensé pour...",
	  "Offrir aux participants un espace qui perdure aux événements et dans lequel ils vont pouvoir continuer à échanger"	]) 
let entreprises_events_desc_b =	
	(pride 
	   ~title:"Fidélisez les participants"
	   "La solution de RunOrg dédiée à l'organisation d'évènements vous ouvre de très nombreuses possibilités pour gérer votre relation avec vos participants. Désormais vous animez et faites vivre la communauté créée lors de vos évènements d'un rendez-vous à l'autre. Cela simplement, à la manière d'un réseau social, et en impliquant les plus passionnés.

Les membres échangent sur le mur et postent leurs photos directement dans l'évènement, et ont accès à d'autres options que vous déterminez. Ce service supplémentaire offert à vos participants permet de capitaliser sur vos évènements en augmentant leur fidélité et leur retour, simplifiant les inscriptions et offrant à ces communautés un fort sentiment d'appartenance qui contribue à la promotion de vos activités. 

RunOrg Organisation d'évènement vous offre une solution clef en main ludique et efficace pour organiser vos soirées et vos évènements. De plus, vous bénéficiez de tous les autres points forts de RunOrg pour récupérer des informations sur vos participants et leur envoyer des messages ciblés. Cette solution s'adresse aux professionnels de l'évènementiel et à toute structure dont l'activité principale est l'organisation d'évènements."	) 

 

(* NEW ITEM------------------- *)
(* NEW ITEM------------------- *)
(* NEW ITEM------------------- *)
	
let pages = [
  (* BEGIN PAGES ------------------------------------------------------------ *)

  page "" "RunOrg Associations - Configuration Standard"
    [ associations_standard_title;     
	default_price_asso ;	
    ] ;
	
  page "/asso/Students" "RunOrg Associations - BDE et Associations Etudiantes"
   [ associations_students_title ;
	associations_students_desc_a ;
	associations_students_desc_b ;
	associations_students_desc_c ;
      hr () ;
      default_price_asso ;
    ] ; 
	
  page "/asso/Ess" "RunOrg Associations - Economie Sociale et Solidaire"
    [ associations_ess_title ;
	associations_ess_desc_a ;
	associations_ess_desc_b ;
      hr () ;
      default_price_asso ;
    ] ;

  page "/asso/Impro" "RunOrg Associations - Théâtre d'Improvisation"
    [ associations_impro_title ;
	associations_impro_desc_a ;
	associations_impro_desc_b ;
      hr () ;
      default_price_asso ;
    ] ;

  page "/clubs-sports/MultiSports" "RunOrg Clubs - Clubs multi-sports "
    [ associations_multisports_title ;
	associations_multisports_desc_a ;
	associations_multisports_desc_b ;
      hr () ;
      default_price_asso ;
    ] ;

  page "/clubs-sports/Judo" "RunOrg Clubs - Judo et Jujitsu"
    [ associations_judo_title ;
	associations_judo_desc_a ;
	associations_judo_desc_b ;
      hr () ;
     default_price_asso ;
    ] ;

  page "/clubs-sports/Tennis" "RunOrg Clubs - Tennis "
    [ associations_tennis_title ;
	associations_tennis_desc_a ;
      hr () ;
      default_price_asso ;
    ] ;	

  page "/clubs-sports/Badminton" "RunOrg Clubs - Badminton "
    [ associations_badminton_title ;
	associations_badminton_desc_a ;
	associations_badminton_desc_b ;
	associations_badminton_desc_c ;
      hr () ;
      default_price_asso ;
    ] ;	

  page "/clubs-sports/Footus" "RunOrg Clubs - Football US & cheerleading "
    [ associations_footus_title ;
	associations_footus_desc_a ;
	associations_footus_desc_b ;
      hr () ;
      default_price_asso ;
    ] ;

  page "/clubs-sports/Athle" "RunOrg Clubs - Athlétisme "
    [ associations_athle_title ;
	associations_athle_desc_a ;
      default_price_asso ;
    ] ;

  page "/clubs-sports/SalleSport" "RunOrg Clubs - Salle de sport et coaching "
    [ associations_sallesport_title;
	associations_sallesport_desc_a ;
	associations_sallesport_desc_b ;
      hr () ;
      default_price_asso ;
    ] ;

  page "/clubs-sports/Sports" "RunOrg Clubs - Autres sports"
    [ associations_sports_title ;
	associations_sports_desc_a ;
	associations_sports_desc_b ;
	associations_sports_desc_c ;
      hr () ;
      default_price_asso ;
    ] ;

  page "/collectivites/Collectivites" "RunOrg Collectivités - Mairies et collectivités territoriales"
    [ collectivite_all_title ;
	collectivite_all_desc_a ;
	collectivite_all_desc_b ;
      hr () ;
      composite `LR
       plateforme_complete
	technologie_accessible_collectivites ;
	    ] ;

  page "/collectivites/LocalNpPortal" "RunOrg Collectivités - Portail associatif communal"
    [ collectivites_localnpportal_title ;
	collectivites_localnpportal_desc_a ;
	collectivites_localnpportal_desc_b ;
      hr () ;
	     composite `LR
       plateforme_complete
	technologie_accessible_collectivites ;
    ] ;

  page "/collectivites/MaisonAsso" "RunOrg Collectivités - Maisons des associations"
    [ collectivites_maisonasso_title ;
	collectivites_maisonasso_desc_a ;
	collectivites_maisonasso_desc_b ;
	collectivites_maisonasso_desc_c ;
      hr () ;
	     composite `LR
       plateforme_complete
	technologie_accessible_collectivites ;
    ] ;	

  page "/collectivites/Campaigns" "RunOrg Collectivités - Campagnes électorales"
    [  collectivites_campaigns_title ;
	collectivites_campaigns_desc_a ;
	collectivites_campaigns_desc_b ;
	collectivites_campaigns_desc_c ;	
      hr () ;
       composite `LR
       plateforme_complete
	technologie_accessible_collectivites ;
    ] ;	

  page "/federations/Federations" "RunOrg Fédérations - Structure fédérale"
    [ associations_federations_title ;
	associations_federations_desc_a ;
	associations_federations_desc_b ;
      hr () ;
       composite `LR
       plateforme_complete 
	associations_federations_desc_c ;
    ] ;

  page "/federations/Badminton" "RunOrg Fédérations - FF Badminton"
    [ composite `LR
	(pride ~title:"FF Badminton" "Solution conçue et adaptée pour les clubs affiliés à la Fédération Française de Badminton")
	(create "Badminton") ;

      composite `LR
	(image "/public/img/preconf_badminton_logo_ffbad.jpg")
	(pride
	   ~title:"Portail clubs de la FFBAD"
	   ~subtitle:"Bientôt disponible"
	   ~link:("http://www.ffbad.org",
	       "Site de la FFBAD")
	   "La FFBAD met à la disposition exclusive de ses clubs affiliés des espaces privés spécialement adaptés au badminton. 
	   Ces espaces sont hébergés sous le nom de domaine de la fédération, disposent des couleurs de la FFBAD, et fourniront des services exclusifs aux clubs affiliés."
	);
    ] ;	

  page "/federations/SpUsep" "RunOrg Fédérations - USEP "
    [ composite `LR
	(pride ~title:"USEP" "-En test- Solution conçue et adaptée pour les associations affiliées à l'USEP")
	(create "SpUsep")
    ] ;	

  page "/federations/SectionSportEtudes" "RunOrg Fédérations - Sections sport-études"
    [ composite `LR
	(pride ~title:"Sections sport-études" "Conçu avec et pour le pôle espoir de la ligue de judo Rhône Alpes, cette solution d'adapte à toutes les sections sport-études.")
	(create "SectionSportEtudes") ;

    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/jayhem/3600002571/",
		       "Jayhem")
	   "/public/img/preconf_sectionsportetudes.jpg")
	(features [ 
	  "Point fort",
	  "Gestion complète de la communication et de l'organisation d'une section sport études depuis un seul outil" ;
	    
	  "Idéal pour...",
	  "Communiquer avec les sportifs, les parents et entre encadrants" ;
	  
	  "Modèles et groupes inclus",
	  "Formulaire d'inscription en ligne, modèle de fiches bilan (entraînement, compétition, scolaire, médical, etc.)";
	  
	]) ; 

	(pride 
	   ~title:"Le seul outil dédié aux sections sport études"
	   "La solution RunOrg pour les sections sport-études a été conçue en partenariat avec des responsables de pôles espoir pour répondre au mieux à leurs besoins.
	   
	   Grâce à RunOrg pour les sections sport études, vous organisez votre pôle autour des sportifs et des encadrants. Vous partagez les informations importantes sur les sportifs et vous pouvez diffuser ces informations aux parents. Vous disposez de modèles de fiches permettant de faciliter le suivi et les alertes. Vous pouvez ainsi assurer un suivi individuel efficace et facile à animer.
	   
	   Vous disposez d'un outil puissant pour gérer le groupe et communiquer efficacement. Vous bénéficiez également de toutes les fonctionnalités permettant de resserer les liens et de créer une communauté solide."
	) ; 

      hr () ;

      composite `LR
       plateforme_complete

        (pride
	   ~title:"La technologie accessible"
	   ~subtitle:"L'offre la plus économique du marché"
	   ~link:("/pricing",
		  "Tarifs des offres") 
	   "Nous vous offrons un outil à la pointe, adaptable et évolutif. 
	   
	   Opter pour une solution déjà existante et en ligne est un choix économiquement plus judicieux et plus sûr que de développer ou faire développer sa solution. 
	   
	   Vous êtes dès maintenant en mesure d'évaluer la qualité de l'outil et notre offre tarifaire claire vous permet de connaître précisément les coûts annuels, sans surprise. "
	) ;
    ] ;

  page "/education/ElementarySchool" "RunOrg Education - Ecoles primaires "
    [ collectivites_elementaryschool_title ;
	collectivites_elementaryschool_desc_a ;
	collectivites_elementaryschool_desc_b ;
      hr () ;

      composite `LR
	(price
	   "Gratuit"
	   ""
	   "jusqu'en décembre 2012") 
       plateforme_complete
    ] ;

  page "/education/SectionSportEtudes" "RunOrg Education - Sections sport-études"
    [ composite `LR
	(pride ~title:"Sections sport-études" "Conçu pour organiser et animer depuis un seul espace les encadrants, élèves, professeurs et parents")
	(create "SectionSportEtudes");

    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/jayhem/3600002571/",
		       "Jayhem")
	   "/public/img/preconf_sectionsportetudes.jpg")
	(features [ 
	  "Point fort",
	  "Gestion complète de la communication et de l'organisation d'une section sport études depuis un seul outil" ;
	    
	  "Idéal pour...",
	  "Communiquer avec les sportifs, les parents et entre encadrants" ;
	  
	  "Modèles et groupes inclus",
	  "Formulaire d'inscription en ligne, modèle de fiches bilan (entraînement, compétition, scolaire, médical, etc.)" ;
	]) ; 

	(pride 
	   ~title:"Le seul outil dédiés aux sections sport études"
	   "La solution RunOrg pour les sections sport-études a été conçu en partenariat avec des responsables de pôles espoir pour répondre au mieux à leurs besoins.
	   
	   Grâce à RunOrg pour les sections sport études vous organisez votre pôle autour des sportifs et des encadrants. Vous partagez les informations importantes sur les sportifs et vous pouvez diffuser ces informations aux parents. Vous disposez de modèles de fiches permettant de faciliter le suivi et les alertes. Vous pouvez ainsi assurer un suivi individuel efficace et facile à animer.
	   
	   Vous disposez d'un outil puissant pour gérer le groupe et communiquer efficacement. Vous bénéficiez également de toutes les fonctionnalités permettant de resserrer les liens et de créer une communauté solide."
	) ; 

      hr () ;

      composite `LR
       plateforme_complete

        (pride
	   ~title:"La technologie accessible"
	   ~subtitle:"L'offre la plus économique du marché"
	   ~link:("/pricing",
		  "Tarifs des offres") 
	   "Nous vous offrons un outil à la pointe, adaptable et évolutif. 
	   
	   Opter pour une solution déjà existante et en ligne est un choix économiquement plus judicieux et plus sûr que de développer ou faire développer sa solution. 
	   
	   Vous êtes dès maintenant en mesure d'évaluer la qualité de l'outil et notre offre tarifaire claire vous permet de connaître précisément les coûts annuels, sans surprise. "
	) ;
    ] ;
  page "/syndic-copropriete/Copro" "RunOrg Copropriétés - Copropriété avec syndic professionnel"
    [collectivites_copro_title ;
	collectivites_copro_desc_a ;
	collectivites_copro_desc_b ;
      hr () ;
      composite `LR
       plateforme_complete
	technologie_accessible_collectivites ;
    ] ;

  page "/syndic-copropriete/CoproVolunteer" "RunOrg Copropriétés - Copropriété avec syndic bénévole"
    [ composite `LR
	(pride ~title:"Copropriété avec syndic bénévole" "Gestion d'une copropriété en syndic bénévole ou regroupement de copropriétaires sans accès pour le syndic professionnel")
	(contact_demo)  ;

    composite `LR 
	(image 
	   ~copyright:("http://www.flickr.com/photos/gdominici/93513921/",
		       "Gianni Dominici")
	   "/public/img/preconf_coprovolunteer.jpg")
	(features [ 
	  "Point fort",
	  "Facilite la communication et l'organisation des actions du syndic" ;
	    
	  "Idéal pour...",
	  "Communiquer sur des points urgents et pour voter des décisions rapidement" ;
	  
	  "Egalement pensé pour...",
	  "Décider des dates des prochaines réunions, partager les documents officiels, être informé des évènements de la copro"	
	  
	]) ; 
	

	(pride 
	   ~title:"Un intranet ça change une copropriété"
	   "La solution RunOrg pour les copropriétés et les syndics bénévoles est destinée à fournir un espace en ligne de type Intranet adapté aux communautés que représentent les propriétaires et les locataires des immeubles. 

Les propriétaires et locataires bénéficient d’un espace depuis lequel ils peuvent communiquer, s’organiser et gérer les aléas de leur lieu de vie. Les syndics bénévoles disposent d’un moyen simple et rapide d’avoir les coordonnées des habitants, de recueillir les avis des propriétaires, et de pouvoir rationnaliser leurs communications et leurs actions avec les membres du conseil syndical. 

RunOrg Copropriétés pour syndics bénévoles vous offre une solution clef en main, ludique et efficace pour améliorer la vie de votre copropriété et prévenir les conflits en facilitant la communication et les actions rapides. De plus, vous bénéficiez de tous les autres points forts de RunOrg pour la gestion d’une communauté en ligne. "
	) ; 

      hr () ;

      composite `LR
       plateforme_complete
	technologie_accessible_collectivites ;
    ] ;

  page "/entreprises/Company" "RunOrg Entreprises"
    [ entreprises_company_title ;
	entreprises_company_desc_a ;
	entreprises_company_desc_b ;
      hr () ;
      composite `LR
       plateforme_complete
	technologie_accessible_entreprises ;
    ] ;

  page "/entreprises/CompanyTraining" "RunOrg Entreprises - Centres de formation"
    [ entreprises_companytraining_title ;
	entreprises_companytraining_desc_a ;
	entreprises_companytraining_desc_b ;
      hr () ;
      composite `LR
       plateforme_complete
	technologie_accessible_entreprises ;
    ] ;
	
  page "/ComiteEnt" "RunOrg Comités d'Entreprise"
    [ entreprises_comiteent_title ;
	entreprises_comiteent_desc_a ;
	entreprises_comiteent_desc_b ;
      hr () ;
      composite `LR
       plateforme_complete
	technologie_accessible_entreprises ;
    ] ;

  page "/others/Events" "RunOrg - Organisation d'évènements"
    [ entreprises_events_title ;
	entreprises_events_desc_a ;
	entreprises_events_desc_b ;
      hr () ;
      composite `LR
       plateforme_complete
	technologie_accessible_entreprises ;
    ] 
	       
  (* END PAGES -------------------------------------------------------------- *)
] 
