async function loadDeployInfo() {
  const el = document.getElementById("deploy-info");
  if (!el) return;

  try {
    const res = await fetch("/deploy-info.json");
    if (!res.ok) throw new Error(`Request failed: ${res.status}`);
    const data = await res.json();
    const version = data.version || data.commit || "unknown";
    const deployedAt = data.deployedAt || data.timestamp || "";
    el.textContent = deployedAt
      ? `Build ${version} · deployed ${deployedAt}`
      : `Build ${version}`;
  } catch (err) {
    el.textContent = "";
  }
}

document.addEventListener("DOMContentLoaded", loadDeployInfo);
