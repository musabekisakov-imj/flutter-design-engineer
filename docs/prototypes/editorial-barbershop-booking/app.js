const screens = {
  service: {
    index: "01",
    title: "Start with the decision that changes everything else.",
    copy: "Duration and price stay adjacent to each service. Continue is unavailable until the choice is explicit.",
    bullets: ["Selection uses icon, border, and tone", "Touch targets remain at least 48 px", "Summary begins immediately"],
    progress: "20%",
    summary: ["Signature cut", "Not selected", "Not selected", "€42"],
    content: `
      <span class="screen-step">Service</span>
      <h2>What brings you in?</h2>
      <p class="screen-intro">Choose one service. You can change it before confirming.</p>
      <div class="service-list">
        <button class="choice-row selected"><span><strong>Signature cut</strong><small>Consultation, tailored cut, wash and finish. 45 min</small></span><span class="price">€42</span></button>
        <button class="choice-row"><span><strong>Cut &amp; beard</strong><small>Full haircut with beard shape and hot towel. 70 min</small></span><span class="price">€64</span></button>
        <button class="choice-row"><span><strong>Beard ritual</strong><small>Shape, steam towel and conditioning finish. 30 min</small></span><span class="price">€30</span></button>
      </div>`,
    action: `<button class="primary-button">Choose a barber</button>`
  },
  barber: {
    index: "02",
    title: "People are compared through useful differences.",
    copy: "Expertise and next availability do the work. Portraits establish trust without becoming oversized profile cards.",
    bullets: ["Any available remains a practical option", "Portraits are fictional local assets", "Service choice stays visible"],
    progress: "40%",
    summary: ["Signature cut", "Idris Cole", "Not selected", "€42"],
    content: `
      <span class="screen-step">Barber</span>
      <h2>Who do you prefer?</h2>
      <p class="screen-intro">Each barber is available for your selected service.</p>
      <div class="barber-list">
        <button class="barber-row selected"><span class="barber-photo one"></span><span><strong>Idris Cole</strong><small>Precision fades, textured cuts<br>Next opening 14:30</small></span><span class="checkmark">✓</span></button>
        <button class="barber-row"><span class="barber-photo two"></span><span><strong>Bek Nur</strong><small>Classic scissor work, styling<br>Next opening 15:15</small></span><span></span></button>
        <button class="barber-row"><span class="barber-photo three"></span><span><strong>Mara Rossi</strong><small>Long hair, shape and texture<br>Next opening Friday</small></span><span></span></button>
      </div>`,
    action: `<button class="primary-button">Choose a time</button>`
  },
  time: {
    index: "03",
    title: "Availability is compact, calm, and honest.",
    copy: "Time is grouped only when options exist. Unavailable slots remain legible, but cannot be selected.",
    bullets: ["Changing date clears only the time", "Local date is explicit", "Empty and failure states stay in place"],
    progress: "60%",
    summary: ["Signature cut", "Idris Cole", "Wed 23 Jul, 14:30", "€42"],
    content: `
      <span class="screen-step">Date &amp; time</span>
      <h2>Choose a time</h2>
      <p class="screen-intro">Times shown in the shop's local time.</p>
      <div class="date-strip">
        <button class="date-button"><span>MON</span><strong>21</strong></button>
        <button class="date-button"><span>TUE</span><strong>22</strong></button>
        <button class="date-button selected"><span>WED</span><strong>23</strong></button>
        <button class="date-button"><span>THU</span><strong>24</strong></button>
        <button class="date-button"><span>FRI</span><strong>25</strong></button>
      </div>
      <div class="time-group"><h3>Morning</h3><div class="time-grid"><button>09:30</button><button>10:15</button><button disabled>11:30</button></div></div>
      <div class="time-group"><h3>Afternoon</h3><div class="time-grid"><button>13:15</button><button class="selected">14:30</button><button>15:15</button></div></div>`,
    action: `<button class="primary-button">Review booking</button>`
  },
  review: {
    index: "04",
    title: "The final action is preceded by one truthful review.",
    copy: "Every choice can be edited. Persistent labels and inline validation protect the customer details.",
    bullets: ["No hidden fees or optional fields disguised as required", "Input survives earlier edits", "Duplicate submission is prevented"],
    progress: "80%",
    summary: ["Signature cut", "Idris Cole", "Wed 23 Jul, 14:30", "€42"],
    content: `
      <span class="screen-step">Review</span>
      <h2>Check your visit</h2>
      <div class="review-summary">
        <div><span>Service</span><strong>Signature cut, €42</strong><button>Edit</button></div>
        <div><span>Barber</span><strong>Idris Cole</strong><button>Edit</button></div>
        <div><span>When</span><strong>Wed 23 Jul, 14:30</strong><button>Edit</button></div>
      </div>
      <div class="form-grid">
        <div class="field"><label for="prototype-name">Your name</label><input id="prototype-name" value="Alex Morgan" /></div>
        <div class="field"><label for="prototype-phone">Mobile number</label><input id="prototype-phone" value="+31 6 1234 5678" /></div>
      </div>`,
    action: `<button class="primary-button">Confirm and reserve, €42</button>`
  },
  success: {
    index: "05",
    title: "Completion is useful, not performative.",
    copy: "The confirmation repeats the reservation and offers one clear next action. There is no confetti or unrelated upsell.",
    bullets: ["Local date and time are repeated", "Calendar is secondary", "The booking reference is selectable"],
    progress: "100%",
    summary: ["Signature cut", "Idris Cole", "Wed 23 Jul, 14:30", "€42"],
    content: `
      <div class="confirmation">
        <div>
          <span class="confirmation-mark">✓</span>
          <span class="screen-step">Confirmed</span>
          <h2>Your chair is reserved.</h2>
          <p class="screen-intro">A confirmation has been sent to your mobile.</p>
          <div class="confirmation-card"><strong>Wednesday, 23 July at 14:30</strong><span>Signature cut with Idris Cole, 45 min</span><span>North &amp; Row, 18 Mercer Street</span></div>
        </div>
      </div>`,
    action: `<button class="primary-button">View booking</button>`
  }
};

const phoneContent = document.querySelector("#phone-content");
const phoneAction = document.querySelector("#phone-action");
const progress = document.querySelector(".progress-fill");
const progressRegion = document.querySelector(".progress");
const noteIndex = document.querySelector("#note-index");
const noteTitle = document.querySelector("#note-title");
const noteCopy = document.querySelector("#note-copy");
const noteList = document.querySelector("#note-list");
const summaryValues = [...document.querySelectorAll("#live-summary dd")];
const tabs = [...document.querySelectorAll("[data-screen]")];

function showScreen(key) {
  const screen = screens[key];
  phoneContent.innerHTML = screen.content;
  phoneAction.innerHTML = screen.action;
  progress.style.setProperty("--progress", screen.progress);
  progressRegion.setAttribute("aria-label", `Booking progress, step ${Number(screen.index)} of 5`);
  noteIndex.textContent = screen.index;
  noteTitle.textContent = screen.title;
  noteCopy.textContent = screen.copy;
  noteList.innerHTML = screen.bullets.map((item) => `<li>${item}</li>`).join("");
  summaryValues.forEach((value, index) => { value.textContent = screen.summary[index]; });
  tabs.forEach((tab) => tab.setAttribute("aria-selected", String(tab.dataset.screen === key)));
}

tabs.forEach((tab) => tab.addEventListener("click", () => showScreen(tab.dataset.screen)));
showScreen("service");
