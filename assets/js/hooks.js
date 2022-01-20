const Hooks = {};

Hooks.Guess = {
  mounted() {
    this.el.addEventListener("focus", () => {
      this.el.value = "";
    });

    this.handleEvent("guesses_reset", () => (this.el.value = ""));
  },
};

Hooks.GuessContainer = {
  mounted() {
    this.handleEvent("guesses_reset", () => {
      if (document.getElementById("guess_0")) {
        document.getElementById("guess_0").focus();
      }
    });
  },
};

Hooks.Confetti = {
  mounted() {
    const jsConfetti = new JSConfetti();
    this.handleEvent("won", () => jsConfetti.addConfetti());
  },
};

export default Hooks;
