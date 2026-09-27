# CloudFolio

Personal portfolio deployed by AWS CodePipeline + CodeDeploy to an EC2 server running Nginx.

## Rules

- Plain HTML, CSS, vanilla JS. No frameworks, no build step, no npm.
- Only edit files inside ./site. NEVER edit appspec.yml or scripts/ unless asked.
- The page <title> and the main <h1> MUST contain the word "CloudFolio" (the deploy health check looks for it).
- Images and the CV are NOT in git. Reference them as assets/CV.pdf
- Footer must contain <small id="deploy-info"></small>; keep the existing fetch of /deploy-info.json in app.js.
- Mobile-first, accessible (alt text, semantic tags), light/dark via prefers-color-scheme.
