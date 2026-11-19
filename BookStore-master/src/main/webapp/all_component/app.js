document.documentElement.classList.add("js-enabled");

document.addEventListener("DOMContentLoaded", () => {
  const cards = document.querySelectorAll(".book-section .crd-ho, .catalog-page .crd-ho");
  if (!("IntersectionObserver" in window)) {
    cards.forEach((card) => card.classList.add("is-visible"));
    return;
  }

  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add("is-visible");
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.12 });

  cards.forEach((card) => observer.observe(card));
});
