document.documentElement.classList.add("js");

const copyStatus = document.querySelector("#copy-status");
const menuButton = document.querySelector(".menu-button");
const primaryNav = document.querySelector("#primary-nav");

function setupTablist(tablist) {
  const tabs = [...tablist.querySelectorAll(':scope > [role="tab"]')];
  const panels = tabs
    .map((tab) => document.getElementById(tab.getAttribute("aria-controls")))
    .filter(Boolean);

  function activate(nextTab, moveFocus = false) {
    tabs.forEach((tab) => {
      const selected = tab === nextTab;
      tab.setAttribute("aria-selected", String(selected));
      tab.tabIndex = selected ? 0 : -1;
    });
    panels.forEach((panel) => {
      panel.hidden = panel.id !== nextTab.getAttribute("aria-controls");
    });
    if (moveFocus) nextTab.focus();
  }

  tabs.forEach((tab, index) => {
    tab.addEventListener("click", () => activate(tab));
    tab.addEventListener("keydown", (event) => {
      let nextIndex;
      if (event.key === "ArrowRight" || event.key === "ArrowDown") nextIndex = (index + 1) % tabs.length;
      if (event.key === "ArrowLeft" || event.key === "ArrowUp") nextIndex = (index - 1 + tabs.length) % tabs.length;
      if (event.key === "Home") nextIndex = 0;
      if (event.key === "End") nextIndex = tabs.length - 1;
      if (nextIndex === undefined) return;
      event.preventDefault();
      activate(tabs[nextIndex], true);
    });
  });

  const selected = tabs.find((tab) => tab.getAttribute("aria-selected") === "true") || tabs[0];
  if (selected) activate(selected);
}

document.querySelectorAll('[role="tablist"]').forEach(setupTablist);

if (menuButton && primaryNav) {
  function closeMenu() {
    menuButton.setAttribute("aria-expanded", "false");
    primaryNav.classList.remove("is-open");
  }

  menuButton.addEventListener("click", () => {
    const expanded = menuButton.getAttribute("aria-expanded") === "true";
    menuButton.setAttribute("aria-expanded", String(!expanded));
    primaryNav.classList.toggle("is-open", !expanded);
  });

  primaryNav.querySelectorAll("a").forEach((link) => link.addEventListener("click", closeMenu));
  document.addEventListener("keydown", (event) => {
    if (event.key === "Escape") closeMenu();
  });
}

async function copyText(text) {
  if (navigator.clipboard && window.isSecureContext) {
    await navigator.clipboard.writeText(text);
    return;
  }

  const selection = window.getSelection();
  const range = document.createRange();
  const temporary = document.createElement("pre");
  temporary.textContent = text;
  temporary.className = "sr-only";
  document.body.appendChild(temporary);
  range.selectNodeContents(temporary);
  selection.removeAllRanges();
  selection.addRange(range);
  const copied = document.execCommand("copy");
  temporary.remove();
  selection.removeAllRanges();
  if (!copied) throw new Error("Manual copy required");
}

document.querySelectorAll("[data-copy-target]").forEach((button) => {
  button.addEventListener("click", async () => {
    const target = document.getElementById(button.dataset.copyTarget);
    if (!target) return;
    const original = button.textContent;

    try {
      await copyText(target.textContent.trim());
      button.textContent = "Copied";
      button.classList.add("is-copied");
      if (copyStatus) copyStatus.textContent = "Copied to clipboard.";
    } catch {
      button.textContent = "Select text";
      if (copyStatus) copyStatus.textContent = "Clipboard access failed. Select the command and copy it manually.";
    }

    window.setTimeout(() => {
      button.textContent = original;
      button.classList.remove("is-copied");
    }, 2000);
  });
});

const revealItems = [...document.querySelectorAll(".reveal")];
if ("IntersectionObserver" in window && !window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (!entry.isIntersecting) return;
      entry.target.classList.add("is-visible");
      observer.unobserve(entry.target);
    });
  }, { threshold: 0.16 });
  revealItems.forEach((item) => observer.observe(item));
} else {
  revealItems.forEach((item) => item.classList.add("is-visible"));
}
