const additionalKnowledges = document.querySelectorAll('.additional-knowledge .information');

additionalKnowledges.forEach((knowledge) => {
    knowledge.addEventListener('click', () => knowledge.parentNode.classList.toggle('active'))
});
