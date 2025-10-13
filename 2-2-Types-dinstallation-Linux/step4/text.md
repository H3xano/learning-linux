# ☁️ Étape 4 — Détecter la virtualisation (VM)

Une **machine virtuelle** est un ordinateur hébergé dans un autre.  
Même sans outil graphique, on peut repérer des signes de virtualisation 👇

```bash
lscpu | grep -i hypervisor || echo "Pas de hyperviseur détecté"
dmesg | grep -i virtual | head -n 10 || true
lsmod | grep -i virt || true
````

👉 Si tu vois les mots `KVM`, `VirtualBox`, `VMware` ou `Hyper-V`,
tu es bien dans une **machine virtuelle**. 🎯

💬 Avantage : tu peux **expérimenter sans casser ton PC**.
C’est pour cela que les labs Formip et Killercoda utilisent des VMs :
elles permettent d’apprendre, tester, réinitialiser… sans risque ! 🧱🔁