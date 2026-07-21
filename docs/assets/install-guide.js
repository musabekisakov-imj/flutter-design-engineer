document.documentElement.classList.add("js");

const tabs = [...document.querySelectorAll('[role="tab"]')];
const panels = [...document.querySelectorAll('[role="tabpanel"]')];
const copyStatus = document.querySelector("#copy-status");

function activateTab(nextTab, moveFocus = false) {
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
  tab.addEventListener("click", () => activateTab(tab));
  tab.addEventListener("keydown", (event) => {
    let nextIndex;
    if (event.key === "ArrowRight") nextIndex = (index + 1) % tabs.length;
    if (event.key === "ArrowLeft") nextIndex = (index - 1 + tabs.length) % tabs.length;
    if (event.key === "Home") nextIndex = 0;
    if (event.key === "End") nextIndex = tabs.length - 1;
    if (nextIndex === undefined) return;
    event.preventDefault();
    activateTab(tabs[nextIndex], true);
  });
});

if (tabs.length) activateTab(tabs[0]);

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
      copyStatus.textContent = "Copied to clipboard.";
    } catch {
      button.textContent = "Select text";
      copyStatus.textContent = "Clipboard access failed. Select the command text and copy it manually.";
    }

    window.setTimeout(() => {
      button.textContent = original;
      button.classList.remove("is-copied");
    }, 2000);
  });
});
