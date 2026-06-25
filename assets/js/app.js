// Threshold — JavaScript entry point.
//
// Import feature modules here; Hugo's built-in esbuild bundles them into a
// single fingerprinted file. Keep it dependency-free — no npm, no package.json.
//
// Example (later): import { initCarousel } from "./features/carousel.js";

// Signal that JavaScript is active, so CSS can progressively enhance
// (e.g. `html.js .needs-js { ... }`).
document.documentElement.classList.add("js");
