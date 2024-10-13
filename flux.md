```mermaid
graph TD
    A[Début] --> B[Adresse mail]
    B --> C[Quel est votre rôle dans votre organisation ?]
    C -->|Développeur| D[Développeur]
    C -->|Administrateur réseau| E[Administrateur réseau]
    C -->|Utilisateur final| F[Utilisateur final]
    C -->|Autre| G[Autre]

    B --> H[Utilisez-vous actuellement des dispositifs IoT dans votre environnement ?]
    H -->|Souvent| I[Souvent]
    H -->|Parfois| J[Parfois]
    H -->|Rarement| K[Rarement]

    H --> L[Si oui, quels types de dispositifs IoT utilisez-vous ?]
    
    B --> M[Avez-vous déjà rencontré des problèmes de sécurité avec vos dispositifs IoT ?]
    M -->|Oui| N[Oui]
    M -->|Non| O[Non]
    N --> P[Si oui, veuillez décrire brièvement le type de problème rencontré]

    B --> Q[À quelle fréquence surveillez-vous l'état de vos dispositifs IoT ?]
    Q -->|En temps réel| R[En temps réel]
    Q -->|Quotidiennement| S[Quotidiennement]
    Q -->|Hebdomadairement| T[Hebdomadairement]
    Q -->|Mensuellement| U[Mensuellement]
    Q -->|Rarement| V[Rarement]

    B --> W[Quelles fonctionnalités seriez-vous le plus intéressé à avoir dans un système de surveillance IoT ?]

    B --> X[Comment préférez-vous être averti en cas d'anomalie détectée ?]

    B --> Y[Avez-vous des suggestions ou des préoccupations concernant la sécurité des dispositifs IoT ?]
    
    B --> Z[Souhaitez-vous être informé des développements concernant ce projet ?]
    Z -->|Oui| AA[Oui]
    Z -->|Non| AB[Non]

    B --> AC[Fin]
