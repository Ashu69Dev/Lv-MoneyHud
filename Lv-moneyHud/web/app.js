const hud = document.getElementById('hud');
const logo = document.getElementById('server-logo');

const elCash = document.getElementById('val-cash');
const elBank = document.getElementById('val-bank');
const elJob  = document.getElementById('val-job');
const elId   = document.getElementById('val-id');

const rowCash = document.getElementById('row-cash');
const rowBank = document.getElementById('row-bank');
const rowJob  = document.getElementById('row-job');
const rowId   = document.getElementById('row-id');

function setVisibility(v){
  if(v){ hud.classList.remove('hidden'); } else { hud.classList.add('hidden'); }
}

function setPosition(pos){
  if(!pos) return;
  hud.style.right = (pos.right ?? 32) + 'px';
  hud.style.top   = (pos.top ?? 32) + 'px';
}

function setScale(scale){
  hud.style.transform = `scale(${scale || 1})`;
}

function formatMoney(n){
  try{
    return '$' + (Number(n)||0).toLocaleString('en-US', { maximumFractionDigits: 0 });
  }catch(e){
    return '$' + (Number(n)||0);
  }
}

function showFlags(flags){
  if(!flags) return;
  rowCash.style.display = flags.showCash ? 'flex' : 'none';
  rowBank.style.display = flags.showBank ? 'flex' : 'none';
  rowJob.style.display  = flags.showJob  ? 'flex' : 'none';
  rowId.style.display   = flags.showId   ? 'flex' : 'none';
}

function applyPayload(p){
  if(!p) return;
  elCash.textContent = formatMoney(p.cash);
  elBank.textContent = formatMoney(p.bank);
  elJob.textContent  = p.job || 'Unemployed';
  elId.textContent   = p.id ?? 0;
}

window.addEventListener('message', (e) => {
  const data = e.data || {};
  if(data.action === 'init'){
    const d = data.data || {};
    setVisibility(!!d.visible);
    setPosition(d.position);
    setScale(d.scale);
    showFlags(d);
    if (d.logoPath) logo.src = d.logoPath;
    applyPayload(d.payload);
  }
  if(data.action === 'update'){
    applyPayload(data.data);
  }
  if(data.action === 'visible'){
    setVisibility(!!(data.data && data.data.visible));
  }
});

// Small entrance effect
setTimeout(() => hud.classList.add('showing'), 10);
