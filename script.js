function processCSV(data) {
    console.log(data); // Log the raw data to check its structure
    const tableBody = document.querySelector("#resultatsTable tbody");

    data.forEach(row => {
        const rowElement = document.createElement("tr");
        rowElement.innerHTML = `
            <td>${row["Adresse mail"] || 'N/A'}</td>
            <td>${row["Quel est votre rôle dans votre organisation ?"] || 'N/A'}</td>
            <td>${row["Utilisez-vous actuellement des dispositifs IoT dans votre environnement ?"] || 'N/A'}</td>
            <td>${row["Si oui, quels types de dispositifs IoT utilisez-vous ? (cochez toutes les réponses applicables)"] || 'N/A'}</td>
            <td>${row["Avez-vous déjà rencontré des problèmes de sécurité avec vos dispositifs IoT ?"] || 'N/A'}</td>
            <td>${row["À quelle fréquence surveillez vous l'état de vos dispositifs IoT ?"] || 'N/A'}</td>
            <td>${row["Quelles fonctionnalités seriez vous le plus intéressé à avoir dans un système de surveillance IoT ? (cochez toutes les réponses applicables)"] || 'N/A'}</td>
            <td>${row["Comment préférez-vous être averti en cas d'anomalie détectée ?"] || 'N/A'}</td>
            <td>${row["Avez-vous des suggestions ou des préoccupations concernant la sécurité des dispositifs IoT ?"] || 'N/A'}</td>
            <td>${row["Souhaitez-vous être informé des développements concernant ce projet ?"] || 'N/A'}</td>
        `;
        tableBody.appendChild(rowElement);
    });
}
