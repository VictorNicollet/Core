open Common
open WithSections 

let pages = [
  (* BEGIN PAGES ------------------------------------------------------------ *)

  page "/" "RunOrg Associations"
    ~section:"associations" 
    ~head:"associations"
    ~subsection:"accueil"
    [ composite `LLR
	(video 
	   ~height:350
	   ~poster:"/public/img/2012-04-12-video-poster.png"
	   [ "/public/videos/2012-04-13.mp4", "video/mp4" ;
	     "/public/videos/2012-04-13.ogv", "video/ogg" ])
	(bullets 
	   ~title:"Un nouvel outil"
	   ~subtitle:"Découvez la meilleure façon de..."
	   [ "Gérer vos membres, votre annuaire et vos adhésions." ;
	     "Organiser des évènements, des réunions, des assemblées générales." ;
	     "Déléguer des responsabilités tout en gardant le contrôle." ;
	     "Communiquer plus facilement avec les membres de votre association."
		  ]) ;
      
      hr () ;

      composite `LR
	(pride
	   ~title:"Prise en main immédiate"
	   ~subtitle:"Vos membres vont adorer"
	   "L'interface de RunOrg est intuitive, facile à maîtriser et ludique : les membres de votre association l'adopteront rapidement pour communiquer entre eux et avec les responsables de l'association.

Nous le constatons chez tous nos clients : en quelques jours, leur intranet RunOrg devient la façon la plus simple de communiquer et de s'organiser."
	)
	(image "/public/img/2012-04-12-1-cut.png") ;

      composite `LR
	(image "/public/img/2012-04-12-2-cut.png")
	(pride
	   ~title:"Dédié aux associations"
	   ~subtitle:"Nous avons pensé à vous"
	   "Les nouvelles technologies évoluent, pourquoi les entreprises 
et les particuliers seraient-ils les seuls à en profiter ?

Plutôt que de recycler des outils pour entreprises, RunOrg a été conçu dès le départ pour répondre aux besoins spécifiques des associations, de leurs responsables et de leurs membres."
	) ;

      ribbon 
	(important 
	   "Respect de la vie privée"
	   "On dit des réseaux sociaux que si vous n'êtes pas le client, vous êtes le produit. 
Chez RunOrg, les données privées de nos utilisateurs leur appartiennent, 
elles ne seront jamais vendues à des annonceurs ou des entreprises."
	) ;

      composite `LLR
	(pride
	   ~title:"Gratuit, pour toujours"
	   ~subtitle:"Parce que c'est pour la bonne cause"
	   "Nous avons vu trop d'équipes motivées s'épuiser et renoncer 
parce qu'elles n'avaient pas les bons outils.

Organiser un groupe autour d'une passion ou d'un projet, ça ne s'improvise pas. Mais grâce à RunOrg, au moins cela devient gratuit."
	)
	(price
	   "Gratuit"
	   "pour les associations"
	   "de moins de 2000 adhérents") ; 
      
      recommend 
	~title:"Ils recommandent RunOrg"
	~subtitle:"Nous avons changé leur vie"
	[ ( "Frédéric Roualen" ,
	    "Équipe de France féminine de Judo" ,
	    "L’interface de l’outil est agréable et facile à prendre en main. Et en plus c’est ludique ! Mes membres y accèdent même depuis leurs smartphones." ) ;
	  ( "Antoine Pierchon" ,
	    "Président de la Fédé B", 
	    "Grâce à RunOrg j’ai pu récupérer très rapidement les informations des participants, les mini-sondages sont parfaits pour planifier des réunions." ) ;
	  ( "Cédric Esserméant" , 
	    "Président des Centaures de Grenoble" ,
	    "RunOrg me permet de confier l’administration des cours et l’organisation des matchs ! Je peux enfin déléguer en gardant la visibilité dessus." ) 
	] ;
      
      hr () ;
      
      composite `LR 
	(pride 
	   ~title:"Conçu par des experts"
	   ~subtitle:"Des années d'expérience associative"
	   ~link:("http://runorg.com/blog"," Et suivez nos conseils com' sur notre blog !")
	   "La communication dans les associations, c'est compliqué, et on ne sait pas toujours à qui s'adresser. 

	   Notre équipe répond à vos questions ! Devenez fan de notre page Facebook et posez-nous vos questions sur notre mur.")
	   (facebook ()) ;
	
    ] ;

  page "/features" "RunOrg Associations - Fonctionnalités"
    ~section:"associations" 
    ~head:"associations"
    ~subsection:"fonctionnalites"
    [ composite `LR
	(image "/public/img/2012-04-13-1-cut.png")
	(pride
	   ~title:"Gestion des membres"
	   ~subtitle:"Simplement et rapidement"
	   "Toutes les associations ont une liste de leurs adhérents, mais elle est souvent incomplète ou accessible par un seul responsable.

Avec RunOrg, gérez la liste de vos membres à un seul endroit, accessible en ligne par tous les responsables, et laissez vos membres tenir eux-mêmes à jour leurs informations de contact."
	) ;
      
      composite `LR
	(pride
	   ~title:"Formulaires configurables"
	   ~subtitle:"Posez les bonnes questions"
	   "Pouvoir récupérer facilement des informations sur les membres arrive en tête des demandes de nos utilisateurs. 

Disponibles sur les adhésions et les évènements, des formulaires configurables vous permettent de poser les questions importantes, et les membres y répondent en s'inscrivant. Le résultat est disponible en ligne et facilement téléchargeable."
	) 
	(image "/public/img/2012-04-16-1-cut.png") ;

      composite `LR
	(image "/public/img/2012-04-16-2-cut.png")
	(pride
	   ~title:"Déléguez en toute confiance"
	   ~subtitle:"Ne soyez plus le seul à tout faire"
	   "Il y a dans votre association beaucoup de membres motivés, 
comment faire pour leur donner la main sur une seule activité ?

Vous pouvez donner des responsabilités à vos membre sur des parties bien définies de votre espace privé RunOrg : un groupe, 
un évènement, un forum de discussions, un album photo...

Et en cas de problème, nous gardons une trace des actions de chaque responsable."
	) ;

      ribbon 
	(important 
	   "Vos données sont en sécurité"
	   "Par défaut, toutes vos informations privées sont accessibles uniquement aux membres de votre association.

Vous pouvez choisir de rendre sélectivement publiques certaines de ces informations, 
ou au contraire les rendre accessibles aux membres de certains groupes uniquement."
	) ;

      composite `LRR
	(pride
	   ~title:"Evènements et activités"
	   ~subtitle:"Organisez-vous en ligne"
	   "Créez facilement des évènements publics ou privés, informez en un clic tout ou partie de vos membres.  

Chaque évènement comporte un mur de discussion, un album photo, un partage de fichiers. Et pour vos assemblées générales, une chatroom et des votes anonymes."
	) 
	(image "/public/img/2012-04-16-3-cut.png") ;

      hr () ;

      composite `LR
	(image "/public/img/2012-04-16-4-cut.png")
	(pride
	   ~title:"Murs de discussion"
	   ~subtitle:"Donnez la parole à vos membres"
	   "Envie de communiquer une annonce à tous vos membres ? 
De lancer une conversation autour d'un sujet ?

Les murs de discussion sont en même temps des forums en ligne et des listes de diffusion, pour impliquer à la fois les membres très actifs sur internet et ceux qui le sont moins.

Il est facile de créer un mur de discussion pour un groupe ou une activité, et seuls ceux qui sont inscrits reçoivent les messages."
	) ;

      hr () ;

      composite `LR
	(price
	   "Gratuit"
	   "pour les associations"
	   "de moins de 2000 adhérents") 
	(bullets
	   ~title:"Avec services inclus"
	   ~subtitle:"Pas besoin d'être informaticien"
	   ~ordered:false
	   [ "Hébergement de l'application" ;
	     "Mises à jour régulières" ;
	     "Maintenance informatique" ;
	     "Support en ligne" ]
	); 
      
    ] ;    

  page "/about/team" "À Propos de RunOrg - L'Équipe"
    ~head:"about"
    ~subsection:"equipe"
    [ composite `LRR
	(image "/public/img/mehdi-profil.jpg")
	(pride
	   ~title:"Mehdi Foughali"
	   ~subtitle:"Co-gérant, directeur commercial"
	   "Mehdi a deux vies, qu’il a mené en parallèle et que RunOrg permet de regrouper : la professionnelle et l’associative.

De sa vie associative, on peut dire qu’il fait partie d’associations depuis sa plus tendre enfance : des associations sportives, puis militantes, étudiantes et culturelles. Il a occupé diverses fonctions : secou­riste, responsable de la communication, animateur radio, administrateur du Bureau des arts de Sciences Po et président d’une association d’improvisation. Aujourd’hui, il ne garde qu’un seul mandat : administrateur de la chambre des asso­ciations pour faire bénéficier les autres de son expérience.

Côté professionnel, après avoir été diplômé de l’IUP de gestion et de management de l’université Pierre Mendès France à Grenoble, avoir passé un an d’échange à l’Université of California Santa Barbara, il a rejoint Sciences Po Paris. Il s’est ensuite spécialisé dans les outils informatiques de gestion de la relation client qu’il a mis en place en tant que consultant dans plusieurs grands groupes. Fort de son expérience dans la gestion des projets informatiques et de sa connaissance des problé­matiques du monde associatif et des organisations, il contribue activement à leur rendre la plateforme RunOrg pratique et efficace."
	) ;
      
      composite `LLR
	(pride
	   ~title:"Victor Nicollet"
	   ~subtitle:"Co-gérant, directeur technique"
	   "Lycéen puis classes préparatoires MP* au Lycée Louis Le Grand, Victor rejoint la prestigieuse École Normale Supérieure. Pendant quatre ans rue d'Ulm, il étudie les mathématiques, l'informatique, l'éco­nomie, la psychologie expérimentale, les neuro­sciences cognitives... et finit ses études avec, outre le diplôme de normalien, un Master de politique économique et un Master de recherche en informatique.

Il accepte ensuite de rejoindre une SSII à un poste d'encadrement technique pour compléter sa for­mation théorique par des cas pratiques et concrets, et pour s'initier à la gestion de projet et au mana­gement d'équipes.

Membre et actuellement secrétaire d'une asso­ciation d'improvisation, il co-fonde RunOrg et met au service du projet ses compétences dans la réalisation de systèmes informatiques complexes."
	) 
	(image "/public/img/victor-profil.jpg");

      composite `LRR
	(image "/public/img/francois-profil.jpg")
	(pride
	   ~title:"François Villard"
	   ~subtitle:"Le Créatif"
	   "Plus jeune des trois, François fait partie de cette génération qui a bloqué la ligne téléphonique de ses parents à l'arrivée des premiers forfaits d'internet illimité. Fasciné tant par l'informatique que la vidéo, il passe un DUT de Communication Multimédia en Auvergne, qu'il approfondira par différents stages, où il intègrera des équipes de test logiciel puis de création web.

Désireux de creuser davantage le côté vidéo de sa formation, il emménage sur Paris pour une Licence d'Arts du spectacle, option Cinéma. Là, il rejoint une association d'improvisation et prend en main sa communication web et papier, mais ressent un gros manque dès qu'il s'agit de communication interne. Tandis qu'il commence à envisager un outil spécifique, deux de ses collègues lui parlent de RunOrg..."
	) ;
    ] ;

  page "/about" "À Propos de RunOrg"
    ~head:"about"
    ~subsection:"projet"
    [ pride
	~title:"Fondé en 2010"
	~subtitle:"Un outil dédié aux associations"
	"L'équipe de RunOrg voit le jour en 2010 au sein d'une association de théâtre d'improvisation où Mehdi, Victor et François s'occupent de nombreux aspects techniques et administratifs, adaptant différents outils en ligne pour la communication et l'organisation.

Alors que les réseaux sociaux font partie du quotidien de quelques 750 millions de personnes, ils se demandent pourquoi il n'existe pas d'outil simple et efficace dédié à la gestion d'une association. Ils commencent alors à travailler sur ce qui va devenir RunOrg." 
	;

      ribbon (youtube "http://www.youtube.com/embed/9jTL4VQPsmc") ;

      pride 
	~title:"Un outil hybride"
	~subtitle:"Réunir au même endroit gestion et communication"
	"Analysant les différents problèmes qui se posent dans les organisations, ils découvrent rapidement que le meilleur moyen d’alléger la charge de travail des responsables est d’impliquer les membres dans leurs outils de gestion. Ils comprennent également que les membres doivent trouver un intérêt à participer dans ces outils. Or, leur principale demande est de pouvoir s’exprimer dans des espaces de communication simples et ludiques comme le sont les réseaux sociaux. Les objectifs à atteindre pour ce projet étaient définis : il fallait réussir à faire coexister dans une même solution des outils de gestion et de communication.

En 2011, s'appuyant sur leurs expertises techniques et fonctionnelles, ils atteignent leur objectif : RunOrg, un outil hybride répondant aux besoins des responsables comme des membres, est enfin prêt. La première plateforme regroupant fonctionnalités de gestion et de communication est mise en ligne." 
	;

      hr () ;

      pride 
	~title:"De nombreux débouchés"
	~subtitle:"La flexibilité de l'outil permet le sur-mesure"
	"L'aventure et les découvertes ne s'arrêtent pas là. Car conçu pour répondre à la grande diversité des problématiques des associations, leur outil permet d'assembler et de configurer très facilement des réponses sur mesure pour un très grand nombre de cas. Et cela pour un coût très faible car il mutualise les développements. C’est désormais toutes les organisations qui peuvent bénéficier de ce regroupement des fonctionnalités de gestion et de communication.

RunOrg devient ainsi la seule plateforme à pouvoir offrir à de nombreux types de structures un outil qui leur est spécialement dédié et à un prix aussi accessible. Sans les solutions « préconfigurées » RunOrg, de nombreuses organisations ne pourraient pas s’équiper d’un outil performant et adapté à leurs besoins.

L’équipe poursuit ses développements et l’accompagnement de ses clients, et avec eux, élabore régulièrement de nouvelles applications pour leur plateforme."

    ] ;

  page "/network/asso" "RunOrg - Le Réseau des Associations"
    ~section:"network"
    ~head:"network-asso"
    ~subsection:"associations"
    [ composite `LR
	(image "/public/img/2012-04-24-4-cut.png")
	(pride 
	   ~title:"Temps de parole garanti"
	   ~subtitle:"Contrairement à Twitter ou Facebook"
	   "Sur les réseaux traditionnels, votre message disparaît en quelques minutes des écrans de vos abonnés. Il faut envoyer dix messages par jour pour se faire entendre, sinon plus !

RunOrg applique un droit de parole : nous mettons en avant en priorité les messages des associations qui publient le moins souvent."
	   ) 
	;
      
      composite `LR
	(pride
	   ~title:"Soyez plus visible"
	   ~subtitle:"Contrairement à votre blog"
	   "Il est rare pour quelqu'un de tomber sur votre blog s'il ne connaît pas déjà votre association !

Sur le réseau RunOrg, votre association apparaît dans un annuaire public accessible à nos membres, et les autres associations peuvent reprendre vos annonces à destination de leurs propres abonnés."
	)
	(image "/public/img/2012-04-24-2-cut.png") ;

      hr () ;

      (pride
	 ~title:"Adapté aux fédérations"
	 ~subtitle:"Informez les membres de vos associations"
	 "Les associations ont parfois du mal à jouer les intermédiaires entre leur fédération et leurs membres, du moins pour ce qui est de transmettre les communiqués et les annonces. 
	 
	 Notre solution : les membres des associations qui utilisent RunOrg sont automatiquement abonnés aux annoces de leur fédération." 
      ) ;
    ] 
    ;

  page "/improvisation" "RunOrg Troupes d'Improvisation"
    ~section:"associations" 
    [ backdrop_head 
	~title:"Improvisation, 2000 joueurs par équipe."
	~image:"/public/img/2000joueurs.jpg"
	~text:"RunOrg vous permet d'organiser tous vos évènements d'improvisation, simplement et gratuitement.
(Si vous êtes moins de 2000)" 
	~action:"Essayer gratuitement"
	~url:"/start/Impro"
    ;

      composite `LLR
	(video 
	   ~height:350
	   ~poster:"/public/img/2012-04-12-video-poster.png"
	   [ "/public/videos/2012-04-13.mp4", "video/mp4" ;
	     "/public/videos/2012-04-13.ogv", "video/ogg" ])
	(bullets 
	   ~title:"Viens, on est bien !"
	   ~subtitle:"Regarde tout ce qu'on peut faire..."
	   [ "Gérer les membres, l'annuaire et les adhésions." ;
	     "Organiser des matchs, des spectacles, des réunions, des AG." ;
	     "Permettre à chacun de participer tout en gardant la structure de l'association." ;
	     "Diffuser votre actualité à vos membres, à votre public, à vos animaux, etc."
		  ]) ;
      
      hr () ;

      composite `LR
	(pride
	   ~title:"Prise en main immédiate"
	   ~subtitle:"Essayez, ça ira plus vite qu'une explication"
	   "L'interface de RunOrg est intuitive, facile à maîtriser et conçue pour les associations : vos membres l'adopteront rapidement pour communiquer entre eux et avec les responsables.

Nous le constatons partout : en quelques jours, leur intranet RunOrg devient la façon la plus simple de communiquer et de s'organiser."
	)
	(image "/public/img/2012-04-12-1-cut.png") ;

      ribbon 
	(important 
	   "Respect de la vie privée"
	   "Chez RunOrg, les données privées de nos utilisateurs leur appartiennent, 
elles ne seront jamais vendues à des annonceurs ou des entreprises.
En plus, vous pouvez les exporter facilement à tout moment : ce sont les vôtres."
	) ;

      composite `LLR
	(pride
	   ~title:"Mais pourquoi est-il si gentil ?"
	   ~subtitle:"Parce que c'est pour la bonne cause"
	   "Gratuit et soucieux de la vie privée ? À l'origine, nous voulions 
proposer RunOrg pour un petit prix. Mais pour une petite association,
il y a un monde entre pas cher et gratuit.

Nous vendons RunOrg aux grosses structures, mais n'oublions pas
notre objectif de base : simplifier la vie des associations.
Gratuit, c'est plus simple, non ?"
	)
	(price
	   "Gratuit"
	   "pour les associations"
	   "de moins de 2000 adhérents") ; 
      
      recommend 
	~title:"Ils recommandent RunOrg"
	~subtitle:"Ça marche pour tout le monde"
	[ ( "François Villard" ,
	    "Homme à tout faire des N'Improtequoi" ,
	    "RunOrg est un excellent outil pour l'organisation de notre équipe. Les membres s'investissent davantage et sont mieux informés... Tout est simplifié !" ) ;
	  ( "Antoine Pierchon" ,
	    "Président de la Fédé B", 
	    "Grâce à RunOrg j’ai pu récupérer très rapidement les informations des participants, les mini-sondages sont parfaits pour planifier des réunions." ) ;
	  ( "Cédric Esserméant" , 
	    "Président des Centaures de Grenoble" ,
	    "RunOrg me permet de confier l’administration des cours et l’organisation des matchs ! Je peux enfin déléguer en gardant la visibilité dessus." ) 
	] ;
      
      hr () ;
      
      composite `LR 
	(pride 
	   ~title:"Conçu par des experts"
	   ~subtitle:"Des années d'expérience associative"
	   ~link:("http://runorg.com/blog"," Et suivez nos conseils com' sur notre blog !")
	   "La communication dans les associations, c'est compliqué, et on ne sait pas toujours à qui s'adresser. 

	   Notre équipe répond à vos questions ! Devenez fan de notre page Facebook et posez-nous vos questions sur notre mur.")
	   (facebook ()) ;
	
    ] ;

  page "/network" "RunOrg - Le Réseau des Associations"
    ~section:"network"
    ~head:"network"
    ~subsection:"membres"
    [ composite `LR
	(pride 
	   ~title:"Des associations dynamiques"
	   ~subtitle:"Notre annuaire s'enrichit chaque jour"
	   ~link:("/network/all","Consultez l'annuaire des associations.") 
	   "Notre réseau comprend uniquement des associations et des acteurs de l'écosystème associatif : mairies, maisons des associations... 

Chacune dispose d'un profil où vous retrouverez ses informations de contact et ses actualités récentes. 

Profitez d'un réseau en pleine croissance qui n'est pas envahi par les marques ou les personnalités." 
	)
	(image "/public/img/2012-04-24-2-cut.png")
	;

      composite `LR
	(image "/public/img/2012-04-24-1-cut.png") 
	(pride
	   ~title:"Abonnez-vous aux actualités"
	   ~subtitle:"Nous nous occupons du reste pour vous"
	   "Vous recevrez par e-mail un résumé quotidien ou hebdomadaire.

	   Vous n'êtes pas noyé par les associations qui communiquent dix fois par jour, sans passer à côté de celles qui font une annonce par semaine. 

	   Nous ne transmettons pas votre e-mail aux associations, et vos demandes de désabonnement sont respectées."
	) 
	;

      composite `LR
	(pride 
	   ~title:"Devenez adhérent ou bénévole"
	   ~subtitle:"Trouvez l'association qui vous ressemble"
	   "RunOrg, c'est aussi un intranet privé et sécurisé pour associations.

Beaucoup d'associations utilisent RunOrg pour leurs activités, leurs adhérents, leurs bénévoles et leur communication interne. 

Vous restez maîtres de vos données personnelles."
	) 
	(image "/public/img/2012-04-24-3-cut.png") 
	;

    ] ;

  page "/autres/accompagnement" "RunOrg - Accompagnement"
    ~section:"autres" 
    ~head:"accompagnement"
    [ offer 
	~title: "Bien démarrer avec RunOrg"
	~price: "500 €"
	"Cette offre comprend la prise en main de votre espace, la configuration par nos soins selon vos besoins et sous vos yeux. Accompagnement dans la communication vers vos membres concernant ce lancement. Vous disposez ensuite de 2 heures de support téléphonique durant lesquels nous pouvons également intervenir dans votre espace RunOrg."
	[ "2 heures de formation à distance avec adaptation de votre espace RunOrg selon vos besoins" ;
	  "2 heures d’assistance téléphonique sur les 2 premiers mois d’abonnement" ] ;

      offer 
	~title: "Pack complet de lancement"
	~price: "750 € (plus frais de déplacement)"
	"Faites du lancement de votre nouvel espace un évènement pour les membres de votre organisation. Nous le configurons (sur place ou à distance) et le faisons découvrir à vos membres et administrateurs."
	[ "2 heures de formation à distance avec adaptation de votre espace RunOrg selon vos besoins (à distance ou sur place)" ;
	  "2 heures de formation et de présentation administrateurs et membres (sur place)" ;
	  "2 heures d’assistance téléphonique sur les 2 premiers mois d’abonnement" ] ;

      offer 
	~title: "Formation des administrateurs"
	~price: "150 €"
	"Toutes les choses importantes à savoir sur RunOrg pour en tirer le meilleur et plus ! Le niveau du cours s’adaptera en fonction des demandes des participants et de leur niveau sur RunOrg (débutant ou niveau avancé)."
	[ "1h de formation à distance (par téléphone ou skype)" ] ;

      offer 
	~title: "Support téléphonique"
	~price: "150 €"
	"Ne cherchez pas : demandez !"
	[ "1 heure de support téléphonique à consommer sur 1 mois après la souscription" ;
	  "A votre demande nous pouvons intervenir dans votre espace RunOrg" ] ;
    ] ;    

  page "/privacy" "RunOrg - Vie Privée"
    ~head:"cgu"
    ~subsection:"privacy"
    [ pride
	~title:"Pour RunOrg"
	"RunOrg s'engage à ne pas publier ou diffuser sur des espaces publics (notamment les sites Internet et les réseaux sociaux) et sans leur accord explicite, des informations issues des espaces gérés par les clients.

RunOrg s'engage à faire tout son possible pour mettre en place les systèmes appropriées permettant de protéger la vie privée de ses utilisateurs, et leur permettre de contrôler les données qu'ils partagent avec les clients.

RunOrg s'engage à ce que les informations fournies par un utilisateur dans son profil privé (adresse électronique, date de naissance, adresse, ville, pays, numéro de téléphone fixe, numéro de téléphone portable, sexe) puissent être cachées aux autres utilisateurs du service à sa demande et de façon sélective."
	;
      
      pride
	~title:"Pour les Organisations"
	"Le client s'engage à ne pas publier ou diffuser sur des espaces publics (notamment les sites Internet et les réseaux sociaux) des informations personnelles et nominatives sur ses utilisateurs sans leur accord explicite.

Il s'engage à se conformer à la loi en vigueur concernant les informations qu'il collecte auprès de ses utilisateurs, et notamment il se conforme aux recommandations de la CNIL. Par exemple il ne doit pas récolter des informations qui ne seraient pas liées à son activité ou dont la destination n’est pas liée à la conduite normale des activités de son organisation.

Le client ne doit pas utiliser les données de ses utilisateurs à des fins autres que celles de l'objet de son organisation.

Le client ne doit pas utiliser les données de ses utilisateurs sans leur accord explicite."
	;

      pride 
	~title:"Pour l'utilisateur"
	"L'utilisateur s'engage à ne pas publier ou diffuser sur des espaces publics (notamment les sites Internet et les réseaux sociaux) des informations personnelles et nominatives sur d’autres utilisateurs sans leur accord explicite. Il s'engage à ne pas utiliser les informations personnelles des autres utilisateurs auxquelles il pourrait avoir accès à des fins commerciales, personnelles ou de toutes natures sans leurs accords explicite."
	;

      pride 
	~title:"Responsabilités"
	"L'organisation est responsable de l'usage des données de ses utilisateurs. Il est également responsable de la bonne application des règles de cette présente déclaration de confidentialité en ligne par l'ensemble de ses utilisateurs. Il dispose par ailleurs des moyens techniques de suspendre les accès à son espace privé à des utilisateurs ne respectant pas lesdites règles.

RunOrg ne peut être tenu responsable d'un manquement à ces règles au sein de l'espace privé ou public d'une organisation.

Sur demande des autorités légales compétentes, RunOrg peut suspendre les accès d'un utilisateur à l'ensemble de son réseau, ou la totalité des accès à l'espace privé d’une organisation.

Sur demande des autorités légales compétentes, RunOrg peut suspendre les accès au service à une organisation."

    ] ;

  page "/autres/accompagnement" "RunOrg - Accompagnement"
    ~section:"autres" 
    ~head:"accompagnement"
    [ offer 
	~title: "Bien démarrer avec RunOrg"
	~price: "500 €"
	"Cette offre comprend la prise en main de votre espace, la configuration par nos soins selon vos besoins et sous vos yeux. Accompagnement dans la communication vers vos membres concernant ce lancement. Vous disposez ensuite de 2 heures de support téléphonique durant lesquels nous pouvons également intervenir dans votre espace RunOrg."
	[ "2 heures de formation à distance avec adaptation de votre espace RunOrg selon vos besoins" ;
	  "2 heures d’assistance téléphonique sur les 2 premiers mois d’abonnement" ] ;

      offer 
	~title: "Pack complet de lancement"
	~price: "750 € (plus frais de déplacement)"
	"Faites du lancement de votre nouvel espace un évènement pour les membres de votre organisation. Nous le configurons (sur place ou à distance) et le faisons découvrir à vos membres et administrateurs."
	[ "2 heures de formation à distance avec adaptation de votre espace RunOrg selon vos besoins (à distance ou sur place)" ;
	  "2 heures de formation et de présentation administrateurs et membres (sur place)" ;
	  "2 heures d’assistance téléphonique sur les 2 premiers mois d’abonnement" ] ;

      offer 
	~title: "Formation des administrateurs"
	~price: "150 €"
	"Toutes les choses importantes à savoir sur RunOrg pour en tirer le meilleur et plus ! Le niveau du cours s’adaptera en fonction des demandes des participants et de leur niveau sur RunOrg (débutant ou niveau avancé)."
	[ "1h de formation à distance (par téléphone ou skype)" ] ;

      offer 
	~title: "Support téléphonique"
	~price: "150 €"
	"Ne cherchez pas : demandez !"
	[ "1 heure de support téléphonique à consommer sur 1 mois après la souscription" ;
	  "A votre demande nous pouvons intervenir dans votre espace RunOrg" ] ;
    ] ;    

  page "/mentions-legales" "RunOrg - Mentions Légales"
    ~head:"cgu"
    ~subsection:"mentions"
    [ pride 
	~title:"Publication"
	"Références légales de la société
Le présent site est la propriété de RUNORG SARL
Forme sociale : SARL
Capital social : 10.000,00 euros
R.C.S. : Paris 499 669 927
TVA intracommunautaire : FR2049966992700018
Siège social : 22 rue Planchat 75020, France
Directeur de la publication : Victor Nicollet

L'ensemble de ce site relève des législations française et internationale sur le droit d'auteur et la propriété intellectuelle. Tous les droits de reproduction sont réservés, y compris pour les documents iconographiques et photographiques."
	;
     
      pride
	~title:"Hébergeur"
	"OVH : http://www.ovh.com
Siège social : 2 rue Kellermann - 59100 Roubaix - France."
	;
      
      pride 
	~title:"CNIL"
	~subtitle:"Protection des données personnelles"
	"Déclaration CNIL (numéro de récépissé) : 1520934

La société RUNORG utilise vos informations personnelles pour le bon traitement des commandes. En vous inscrivant sur le site, vous vous engagez à nous fournir des informations sincères et véritables vous concernant. La communication de fausses informations est contraire aux conditions générales ainsi qu'aux conditions d'utilisation figurant sur le site.

Conformément à la loi \"Informatique et Libertés\", le traitement de vos informations a fait l'objet d'une déclaration auprès de la Commission Nationale de l'Informatique et des Libertés (CNIL) sous le numéro de récépissé 1520934. Vous avez un droit permanent d'accès et de rectification sur toutes les données vous concernant, conformément aux textes européens et aux lois nationales en vigueur (article 34 de la loi du 6 janvier 1978). Il suffit d'en faire la demande à : RunOrg - Service Clients – 22 rue Planchat 75020 Paris." 
    ] ;
  
  page "/cgu-cgv" "RunOrg - Conditions Générales"
    ~head:"cgu"
    ~subsection:"cgu"
    [ "Asset_Splash_CguCgvFr.render ()" ] ;
  
  page "/contact" "RunOrg - Nous Contacter"
    [ "Asset_Splash_Contact.render ()" ] ;

  page "/press" "RunOrg - Presse"
    ~head:"press"
    ~subsection:"press"
    [ composite `LRR
	(pride 
	   ~title:"Dossier de presse"
	   ~subtitle:"Les informations essentielles "
	   ~link:("/public/media/pdf/dossier-presse-runorg-20120423.pdf",
		  "Télécharger le dossier complet [PDF]") 
	   "Notre dossier de presse inclut un historique, des descriptions, des interviews et des données concrètes au sujet de notre société, de notre équipe et de notre produit."
	) 
	(pride 
	   ~title:"Présentation rapide"
	   "RunOrg offre un intranet collaboratif aux organisations : une plateforme privée d’échange et de communication avec leurs membres, qui inclut des outils puissants de gestion et d’organisation pour les responsables. Le tout est hébergé et mis à jour gratuitement pour les associations ou pour un prix abordable dépendant du nombre d’accès. Des solutions pré-adaptées sont disponibles pour les différents types d’organisations : associations, clubs de sport, collectivités territoriales, politiques, syndics, etc. Contacts : contact@runorg.com"
	) ;

      composite `LR
	(image "/public/img/imagelogorectangle.png")
	(pride
	   ~title:"Téléchargement du logo rectangulaire"
	   "Logo rectangulaire 242x100 : http://runorg.com/public/media/logo/rectangle/rose/242.png
Logo rectangulaire 606x250 : http://runorg.com/public/media/logo/rectangle/rose/606.png
Logo rectangulaire 1024x422 : http://runorg.com/public/media/logo/rectangle/rose/1024.png"
	) ;

      composite `LR
	(image "/public/img/imagelogocarre.png")
	(pride
	   ~title:"Téléchargement du logo carré"
	   "Logo carré 100x100 : http://runorg.com/public/media/logo/carre/rose/100.png
Logo carré 250x250 : http://runorg.com/public/media/logo/carre/rose/250.png
Logo carré 1024x1024 : http://runorg.com/public/media/logo/carre/rose/1024.png" 
	) ;
    ];

  page "/press/releases" "RunOrg - Communiqués de Presse"
    ~head:"press"
    ~subsection:"press-releases"
    [ (* pride
	~title: "Gratuit pour les associations"
	~subtitle:"Communiqué du 18/04/2012"
	~link:("/public/media/pdf/Communique-RUNORG-18042012.pdf",
	       "Télécharger [PDF]") 
	"L’outil collaboratif gratuit qui va transformer les associations ! RunOrg offre gratuitement aux associations des plateformes privées de communication et d’organisation. Son originalité est de regrouper au sein d’un même espace les outils de gestion des responsables et les fonctionnalités d’interactions avec les membres."  
	; *)
  
  pride
	~title: "Un nouvel outil pour les organisations"
	~subtitle:"Communiqué du 24/04/2012"
	~link:("/public/media/pdf/communique-runorg-20120424.pdf",
	       "Télécharger le communiqué complet [PDF]")
	"Quel serait l’impact sur notre société si après les individus via les réseaux sociaux, les associations, les collectivités et les autre organisations disposaient d’un outil qui leur permette d’interagir simplement et efficacement avec leurs membres ?
Imaginez et construisez : RunOrg met à disposition cet outil. "
	;
    
      pride
	~title: "Les votes en ligne accessibles à tous"
	~subtitle:"Communiqué du 29/03/2012"
	~link:("/public/media/pdf/Communique-RUNORG-29032012.pdf",
	       "Télécharger le communiqué complet [PDF]")
	"RunOrg démocratise le vote en ligne pour les associations. La dernière version de RunOrg voit la mise à disposition pour toutes les associations de votes sécurisés en ligne. Cette nouveauté leur permet de simplifier les prises de décisions tout en respectant les contraintes démocratiques qui sont au cœur de la philosophie des associations loi 1901. "
	;
      
    ] ;
  
  page "/associations/benefits" "RunOrg - Avantages"
    ~section:"associations" 
    ~head:"associations"
    ~subsection:"avantages"
    [ composite `LR
	(image "/public/img/2012-04-19-1.png")
	(pride
	   ~title:"Un seul outil pour tous"
	   ~subtitle:"Tout faire depuis un seul outil c'est bien plus simple !"
	   "Pour les responsables comme pour les membres : plus besoin d'apprendre à utiliser un logiciel différent pour gérer le fichier adhérents, partager des photos ou des documents, organiser des événements ou des sondages, etc.

RunOrg regroupe en une seule plate-forme tous ces outils, avec une interface commune. Les membres s'y retrouvent facilement, et les responsables n'ont plus besoin de formations multiples."
	) ;
      
      composite `LR
	(pride
	   ~title:"Une meilleure mobilisation"
	   ~subtitle:"S'impliquer n'a jamais été aussi simple"
	   "Pour les membres, échanger avec son association est difficile : 
on ne sait pas comment, ça ne marche pas, ou ça prend du temps. Alors, souvent, on ne le fait pas, et on ne se sent pas impliqué.  

RunOrg fournit aux membres un outil simple pour communiquer avec leur association et pour s'informer sur les dernières actualités. Et nous avons constaté que les membres s'impliquent et se mobilisent davantage, et plus efficacement. "
	) 
	(image "/public/img/2012-04-19-2.png")
	   ;
      composite `LR
	(image 
	   ~copyright:("http://www.flickr.com/photos/giena/3361653109/",
		       "Eugenijus Barzdzius")
	   "/public/img/imagerugby.jpg")
	(pride
	   ~title:"Plus d'échanges et de cohésion"
	   ~subtitle:"Partager un espace privé, cela soude une communauté"
	   "Plus que les autres, les membres des associations et des clubs ont besoin de se sentir appartenir à une communauté, un groupe, un équipe. Ils veulent pouvoir échanger entre eux et partager passion, conseils ou services.

RunOrg offre aux membres l'espace de communication dont ils ont besoin pour échanger entre eux dans le cadre de l'association. Ces échanges directs sont le moteur de la cohésion au sein des associations et des clubs."
	) ;
      composite `LR

	(pride
	   ~title:"Meilleur partage des tâches"
	   ~subtitle:"Déléguer devient accessible et évident"
	   "Les responsables associatifs le savent bien : le manque de contrôle et l'ampleur des tâches à réaliser sont deux freins important qui les empèchent de déléguer ou de trouver des volontaires.

RunOrg permet de déléguer tout en gardant le contrôle sur ce qui a été fait. De plus l'outil permet de répartir certaines tâches sur les membres (ex : inscriptions en ligne). Les responsables vont adorer leur nouveau temps libre !")
	(image  "/public/img/imagephilippines.jpg")
    ] ;
  
  page "/pricing" "RunOrg - Tarifs"
        ~section:"pricing" 
        ~head:"pricing"
      [ pricing 
	~foot:"Prix exprimés hors taxes. Consultez nos <a href=\"/autres/accompagnement\">offres d'accompagnement</a> et <a href=\"/contact\">contactez-nous</a> pour toutes informations supplémentaires."
	[ [ "/catalog#asso", "Associations" ; 
	    "/catalog#sport", "Clubs de sport" ;
	    "/catalog/logiciel-intranet-extranet-maison-des-associations", "Maisons des associations" ;
	    "/catalog/logiciel-intranet-mairies-portail-forum-association-associatif", "Portail communal associatif" ] ;
	  [ "/catalog#syndic", "Syndics de copropriété" ;
	    "/catalog#ce", "Comités d'entreprise" ] ;
	  [ "/catalog/logiciel-intranet-collectivites-mairies", "Intranet municipal" ;
	    "/catalog/logiciel-intranet-entreprise-pme-professionnel-formation", "Centres de formation" ] ;
	  [ "/catalog/logiciel-intranet-organisation-evenements-soirees", "Organisation d'évènements" ;
	    "/catalog/logiciel-intranet-campagne-electorale-election", "Campagnes électorales"] ;
	  [ "/catalog#pro", "Entreprises" ]]
	[ "Prix", [ `Text "Gratuit" ; 
		    `Text "100€/an" ;
		    `Text "500€/an" ;
		    `Text "1000€/an" ;
		    `Text "100€/an" ] ;
	  "Accès inclus", [ `Text "2000" ;
			    `Text "50" ;
			    `Text "100" ;
			    `Text "10000" ;
			    `Text "10" ] ;
	  "Espace disque", [ `Text "4 Go" ;
			     `Text "5 Go" ;
			     `Text "5 Go" ;
			     `Text "10 Go" ;
			     `Text "10 Go" ] ;
	  "Hébergement et mises à jour", [ `Tick ; 
					   `Tick ;
					   `Tick ; 
					   `Tick ; 
					   `Tick ] ;
	  "Assistance email", [ `Text "Normale" ;
				`Text "Prioritaire" ;
				`Text "Prioritaire" ;
				`Text "Prioritaire" ;
				`Text "Prioritaire" ] ;
	  "Formation initiale", [ `NoTick ;
				       `NoTick ; 
				       `Text "2 heures" ;
				       `Text "2 heures" ;
				       `NoTick ] ;
	  "Assistance téléphonique", [ `NoTick ;
					    `NoTick ;
					    `NoTick ;
					    `Text "2 heures" ;
					    `NoTick ] ;
	  "100 accès suppl.", [ `Link ("/contact", "Nous Contacter") ;
					 `Text "70€/an" ;
					 `Text "400€/an" ;
					 `Text "25€/an"  ;
					 `Text "800€/an" ] ;
	  "Espace disque suppl.", [ `Text "2€/Go/mois" ;
				    `Text "2€/Go/mois" ;
				    `Text "2€/Go/mois" ;
				    `Text "2€/Go/mois" ;
				    `Text "2€/Go/mois" ] 
	] ;
    ] ;

(*  page "/collectivites/pricing" "RunOrg - Tarifs Collectivités"
        ~section:"collectivites" 
        ~head:"/collectivites/pricing"
        ~subsection:"pricing-collectivites"
      [ pricing 
	~foot:"Prix exprimés hors taxes. Consultez nos <a href=\"/autres/accompagnement\">offres d'accompagnement</a> et <a href=\"/contact\">contactez-nous</a> pour toutes informations supplémentaires."
	[ [ "/catalog/logiciel-intranet-extranet-maison-des-associations", "Maisons des associations" ;
	    "/catalog/logiciel-intranet-mairies-portail-forum-association-associatif", "Portail communal associatif" ] ;
	  [ "/catalog/logiciel-intranet-collectivites-mairies", "Intranet municipal" ] ;
	  [ "/catalog/logiciel-intranet-campagne-electorale-election", "Campagnes électorales"] ]
	[ "Prix", [ `Text "Gratuit" ; 
		    `Text "500€/an" ;
		    `Text "1000€/an"] ;
	  "Accès inclus", [ `Text "2000" ;
			    `Text "100" ;
			    `Text "10000" ] ;
	  "Espace disque", [ `Text "4 Go" ;
			     `Text "5 Go" ;
			     `Text "10 Go" ] ;
	  "Hébergement et mises à jour", [ `Tick ; 
					   `Tick ; 
					   `Tick ] ;
	  "Assistance email", [ `Text "Normale" ;
				`Text "Prioritaire" ;
				`Text "Prioritaire" ] ;
	  "Formation initiale", [ `NoTick ;
				       `Text "2 heures" ;
				       `Text "2 heures" ] ;
	  "Assistance téléphonique", [ `NoTick ;
					   `NoTick ;
					    `Text "2 heures" ] ;
	  "100 accès suppl.", [ `Link ("/contact", "Nous Contacter") ;
					 `Text "400€/an" ;
					 `Text "25€/an" ] ;
	  "Espace disque suppl.", [ `Text "2€/Go/mois" ;
				    `Text "2€/Go/mois" ;
				    `Text "2€/Go/mois" 	] 
	];
    ] *)
  
  (* END PAGES -------------------------------------------------------------- *)
] 